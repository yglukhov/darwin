import ../objc/runtime
import ./nsstring

type
  NSAttributedString* = ptr object of NSObject

proc string*(self: NSAttributedString): NSString {.objc.}
