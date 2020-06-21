
import ../objc/runtime
import ../foundation/[nsset, nsarray]
import skrequest, skproduct

type
  SKProductRequest* = ptr object of SKRequest
  SKProductResponse* = ptr object of NSObject

proc init*(r: SKProductRequest, productIds: NSSet[NSString]): SKProductRequest {.objc: "initWithProductIdentifiers:".}


proc products*(r: SKProductResponse): NSArray[SKProduct] {.objc: "products".}
proc invalidProductIdentifiers*(r: SKProductResponse): NSArray[NSString] {.objc: "invalidProductIdentifiers".}
