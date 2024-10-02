import ../objc/runtime

type
    NSProcessInfo* = ptr object of NSObject

proc processInfo*(self: typedesc[NSProcessInfo]): NSProcessInfo {.objc.}
proc processName*(self: NSProcessInfo): NSString {.objc.}
