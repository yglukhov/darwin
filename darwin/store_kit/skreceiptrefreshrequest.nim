import ../objc/runtime
import ../foundation/[nsdictionary, nsstring]
import skrequest

type
  SKReceiptRefreshRequest* = ptr object of SKRequest

proc init*(r: SKReceiptRefreshRequest; properties: NSDictionary[NSString, NSObject]): SKReceiptRefreshRequest {.objc: "initWithReceiptProperties:", discardable.}
proc receiptProperties*(r: SKReceiptRefreshRequest): NSDictionary[NSString, NSObject] {.objc.}

proc SKTerminateForInvalidReceipt*() {.importc.}

var
  SKReceiptPropertyIsExpired {.importc.}: NSString
  SKReceiptPropertyIsRevoked {.importc.}: NSString
  SKReceiptPropertyIsVolumePurchase {.importc.}: NSString

template kSKReceiptPropertyIsExpired*: NSString =
  let a = SKReceiptPropertyIsExpired; a

template kSKReceiptPropertyIsRevoked*: NSString =
  let a = SKReceiptPropertyIsRevoked; a

template kSKReceiptPropertyIsVolumePurchase*: NSString =
  let a = SKReceiptPropertyIsVolumePurchase; a
