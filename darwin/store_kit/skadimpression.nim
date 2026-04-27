import ../objc/runtime
import ../foundation/[nsstring, nsnumber]

type
  SKAdImpression* = ptr object of NSObject

proc init*(i: SKAdImpression; sourceAppStoreItemIdentifier: NSNumber; advertisedAppStoreItemIdentifier: NSNumber; adNetworkIdentifier: NSString; adCampaignIdentifier: NSNumber; adImpressionIdentifier: NSString; timestamp: NSNumber; signature: NSString; version: NSString): SKAdImpression {.objc: "initWithSourceAppStoreItemIdentifier:advertisedAppStoreItemIdentifier:adNetworkIdentifier:adCampaignIdentifier:adImpressionIdentifier:timestamp:signature:version:", discardable.}
proc sourceAppStoreItemIdentifier*(i: SKAdImpression): NSNumber {.objc.}
proc `sourceAppStoreItemIdentifier=`*(i: SKAdImpression; value: NSNumber) {.objc: "setSourceAppStoreItemIdentifier:".}
proc advertisedAppStoreItemIdentifier*(i: SKAdImpression): NSNumber {.objc.}
proc `advertisedAppStoreItemIdentifier=`*(i: SKAdImpression; value: NSNumber) {.objc: "setAdvertisedAppStoreItemIdentifier:".}
proc adNetworkIdentifier*(i: SKAdImpression): NSString {.objc.}
proc `adNetworkIdentifier=`*(i: SKAdImpression; value: NSString) {.objc: "setAdNetworkIdentifier:".}
proc adCampaignIdentifier*(i: SKAdImpression): NSNumber {.objc.}
proc `adCampaignIdentifier=`*(i: SKAdImpression; value: NSNumber) {.objc: "setAdCampaignIdentifier:".}
proc sourceIdentifier*(i: SKAdImpression): NSNumber {.objc.}
proc `sourceIdentifier=`*(i: SKAdImpression; value: NSNumber) {.objc: "setSourceIdentifier:".}
proc adImpressionIdentifier*(i: SKAdImpression): NSString {.objc.}
proc `adImpressionIdentifier=`*(i: SKAdImpression; value: NSString) {.objc: "setAdImpressionIdentifier:".}
proc adType*(i: SKAdImpression): NSString {.objc.}
proc `adType=`*(i: SKAdImpression; value: NSString) {.objc: "setAdType:".}
proc adDescription*(i: SKAdImpression): NSString {.objc.}
proc `adDescription=`*(i: SKAdImpression; value: NSString) {.objc: "setAdDescription:".}
proc adPurchaserName*(i: SKAdImpression): NSString {.objc.}
proc `adPurchaserName=`*(i: SKAdImpression; value: NSString) {.objc: "setAdPurchaserName:".}
proc timestamp*(i: SKAdImpression): NSNumber {.objc.}
proc `timestamp=`*(i: SKAdImpression; value: NSNumber) {.objc: "setTimestamp:".}
proc signature*(i: SKAdImpression): NSString {.objc.}
proc `signature=`*(i: SKAdImpression; value: NSString) {.objc: "setSignature:".}
proc version*(i: SKAdImpression): NSString {.objc.}
proc `version=`*(i: SKAdImpression; value: NSString) {.objc: "setVersion:".}
