import darwin.objc.runtime

type
    NSNumber = ptr object of NSObject

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

a.release()
