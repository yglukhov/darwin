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
