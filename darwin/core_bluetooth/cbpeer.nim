import ./cbbase
import ../objc/[runtime]
import ../foundation/nsuuid

type
  CBPeer* = ptr object of NSObject

proc identifier*(self: CBPeer): NSUUID {.objc:"identifier".}
