import typetraits, macros

{.passL: "-framework Foundation".}

type
    NSObject* = ptr object {.pure, inheritable.}
    ObjcClass = ptr object of NSObject

    NSString* = ptr object of NSObject

    SEL = distinct pointer

proc sel_registerName(str: cstring): SEL {.importc.}

proc objc_msgSend() {.importc, cdecl.}
proc objc_msgSend_stret() {.importc, cdecl.}
proc objc_msgSend_fpret() {.importc, cdecl.}

proc objc_getClass(name: cstring): ObjcClass {.importc.}
proc object_getClass(obj: NSObject): ObjcClass {.importc.}

proc class_respondsToSelector(c: ObjcClass, s: SEL): bool {.importc.}

template msgSendProcForType(t: typed): (proc() {.cdecl.}) =
    when (t is float | float32 | float64 | cfloat | cdouble) and hostCPU == "i386":
        objc_msgSend_fpret
    elif t is object | tuple:
        objc_msgSend_stret
    else:
        objc_msgSend

{.push stackTrace: off.}
# These procs should better be inlined, but there's a Nim bug #5945

proc objcClass*(name: static[string]): ObjcClass =
    var c {.global.} = objc_getClass(name)
    return c

proc objcClass*[T](t: typedesc[T]): ObjcClass {.inline.} = objcClass(T.name)

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

proc castProc(T: typedesc, p: proc() {.cdecl.}): T {.inline.} =
    type Temp {.union.} = object
        r: T
        p: proc() {.cdecl.}
    var t {.noInit.}: Temp
    t.p = p
    return t.r

macro objc*(name: untyped, body: untyped = nil): untyped =
    var (name, body) = unpackPragmaParams(name, body)
    result = body

    let performSend = newIdentNode("performSend")

    let senderParams = newNimNode(nnkFormalParams)
    senderParams.add(copyNimTree(body.params[0]))
    senderParams.add(newNimNode(nnkIdentDefs).add(newIdentNode("self"), bindSym"NSObject", newEmptyNode()))
    senderParams.add(newNimNode(nnkIdentDefs).add(newIdentNode("selector"), bindSym"SEL", newEmptyNode()))

    let procTy = newNimNode(nnkProcTy).add(senderParams)
    procTy.add(newNimNode(nnkPragma).add(newIdentNode("cdecl")))

    let objcSendProc = newCall(bindSym"msgSendProcForType", body.params[0])

    let sendProc = newCall(bindSym"castProc", procTy, objcSendProc)

    let castSendProc = newNimNode(nnkLetSection).add(newNimNode(nnkIdentDefs).add(performSend, newEmptyNode(), sendProc))

    let call = newCall(performSend)

    let (args, argTypes) = result.getArgsAndTypes()

    let firstArgTyp = argTypes[0]
    let isStatic = firstArgTyp.kind == nnkBracketExpr and firstArgTyp[0].kind == nnkIdent and $(firstArgTyp[0]) == "typedesc"

    if isStatic:
        call.add(newCall(newIdentNode("objcClass"), args[0]))
    else:
        call.add(args[0])

    if name.len == 0:
        name = guessSelectorNameFromProc(body)

    call.add(newCall(bindSym"getSelector", newLit(name))) # selector

    for i in 1 ..< args.len:
        senderParams.add(newNimNode(nnkIdentDefs).add(args[i], argTypes[i], newEmptyNode()))
        call.add(args[i])
    result.body = newStmtList(castSendProc, call)
    result.addPragma(newIdentNode("inline"))

proc NSLog*(str: NSString) {.importc, varargs.}

proc retainAux(o: NSObject): NSObject {.objc: "retain".}
template retain*[T: NSObject](o: T): T = cast[T](retainAux(o))
proc release*(o: NSObject) {.objc.}
proc alloc*[T: NSObject](n: typedesc[T]): T {.objc: "alloc".}
proc initAux(v: NSObject): NSObject {.objc: "init".}
proc init*[T: NSObject](v: T): T {.inline.} = cast[T](initAux(v))

proc isKindOfClass(o: NSObject, c: ObjcClass): bool {.objc: "isKindOfClass:".}
proc isKindOfClass*(o: NSObject, c: typedesc): bool = o.isKindOfClass(c.objcClass())
