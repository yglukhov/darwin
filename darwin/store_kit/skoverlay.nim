import ../objc/runtime
import skoverlayconfiguration

type
  SKOverlay* = ptr object of NSObject

proc init*(o: SKOverlay; configuration: SKOverlayConfiguration): SKOverlay {.objc: "initWithConfiguration:", discardable.}
proc presentInScene*(o: SKOverlay; scene: NSObject) {.objc: "presentInScene:".}
proc dismissOverlayInScene*(t: typedesc[SKOverlay]; scene: NSObject) {.objc: "dismissOverlayInScene:".}
proc delegate*(o: SKOverlay): NSObject {.objc.}
proc `delegate=`*(o: SKOverlay; delegate: NSObject) {.objc: "setDelegate:".}
proc configuration*(o: SKOverlay): SKOverlayConfiguration {.objc.}
