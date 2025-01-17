import cfbase

type
  CFRunLoop* = ptr object of CFObject
  CFRunLoopMode* = ptr object of CFString

  CFRunLoopRunResult* {.size: sizeof(int32).} = enum
    kCFRunLoopRunFinished = 1
    kCFRunLoopRunStopped = 2
    kCFRunLoopRunTimedOut = 3
    kCFRunLoopRunHandledSource = 4

let
  kCFRunLoopDefaultMode* {.importc, extern: "kCFRunLoopDefaultMode".}: CFRunLoopMode
  kCFRunLoopCommonModes* {.importc, extern: "kCFRunLoopCommonModes".}: CFRunLoopMode

proc CFRunLoopGetCurrent*(): CFRunLoop {.importc.}
proc runInMode*(mode: CFRunLoopMode, seconds: CFTimeInterval, returnAfterSourceHandled: bool): CFRunLoopRunResult {.importc: "CFRunLoopRunInMode".}
proc stop*(loop: CFRunLoop) {.importc: "CFRunLoopStop".}
