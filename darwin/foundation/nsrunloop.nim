import ../objc/runtime
import nsdate

type
    NSRunLoop* = ptr object of NSObject
    NSRunLoopMode* = NSString

var NSDefaultRunLoopMode* {.importc.} : NSRunLoopMode

proc current*(t: typedesc[NSRunLoop]): NSRunLoop {.objc: "currentRunLoop".}
proc run*(s: NSRunLoop) {.objc.}
proc runUntilDate*(s: NSRunLoop, date: NSDate) {.objc: "runUntilDate:".}
