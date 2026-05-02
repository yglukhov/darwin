import ../objc/runtime
import ../foundation/nsarray
import skproduct

type
  SKProductStorePromotionVisibility* {.size: sizeof(int).} = enum
    SKProductStorePromotionVisibilityDefault = 0,
    SKProductStorePromotionVisibilityShow,
    SKProductStorePromotionVisibilityHide

  SKProductStorePromotionController* = ptr object of NSObject

proc defaultController*(t: typedesc[SKProductStorePromotionController]): SKProductStorePromotionController {.objc: "defaultController".}
proc fetchStorePromotionVisibilityForProduct*(c: SKProductStorePromotionController; product: SKProduct; completionHandler: pointer) {.objc: "fetchStorePromotionVisibilityForProduct:completionHandler:".}
proc updateStorePromotionVisibility*(c: SKProductStorePromotionController; promotionVisibility: SKProductStorePromotionVisibility; forProduct: SKProduct; completionHandler: pointer) {.objc: "updateStorePromotionVisibility:forProduct:completionHandler:".}
proc fetchStorePromotionOrderWithCompletionHandler*(c: SKProductStorePromotionController; completionHandler: pointer) {.objc: "fetchStorePromotionOrderWithCompletionHandler:".}
proc updateStorePromotionOrder*(c: SKProductStorePromotionController; promotionOrder: NSArray[SKProduct]; completionHandler: pointer) {.objc: "updateStorePromotionOrder:completionHandler:".}
