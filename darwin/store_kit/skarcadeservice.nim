import ../objc/runtime
import ../foundation/nsdata

type
  SKArcadeService* = ptr object of NSObject

proc registerArcadeAppWithRandomFromLib*(t: typedesc[SKArcadeService]; randomFromLib: NSData; randomFromLibLength: uint32; resultHandler: pointer) {.objc: "registerArcadeAppWithRandomFromLib:randomFromLibLength:resultHandler:".}
proc arcadeSubscriptionStatusWithNonce*(t: typedesc[SKArcadeService]; nonce: uint64; resultHandler: pointer) {.objc: "arcadeSubscriptionStatusWithNonce:resultHandler:".}
proc repairArcadeApp*(t: typedesc[SKArcadeService]) {.objc.}
