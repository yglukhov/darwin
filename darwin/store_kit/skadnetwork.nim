import ../objc/runtime
import ../foundation/nsstring
import skadimpression

type
  SKAdNetworkCoarseConversionValue* = NSString

var
  SKAdNetworkCoarseConversionValueHigh {.importc.}: SKAdNetworkCoarseConversionValue
  SKAdNetworkCoarseConversionValueMedium {.importc.}: SKAdNetworkCoarseConversionValue
  SKAdNetworkCoarseConversionValueLow {.importc.}: SKAdNetworkCoarseConversionValue

type
  SKAdNetwork* = ptr object of NSObject

proc startImpression*(t: typedesc[SKAdNetwork]; impression: SKAdImpression; completionHandler: pointer) {.objc: "startImpression:completionHandler:".}
proc endImpression*(t: typedesc[SKAdNetwork]; impression: SKAdImpression; completionHandler: pointer) {.objc: "endImpression:completionHandler:".}
proc registerAppForAdNetworkAttribution*(t: typedesc[SKAdNetwork]) {.objc.}
proc updateConversionValue*(t: typedesc[SKAdNetwork]; conversionValue: NSInteger) {.objc: "updateConversionValue:".}
proc updatePostbackConversionValue*(t: typedesc[SKAdNetwork]; conversionValue: NSInteger; completionHandler: pointer) {.objc: "updatePostbackConversionValue:completionHandler:".}
proc updatePostbackConversionValueCoarseValue*(t: typedesc[SKAdNetwork]; fineValue: NSInteger; coarseValue: SKAdNetworkCoarseConversionValue; completionHandler: pointer) {.objc: "updatePostbackConversionValue:coarseValue:completionHandler:".}
proc updatePostbackConversionValueCoarseValueLockWindow*(t: typedesc[SKAdNetwork]; fineValue: NSInteger; coarseValue: SKAdNetworkCoarseConversionValue; lockWindow: BOOL; completionHandler: pointer) {.objc: "updatePostbackConversionValue:coarseValue:lockWindow:completionHandler:".}

var
  SKStoreProductParameterAdNetworkAttributionSignature {.importc.}: NSString
  SKStoreProductParameterAdNetworkCampaignIdentifier {.importc.}: NSString
  SKStoreProductParameterAdNetworkSourceIdentifier {.importc.}: NSString
  SKStoreProductParameterAdNetworkIdentifier {.importc.}: NSString
  SKStoreProductParameterAdNetworkNonce {.importc.}: NSString
  SKStoreProductParameterAdNetworkTimestamp {.importc.}: NSString
  SKStoreProductParameterAdNetworkSourceAppStoreIdentifier {.importc.}: NSString
  SKStoreProductParameterAdNetworkVersion {.importc.}: NSString
