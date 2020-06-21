import strutils
import ../objc/runtime


type NSNumber* = ptr object of NSObject


type NSNumberTypes* = enum
    ntChar = "c"
    ntInt = "i"
    ntShort = "s"
    ntLong = "l"
    ntLongLong = "q"
    ntUnsignedChar = "C"
    ntUnsignedInt = "I"
    ntUnsignedShort = "S"
    ntUnsignedLong = "L"
    ntUnsignedLongLong = "Q"
    ntFloat = "f"
    ntDouble = "d"
    ntBool = "B"


proc withBool*(t: typedesc[NSNumber], b: bool): NSNumber {.objc: "numberWithBool:".}
proc withDouble*(t: typedesc[NSNumber], f: float64): NSNumber {.objc: "numberWithDouble:".}
proc withFloat*(t: typedesc[NSNumber], f: float32): NSNumber {.objc: "numberWithFloat:".}
proc withInt*(t: typedesc[NSNumber], i: int16): NSNumber {.objc: "numberWithInt:".}
proc withInt*(t: typedesc[NSNumber], i: int32): NSNumber {.objc: "numberWithInt:".}
proc withLong*(t: typedesc[NSNumber], i: int32): NSNumber {.objc: "numberWithLong:".}
proc withLongLong*(t: typedesc[NSNumber], i: int64): NSNumber {.objc: "numberWithLongLong:".}
proc withShort*(t: typedesc[NSNumber], i: int16): NSNumber {.objc: "numberWithShort:".}


proc boolValue*(n: NSNumber): bool {.objc.}
proc doubleValue*(n: NSNumber): float64 {.objc.}
proc floatValue*(n: NSNumber): float32 {.objc.}
proc intValue*(n: NSNumber): int32 {.objc.}
proc longValue*(n: NSNumber): int32 {.objc.}
proc longLongValue*(n: NSNumber): int64 {.objc.}
proc shortValue*(n: NSNumber): int16 {.objc.}
proc stringValue*(n: NSNumber): NSString {.objc.}

proc objCType*(n: NSNumber): cstring {.objc.}
proc numberType*(n: NSNumber): NSNumberTypes =
    result = parseEnum[NSNumberTypes]($n.objCType())
