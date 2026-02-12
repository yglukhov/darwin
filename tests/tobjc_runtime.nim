import darwin/objc/runtime
import darwin/foundation/nsgeometry

type
    NSNumber = ptr object of NSObject
    NSValue = ptr object of NSObject

proc valueWithRect(n: typedesc[NSValue], d: NSRect): NSValue {.objc: "valueWithRect:".}
proc valueWithPoint(n: typedesc[NSValue], d: NSPoint): NSValue {.objc: "valueWithPoint:".}
proc rectValue(n: NSValue): NSRect {.objc.}
proc pointValue(n: NSValue): NSPoint {.objc.}
proc description(n: NSValue): NSString {.objc.}


proc numberWithDouble(n: typedesc[NSNumber], d: float): NSNumber {.objc: "numberWithDouble:".}
proc numberWithFloat(n: typedesc[NSNumber], d: cfloat): NSNumber {.objc: "numberWithFloat:".}

proc doubleValue(n: NSNumber): float {.objc: "doubleValue".}
proc floatValue(n: NSNumber): cfloat {.objc: "floatValue".}

proc UTF8String(n: NSString): cstring {.objc: "UTF8String".}


proc alloc*[T](o: typedesc[T]): T {.objc: "alloc".}

proc initWithUTF8String(o: NSString, str: cstring): NSString {.objc: "initWithUTF8String:".}

let a = NSString.alloc().initWithUTF8String("This is a test!")

let n = NSNumber.numberWithDouble(123.456)
let nf = NSNumber.numberWithFloat(123.456)

doAssert(n.doubleValue > 123 and n.doubleValue < 124)
doAssert(nf.floatValue > 123 and nf.floatValue < 124)
doAssert($a.UTF8String == "This is a test!")

block:
    let v = NSValue.valueWithRect(NSMakeRect(1, 2, 3, 4))
    doAssert($v.description.UTF8String == "NSRect: {{1, 2}, {3, 4}}")
    doAssert(v.rectValue == NSMakeRect(1, 2, 3, 4))

block:
    let v = NSValue.valueWithPoint(NSMakePoint(1, 2))
    doAssert($v.description.UTF8String == "NSPoint: {1, 2}")
    doAssert(v.pointValue == NSMakePoint(1, 2))


a.release()

block:
    let nsObjectClass = getClass("NSObject")
    doAssert(nsObjectClass != nil)

    doAssert(selector("init") == sel_registerName("init"))

    let allocObj = init(cast[NSObject](alloc(nsObjectClass)))
    doAssert(allocObj != nil)
    allocObj.release()

    let newObj = cast[NSObject](new(nsObjectClass))
    doAssert(newObj != nil)
    newObj.release()

block:
    const
        BaseClassName = "NimRuntimeAddClassBase"
        SubClassName = "NimRuntimeAddClassSub"

    var
        basePingCount = 0
        subPingCount = 0

    proc basePing(self: ID, cmd: SEL) {.cdecl.} =
        inc(basePingCount)

    proc ping(self: NSObject) {.objc.}

    var baseCls: ObjcClass
    addClass(BaseClassName, "NSObject", baseCls):
        addMethod("ping", basePing)
    doAssert(baseCls != nil)
    doAssert(getClass(BaseClassName) == baseCls)

block:
    const
        BaseClassName = "NimRuntimeCallSuperBase"
        SubClassName = "NimRuntimeCallSuperSub"

    var
        baseSum = 0
        subCallCount = 0
        subReceived = 0

    proc addBase(self: ID, cmd: SEL, value: cint): cint {.cdecl.} =
        baseSum += value.int
        baseSum.cint

    proc addSub(self: ID, cmd: SEL, value: cint): cint {.cdecl.} =
        inc(subCallCount)
        subReceived = value.int
        result = callSuper(cint, cast[NSObject](self), cmd, value)
        inc(result)

    proc addValue(self: NSObject, value: cint): cint {.objc: "addValue:".}

    let baseCls = allocateClassPair(getClass("NSObject"), BaseClassName, 0)
    discard addMethod(baseCls, selector("addValue:"), addBase)
    registerClassPair(baseCls)
    doAssert(baseCls != nil)

    let subCls = allocateClassPair(baseCls, SubClassName, 0)
    discard addMethod(subCls, selector("addValue:"), addSub)
    registerClassPair(subCls)
    doAssert(subCls != nil)

    let o = cast[NSObject](new(subCls))
    let actual = addValue(o, 10)
    doAssert(actual == 11)
    doAssert(baseSum == 10)
    doAssert(subCallCount == 1)
    doAssert(subReceived == 10)
    o.release()

