import typetraits, macros

{.passL: "-framework Foundation".}

type SEL = distinct pointer

type
    NSObject = ptr object {.pure, inheritable.}
    ObjcClass = ptr object of NSObject
    NSString = ptr object of NSObject

proc sel_registerName(str: cstring): SEL {.importc.}

proc objc_msgSend() {.importc, cdecl.}
proc objc_msgSend_stret() {.importc, cdecl.}
proc objc_msgSend_fpret() {.importc, cdecl.}

proc objc_getClass(name: cstring): ObjcClass {.importc.}

template msgSendProcForType(t: typed): (proc() {.cdecl.}) =
    when t is float | float32 | float64 | cfloat | cdouble:
        objc_msgSend_fpret
    elif t is object | tuple:
        objc_msgSend_stret
    else:
        objc_msgSend

static: echo hostCPU

{.push stackTrace: off.}
proc objcClass(name: static[string]): ObjcClass {.inline.} =
    var c {.global.} = objc_getClass(name)
    return c

proc objcClass[T](t: typedesc[T]): ObjcClass {.inline.} =
    objcClass(T.name)

proc getSelector(name: static[string]): SEL {.inline.} =
    var s {.global.} = sel_registerName(name)
    return s
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

macro objc*(name: string, body: untyped): untyped =
    result = body

    let performSend = newIdentNode("performSend")

    let senderParams = newNimNode(nnkFormalParams)
    senderParams.add(copyNimTree(body.params[0]))
    senderParams.add(newNimNode(nnkIdentDefs).add(newIdentNode("self"), bindSym"NSObject", newEmptyNode()))
    senderParams.add(newNimNode(nnkIdentDefs).add(newIdentNode("selector"), bindSym"SEL", newEmptyNode()))

    let procTy = newNimNode(nnkProcTy).add(senderParams)
    procTy.add(newNimNode(nnkPragma).add(newIdentNode("cdecl")))

    let objcSendProc = newCall(bindSym"msgSendProcForType", body.params[0])

    let sendProc = newNimNode(nnkCast).add(procTy, objcSendProc)

    let castSendProc = newNimNode(nnkLetSection).add(newNimNode(nnkIdentDefs).add(performSend, newEmptyNode(), sendProc))

    let call = newCall(performSend)

    let (args, argTypes) = result.getArgsAndTypes()

    let firstArgTyp = argTypes[0]
    let isStatic = firstArgTyp.kind == nnkBracketExpr and firstArgTyp[0].kind == nnkIdent and $(firstArgTyp[0]) == "typedesc"

    if isStatic:
        call.add(newCall(bindSym"objcClass", args[0]))
    else:
        call.add(args[0])

    call.add(newCall(bindSym"getSelector", name)) # selector

    for i in 1 ..< args.len:
        senderParams.add(newNimNode(nnkIdentDefs).add(args[i], argTypes[i], newEmptyNode()))
        call.add(args[i])
    result.body = newStmtList(castSendProc, call)
    result.addPragma(newIdentNode("inline"))


# type NSNumber = ptr object of NSObject

# proc numberWithDouble(n: typedesc[NSNumber], d: float): NSNumber {.objc: "numberWithDouble:".}
# proc numberWithFloat(n: typedesc[NSNumber], d: cfloat): NSNumber {.objc: "numberWithFloat:".}

# proc doubleValue(n: NSNumber): float {.objc: "doubleValue".}
# proc floatValue(n: NSNumber): cfloat {.objc: "floatValue".}


# proc alloc*[T](o: typedesc[T]): NSString {.objc: "alloc".}

# proc initWithUTF8String(o: NSString, str: cstring): NSString {.objc: "initWithUTF8String:".}

# let o = NSString.alloc().initWithUTF8String("Hello, world! %@")
# let a = NSString.alloc().initWithUTF8String("This is a test!")

# #a.myMethod("hi")

# proc NSLog(str: NSObject) {.importc, varargs.}

# let n = NSNumber.numberWithDouble(123.456)
# let nf = NSNumber.numberWithFloat(123.456)

# NSLog(o, n)

# echo "dval: ", n.doubleValue
# echo "fval: ", n.floatValue
