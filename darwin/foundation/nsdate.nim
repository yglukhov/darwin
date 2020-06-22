import times
import ../objc/runtime


type NSTimeInterval* = cdouble
type NSDate* = ptr object of NSObject


proc withTimeIntervalSinceNow*(t: typedesc[NSDate], sec: NSTimeInterval): NSDate {.objc: "dateWithTimeIntervalSinceNow:".}
proc withTimeInterval*(t: typedesc[NSDate], sec: NSTimeInterval, sinceDate: NSDate): NSDate {.objc: "dateWithTimeInterval:sinceDate:".}
proc withTimeIntervalSinceReferenceDate*(t: typedesc[NSDate], sec: NSTimeInterval): NSDate {.objc: "dateWithTimeIntervalSinceReferenceDate:".}
proc withTimeIntervalSince1970*(t: typedesc[NSDate], sec: NSTimeInterval): NSDate {.objc: "dateWithTimeIntervalSince1970:".}

proc timeIntervalSince1970*(d: NSDate): float {.objc.}

converter toTime*(d: NSDate): Time =
  when declared(fromUnixFloat):
    fromUnixFloat(d.timeIntervalSince1970())
  else:
    fromSeconds(d.timeIntervalSince1970())
