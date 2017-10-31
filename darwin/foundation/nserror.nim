import ../objc/runtime

type NSError* = ptr object of NSObject

proc objcClass*(t: typedesc[NSError]): auto {.inline.} = objcClass("NSError")