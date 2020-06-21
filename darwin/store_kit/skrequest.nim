
import ../objc/runtime

type SKRequest* = ptr object of NSObject

proc setDelegate*(r: SKRequest, delegate: NSObject) {.objc: "setDelegate:".}
proc delegate*(r: SKRequest): NSObject {.objc.}
proc start*(r: SKRequest) {.objc.}
proc cancel*(r: SKRequest) {.objc.}
