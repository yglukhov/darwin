import times
import ../objc/runtime


type NSTimeInterval* = ptr float64
type NSDate* = ptr object of NSObject


proc objcClass*(t: typedesc[NSTimeInterval]): auto {.inline.} = objcClass("NSTimeInterval")
proc objcClass*(t: typedesc[NSDate]): auto {.inline.} = objcClass("NSDate")


proc newDate*(t: typedesc[NSDate]): NSDate {.objc: "date".}

proc withTimeIntervalSinceNow*(t: typedesc[NSDate], sec: NSTimeInterval): NSDate {.objc: "dateWithTimeIntervalSinceNow:".}
proc withTimeInterval*(t: typedesc[NSDate], sec: NSTimeInterval, sinceDate: NSDate): NSDate {.objc: "dateWithTimeInterval:sinceDate:".}
proc withTimeIntervalSinceReferenceDate*(t: typedesc[NSDate], sec: NSTimeInterval): NSDate {.objc: "dateWithTimeIntervalSinceReferenceDate:".}
proc withTimeIntervalSince1970*(t: typedesc[NSDate], sec: NSTimeInterval): NSDate {.objc: "dateWithTimeIntervalSince1970:".}

proc timeIntervalSince1970*(d: NSDate): float {.objc.}

converter toTime*(d: NSDate): Time = fromSeconds(d.timeIntervalSince1970())
