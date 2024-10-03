import ../objc/runtime

type NSURL* = ptr object of NSObject

proc URLWithString*(self: typedesc[NSURL], str: NSString): NSURL {.objc: "URLWithString:".}
proc path*(self: NSURL): NSString {.objc.}
