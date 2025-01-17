import cfbase

type
  CFRunLoop* = ptr object of CFString
  CFRunLoopMode* = ptr object of CFString

const
  kCFRunLoopRunTimedOut* = 3

let
  kCFRunLoopDefaultMode* {.importc, extern: "kCFRunLoopDefaultMode".}: CFRunLoopMode
  kCFRunLoopCommonModes* {.importc, extern: "kCFRunLoopCommonModes".}: CFRunLoopMode

proc CFRunLoopGetCurrent*(): CFRunLoop {.importc.}
proc CFRunLoopRunInMode*(mode: CFRunLoopMode, seconds: CFTimeInterval, returnAfterSourceHandled: bool): cint {.importc.}
proc CFRunLoopStop*(loop: CFRunLoop) {.importc.}
