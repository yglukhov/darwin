import macros

{.passL: "-framework Foundation".}

type
    NSObject* = ptr object {.pure, inheritable.}
    ObjcClass = ptr object of NSObject

    NSString* = ptr object of NSObject

    SEL = distinct pointer

    NSInteger* = int
    NSUInteger* = uint

proc sel_registerName(str: cstring): SEL {.importc.}

proc objc_msgSend() {.importc, cdecl.}
proc objc_msgSend_stret() {.importc, cdecl.}
proc objc_msgSend_fpret() {.importc, cdecl.}

proc objc_getClass(name: cstring): ObjcClass {.importc.}
proc object_getClass(obj: NSObject): ObjcClass {.importc.}

proc class_respondsToSelector(c: ObjcClass, s: SEL): bool {.importc.}

{.push stackTrace: off.}
# These procs should better be inlined, but there's a Nim bug #5945

proc objcClass*(name: static[string]): ObjcClass =
    var c {.global.} = objc_getClass(name)
    return c

proc objcClass*[T](t: typedesc[T]): ObjcClass {.inline.} = objcClass($T)

proc getSelector(name: static[string]): SEL =
    var s {.global.}: SEL
    if pointer(s).isNil:
        s = sel_registerName(name)
    return s

proc respondsToSelector*(obj: NSObject, selector: static[string]): bool =
    class_respondsToSelector(object_getClass(obj), sel_registerName(selector))

{.pop.}

proc getArgsAndTypes(routine: NimNode): (NimNode, NimNode) =
    let args = newNimNode(nnkStmtList)
    let types = newNimNode(nnkStmtList)
    let params = routine.params
    for a in 1 ..< params.len:
        let p = params[a]
        for i in 0 .. p.len - 3:
            args.add(p[i])
            types.add(p[^2])
    result = (args, types)

proc unpackPragmaParams(p1, p2: NimNode): (string, NimNode) =
    if p2.kind == nnkNilLit: ("", p1) else: ($p1, p2)

proc guessSelectorNameFromProc(p: NimNode): string =
    var pName = p.name
    if pName.kind == nnkPostfix:
        pName = pName[^1]
    result = $pName

type ObjCMsgSendFlavor = enum
    normal
    fpret
    stret

template msgSendFlavorForRetType(retType: typedesc): ObjCMsgSendFlavor =
    when (retType is float | float32 | float64 | cfloat | cdouble) and hostCPU == "i386":
        ObjCMsgSendFlavor.fpret
    elif (retType is object | tuple) and sizeof(retType) > sizeof(pointer) * 2: # TODO: sizeof check is a dangerous guess here! Please help.
        ObjCMsgSendFlavor.stret
    else:
        ObjCMsgSendFlavor.normal

macro objcAux(flavor: static[ObjCMsgSendFlavor], firstArg: typed, name: static[string], body: untyped): untyped =
    var name = name

    let performSend = ident"performSend"

    let senderParams = newNimNode(nnkFormalParams)
    if flavor == stret:
        senderParams.add(ident"void")
        senderParams.add(newIdentDefs(ident"_", ident"pointer"))
    else:
        senderParams.add(copyNimTree(body.params[0]))
    senderParams.add(newIdentDefs(ident"self", bindSym"NSObject"))
    senderParams.add(newIdentDefs(ident"selector", bindSym"SEL"))

    let procTy = newTree(nnkProcTy, senderParams)
    procTy.add(newTree(nnkPragma, ident"cdecl", ident"gcsafe"))

    let objcSendProc = case flavor
        of fpret: bindSym"objc_msgSend_fpret"
        of stret: bindSym"objc_msgSend_stret"
        else: bindSym"objc_msgSend"

    let sendProc = newTree(nnkCast, procTy, objcSendProc)

    let castSendProc = newTree(nnkLetSection, newIdentDefs(performSend, newEmptyNode(), sendProc))

    let call = newCall(performSend)

    let (args, argTypes) = body.getArgsAndTypes()

    if flavor == stret:
        call.add(newCall("addr", ident"result"))

    call.add(firstArg)

    if name.len == 0:
        name = guessSelectorNameFromProc(body)

    call.add(newCall(bindSym"getSelector", newLit(name))) # selector

    for i in 1 ..< args.len:
        senderParams.add(newIdentDefs(args[i], argTypes[i], newEmptyNode()))
        call.add(args[i])

    result = newStmtList(castSendProc, call)

macro objc*(name: untyped, body: untyped = nil): untyped =
    var (name, body) = unpackPragmaParams(name, body)
    var retType = body.params[0]
    if retType.kind == nnkEmpty: retType = ident"void"

    let (args, argTypes) = body.getArgsAndTypes()

    let firstArgTyp = argTypes[0]
    let isStatic = firstArgTyp.kind == nnkBracketExpr and firstArgTyp[0].kind == nnkIdent and $(firstArgTyp[0]) == "typedesc"
    let firstArg = if isStatic:
            newCall(ident"objcClass", args[0])
        else:
            args[0]

    result = copyNimTree(body)
    result.body = newCall(bindSym"objcAux",
        newCall(bindSym"msgSendFlavorForRetType", retType),
        firstArg,
        newLit(name), body)
    result.addPragma(ident"inline")

proc NSLog*(str: NSString) {.importc, varargs.}

proc retainAux(o: NSObject): NSObject {.objc: "retain".}
template retain*[T: NSObject](o: T): T = cast[T](retainAux(o))
proc release*(o: NSObject) {.objc.}
proc alloc*[T: NSObject](n: typedesc[T]): T {.objc: "alloc".}
proc initAux(v: NSObject): NSObject {.objc: "init".}
proc init*[T: NSObject](v: T): T {.inline.} = cast[T](initAux(v))

proc isKindOfClass(o: NSObject, c: ObjcClass): bool {.objc: "isKindOfClass:".}
proc isKindOfClass*(o: NSObject, c: typedesc): bool = o.isKindOfClass(c.objcClass())
