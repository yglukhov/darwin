import ../objc/runtime
import ../foundation/nsstring

type
  SKStorefront* = ptr object of NSObject

proc countryCode*(s: SKStorefront): NSString {.objc.}
proc identifier*(s: SKStorefront): NSString {.objc.}
