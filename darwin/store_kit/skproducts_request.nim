import ../objc/runtime
import ../foundation/[nsset, nsarray, nsstring]
import skrequest
import skproduct

type
  SKProductsRequest* = ptr object of SKRequest
  SKProductsResponse* = ptr object of NSObject

proc init*(r: SKProductsRequest, productIds: NSSet[NSString]): SKProductsRequest {.objc: "initWithProductIdentifiers:".}
proc delegate*(r: SKProductsRequest): NSObject {.objc.}
proc `delegate=`*(r: SKProductsRequest; delegate: NSObject) {.objc: "setDelegate:".}

proc products*(r: SKProductsResponse): NSArray[SKProduct] {.objc: "products".}
proc invalidProductIdentifiers*(r: SKProductsResponse): NSArray[NSString] {.objc: "invalidProductIdentifiers".}
