import ../objc/runtime
import ../foundation/[nsdictionary, nsstring]
import ../app_kit/nsview

type
  SKStoreProductViewController* = ptr object of NSView

proc delegate*(v: SKStoreProductViewController): NSObject {.objc.}
proc `delegate=`*(v: SKStoreProductViewController; delegate: NSObject) {.objc: "setDelegate:".}
proc loadProductWithParameters*(v: SKStoreProductViewController; parameters: NSDictionary[NSString, NSObject]; completionBlock: pointer) {.objc: "loadProductWithParameters:completionBlock:".}
proc loadProductWithParametersImpression*(v: SKStoreProductViewController; parameters: NSDictionary[NSString, NSObject]; impression: NSObject; completionBlock: pointer) {.objc: "loadProductWithParameters:impression:completionBlock:".}

var
  SKStoreProductParameterITunesItemIdentifier {.importc.}: NSString
  SKStoreProductParameterProductIdentifier {.importc.}: NSString
  SKStoreProductParameterCustomProductPageIdentifier {.importc.}: NSString
  SKStoreProductParameterAffiliateToken {.importc.}: NSString
  SKStoreProductParameterCampaignToken {.importc.}: NSString
  SKStoreProductParameterProviderToken {.importc.}: NSString
  SKStoreProductParameterAdvertisingPartnerToken {.importc.}: NSString
