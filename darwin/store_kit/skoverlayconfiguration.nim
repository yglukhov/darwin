import ../objc/runtime
import ../foundation/nsstring
import skadimpression

type
  SKOverlayPosition* {.size: sizeof(int).} = enum
    SKOverlayPositionBottom = 0,
    SKOverlayPositionBottomRaised = 1

  SKOverlayConfiguration* = ptr object of NSObject
  SKOverlayAppConfiguration* = ptr object of SKOverlayConfiguration
  SKOverlayAppClipConfiguration* = ptr object of SKOverlayConfiguration

## SKOverlayAppConfiguration
proc init*(c: SKOverlayAppConfiguration; appIdentifier: NSString; position: SKOverlayPosition): SKOverlayAppConfiguration {.objc: "initWithAppIdentifier:position:", discardable.}
proc appIdentifier*(c: SKOverlayAppConfiguration): NSString {.objc.}
proc `appIdentifier=`*(c: SKOverlayAppConfiguration; value: NSString) {.objc: "setAppIdentifier:".}
proc campaignToken*(c: SKOverlayAppConfiguration): NSString {.objc.}
proc `campaignToken=`*(c: SKOverlayAppConfiguration; value: NSString) {.objc: "setCampaignToken:".}
proc providerToken*(c: SKOverlayAppConfiguration): NSString {.objc.}
proc `providerToken=`*(c: SKOverlayAppConfiguration; value: NSString) {.objc: "setProviderToken:".}
proc customProductPageIdentifier*(c: SKOverlayAppConfiguration): NSString {.objc.}
proc `customProductPageIdentifier=`*(c: SKOverlayAppConfiguration; value: NSString) {.objc: "setCustomProductPageIdentifier:".}
proc latestReleaseID*(c: SKOverlayAppConfiguration): NSString {.objc.}
proc `latestReleaseID=`*(c: SKOverlayAppConfiguration; value: NSString) {.objc: "setLatestReleaseID:".}
proc position*(c: SKOverlayAppConfiguration): SKOverlayPosition {.objc.}
proc `position=`*(c: SKOverlayAppConfiguration; value: SKOverlayPosition) {.objc: "setPosition:".}
proc userDismissible*(c: SKOverlayAppConfiguration): BOOL {.objc.}
proc `userDismissible=`*(c: SKOverlayAppConfiguration; value: BOOL) {.objc: "setUserDismissible:".}
proc setAdditionalValue*(c: SKOverlayAppConfiguration; value: NSObject; forKey: NSString) {.objc: "setAdditionalValue:forKey:".}
proc additionalValueForKey*(c: SKOverlayAppConfiguration; key: NSString): NSObject {.objc: "additionalValueForKey:".}
proc setAdImpression*(c: SKOverlayAppConfiguration; impression: SKAdImpression) {.objc: "setAdImpression:".}

## SKOverlayAppClipConfiguration
proc init*(c: SKOverlayAppClipConfiguration; position: SKOverlayPosition): SKOverlayAppClipConfiguration {.objc: "initWithPosition:", discardable.}
proc campaignToken*(c: SKOverlayAppClipConfiguration): NSString {.objc.}
proc `campaignToken=`*(c: SKOverlayAppClipConfiguration; value: NSString) {.objc: "setCampaignToken:".}
proc providerToken*(c: SKOverlayAppClipConfiguration): NSString {.objc.}
proc `providerToken=`*(c: SKOverlayAppClipConfiguration; value: NSString) {.objc: "setProviderToken:".}
proc customProductPageIdentifier*(c: SKOverlayAppClipConfiguration): NSString {.objc.}
proc `customProductPageIdentifier=`*(c: SKOverlayAppClipConfiguration; value: NSString) {.objc: "setCustomProductPageIdentifier:".}
proc latestReleaseID*(c: SKOverlayAppClipConfiguration): NSString {.objc.}
proc `latestReleaseID=`*(c: SKOverlayAppClipConfiguration; value: NSString) {.objc: "setLatestReleaseID:".}
proc position*(c: SKOverlayAppClipConfiguration): SKOverlayPosition {.objc.}
proc `position=`*(c: SKOverlayAppClipConfiguration; value: SKOverlayPosition) {.objc: "setPosition:".}
proc setAdditionalValue*(c: SKOverlayAppClipConfiguration; value: NSObject; forKey: NSString) {.objc: "setAdditionalValue:forKey:".}
proc additionalValueForKey*(c: SKOverlayAppClipConfiguration; key: NSString): NSObject {.objc: "additionalValueForKey:".}
