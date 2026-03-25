import ../objc/runtime
import nsstring

type
  NSUUID* = ptr object of NSObject

proc UUIDString*(self: NSUUID): NSString {.objc: "UUIDString".}
