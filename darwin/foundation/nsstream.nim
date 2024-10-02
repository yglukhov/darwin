import ../objc/runtime
import nsdata, nsrunloop

type
  NSStream* = ptr object of NSObject
  NSInputStream* = ptr object of NSStream
  NSOutputStream* = ptr object of NSStream

  NSStreamEvent* {.size: sizeof(uint).} = enum
    NSStreamEventNone = 0
    NSStreamEventOpenCompleted = 1 shl 0
    NSStreamEventHasBytesAvailable = 1 shl 1
    NSStreamEventHasSpaceAvailable = 1 shl 2
    NSStreamEventErrorOccurred = 1 shl 3
    NSStreamEventEndEncountered = 1 shl 4

proc setDelegate*(s: NSStream, d: NSObject) {.objc: "setDelegate:".}
proc delegate*(s: NSStream): NSObject {.objc.}
proc open*(s: NSStream) {.objc.}
proc close*(s: NSStream) {.objc.}

proc scheduleInRunLoop*(s: NSStream, rl: NSRunLoop, forMode: NSRunLoopMode) {.objc: "scheduleInRunLoop:forMode:".}

proc withData*(t: typedesc[NSInputStream], d: NSData): NSInputStream {.objc: "inputStreamWithData:".}
