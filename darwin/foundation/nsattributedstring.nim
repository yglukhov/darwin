import ../objc/runtime
import ./nsstring

type
  NSAttributedString* = ptr object of NSObject

proc toNSString*(self: NSAttributedString): NSString {.objc: "string".}
