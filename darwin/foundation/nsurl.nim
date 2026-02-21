import ../objc/runtime

type NSURL* = ptr object of NSObject

proc URLWithString*(self: typedesc[NSURL], str: NSString): NSURL {.objc: "URLWithString:".}
proc fileURLWithPath*(self: typedesc[NSURL], path: NSString): NSURL {.objc: "fileURLWithPath:".}
proc path*(self: NSURL): NSString {.objc.}
