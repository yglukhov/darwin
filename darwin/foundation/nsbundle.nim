import ../objc/runtime

type
  NSBundle* = ptr object of NSObject

proc mainBundle*(self: typedesc[NSBundle]): NSBundle {.objc: "mainBundle" .}
proc bundlePath*(self: NSBundle): NSString {.objc: "bundlePath".}
