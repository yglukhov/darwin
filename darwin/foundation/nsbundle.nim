import ../objc/runtime

type
  NSBundle* = ptr object of NSObject

proc mainBundle*(self: typedesc[NSBundle]): NSBundle {.objc: "mainBundle" .}
proc bundlePath*(self: NSBundle): NSString {.objc: "bundlePath".}
proc pathForResource*(self: NSBundle, name: NSString, ext: NSString): NSString {.objc: "pathForResource:ofType:".}
proc objectForInfoDictionaryKey*(self: NSBundle, key: NSString): NSObject {.objc: "objectForInfoDictionaryKey:".}