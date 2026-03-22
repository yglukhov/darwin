import ../objc/runtime
import nsdate, nsrunloop

type NSTimer* = ptr object of NSObject

# Class methods for creating timers
proc timerWithTimeInterval*(t: typedesc[NSTimer], interval: NSTimeInterval, target: NSObject, aSelector: SEL, userInfo: NSObject, repeats: BOOL): NSTimer {.objc: "timerWithTimeInterval:target:selector:userInfo:repeats:".}
  
proc scheduledTimerWithTimeInterval*(t: typedesc[NSTimer], interval: NSTimeInterval, target: NSObject, aSelector: SEL, userInfo: NSObject, repeats: BOOL): NSTimer {.objc: "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:".}

# Instance methods
proc initWithFireDate*(timer: NSTimer, date: NSDate, interval: NSTimeInterval, target: NSObject, aSelector: SEL, userInfo: NSObject, repeats: BOOL): NSTimer {.objc: "initWithFireDate:interval:target:selector:userInfo:repeats:".}

proc fire*(timer: NSTimer) {.objc.}

proc invalidate*(timer: NSTimer) {.objc.}

proc isValid*(timer: NSTimer): BOOL {.objc.}

proc fireDate*(timer: NSTimer): NSDate {.objc.}

proc `fireDate=`*(timer: NSTimer, date: NSDate) {.objc: "setFireDate:".}

proc timeInterval*(timer: NSTimer): NSTimeInterval {.objc.}

proc userInfo*(timer: NSTimer): NSObject {.objc.}

proc tolerance*(timer: NSTimer): NSTimeInterval {.objc.}

proc `tolerance=`*(timer: NSTimer, tolerance: NSTimeInterval) {.objc: "setTolerance:".}

# Schedule and remove from run loop
proc scheduleInRunLoop*(timer: NSTimer, runLoop: NSRunLoop, forMode: NSRunLoopMode) {.objc: "scheduleInRunLoop:forMode:".}
