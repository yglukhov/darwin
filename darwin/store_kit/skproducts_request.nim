
import ../objc/runtime
import ../foundation/[nsset, nsarray]
import skrequest, skproduct

type
  SKProductsRequest* = ptr object of SKRequest
  SKProductsResponse* = ptr object of NSObject

proc init*(r: SKProductsRequest, productIds: NSSet[NSString]): SKProductsRequest {.objc: "initWithProductIdentifiers:".}


proc products*(r: SKProductsResponse): NSArray[SKProduct] {.objc: "products".}
proc invalidProductIdentifiers*(r: SKProductsResponse): NSArray[NSString] {.objc: "invalidProductIdentifiers".}