block:
    const
        BaseClassName = "NimRuntimeCallSuperImplicitRetBase"
        SubClassName = "NimRuntimeCallSuperImplicitRetSub"

    var
        baseCallCount = 0
        subCallCount = 0
        subReceived: ID

    proc identityBase(self: ID, cmd: SEL, value: ID): ID {.cdecl.} =
        inc(baseCallCount)
        value

    proc identitySub(self: ID, cmd: SEL, value: ID): ID {.cdecl.} =
        inc(subCallCount)
        subReceived = value
        result = callSuper(cast[NSObject](self), cmd, value)

    proc identity(self: NSObject, value: NSObject): NSObject {.objc: "identity:".}

    let baseCls = allocateClassPair(getClass("NSObject"), BaseClassName, 0)
    discard addMethod(baseCls, selector("identity:"), identityBase)
    registerClassPair(baseCls)
    doAssert(baseCls != nil)

    let subCls = allocateClassPair(baseCls, SubClassName, 0)
    discard addMethod(subCls, selector("identity:"), identitySub)
    registerClassPair(subCls)
    doAssert(subCls != nil)

    let o = cast[NSObject](new(subCls))
    let arg = cast[NSObject](new(getClass("NSObject")))
    let actual = identity(o, arg)
    doAssert(actual == arg)
    doAssert(subReceived == cast[ID](arg))
    doAssert(baseCallCount == 1)
    doAssert(subCallCount == 1)
    arg.release()
    o.release()

block:
    const
        BaseClassName = "NimRuntimeCallSuperNoArgsBase"
        SubClassName = "NimRuntimeCallSuperNoArgsSub"

    var
        baseCallCount = 0
        subCallCount = 0

    proc valueBase(self: ID, cmd: SEL): cint {.cdecl.} =
        inc(baseCallCount)
        41

    proc valueSub(self: ID, cmd: SEL): cint {.cdecl.} =
        inc(subCallCount)
        result = callSuper(cint, cast[NSObject](self), cmd)
        inc(result)

    proc value(self: NSObject): cint {.objc: "value".}

    let baseCls = allocateClassPair(getClass("NSObject"), BaseClassName, 0)
    discard addMethod(baseCls, selector("value"), valueBase)
    registerClassPair(baseCls)
    doAssert(baseCls != nil)

    let subCls = allocateClassPair(baseCls, SubClassName, 0)
    discard addMethod(subCls, selector("value"), valueSub)
    registerClassPair(subCls)
    doAssert(subCls != nil)

    let o = cast[NSObject](new(subCls))
    let actual = value(o)
    doAssert(actual == 42)
    doAssert(baseCallCount == 1)
    doAssert(subCallCount == 1)
    o.release()

block:
    const
        BaseClassName = "NimRuntimeCallSuperNoArgsImplicitRetBase"
        SubClassName = "NimRuntimeCallSuperNoArgsImplicitRetSub"

    var
        baseCallCount = 0
        subCallCount = 0

    proc selfObjectBase(self: ID, cmd: SEL): ID {.cdecl.} =
        inc(baseCallCount)
        self

    proc selfObjectSub(self: ID, cmd: SEL): ID {.cdecl.} =
        inc(subCallCount)
        result = callSuper(cast[NSObject](self), cmd)

    proc selfObject(self: NSObject): NSObject {.objc: "selfObject".}

    let baseCls = allocateClassPair(getClass("NSObject"), BaseClassName, 0)
    discard addMethod(baseCls, selector("selfObject"), selfObjectBase)
    registerClassPair(baseCls)
    doAssert(baseCls != nil)

    let subCls = allocateClassPair(baseCls, SubClassName, 0)
    discard addMethod(subCls, selector("selfObject"), selfObjectSub)
    registerClassPair(subCls)
    doAssert(subCls != nil)

    let o = cast[NSObject](new(subCls))
    let actual = selfObject(o)
    doAssert(cast[ID](actual) == cast[ID](o))
    doAssert(baseCallCount == 1)
    doAssert(subCallCount == 1)
    o.release()

when not defined(arm64):
    block:
        const
            BaseClassName = "NimRuntimeCallSuperStretBase"
            SubClassName = "NimRuntimeCallSuperStretSub"

        var
            baseRectCount = 0
            subRectCount = 0

        proc testRectBase(self: ID, cmd: SEL): NSRect {.cdecl.} =
            inc(baseRectCount)
            NSMakeRect(1, 2, 30, 40)

        proc testRectSub(self: ID, cmd: SEL): NSRect {.cdecl.} =
            inc(subRectCount)
            result = callSuper(NSRect, cast[NSObject](self), cmd)
            result.origin.x += 10
            result.size.width += 5

        proc testRect(self: NSObject): NSRect {.objc: "testRect".}

        var baseCls: ObjcClass
        addClass(BaseClassName, "NSObject", baseCls):
            addMethod("testRect", testRectBase)
        doAssert(baseCls != nil)

        var subCls: ObjcClass
        addClass(SubClassName, BaseClassName, subCls):
            addMethod("testRect", testRectSub)
        doAssert(subCls != nil)

        let o = cast[NSObject](new(subCls))
        let r = testRect(o)
        doAssert(r == NSMakeRect(11, 2, 35, 40))
        doAssert(baseRectCount == 1)
        doAssert(subRectCount == 1)
        o.release()
