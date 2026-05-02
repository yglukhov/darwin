import ../objc/runtime
import ../foundation/nsstring

type
  SKCloudServiceAuthorizationStatus* {.size: sizeof(int).} = enum
    SKCloudServiceAuthorizationStatusNotDetermined = 0,
    SKCloudServiceAuthorizationStatusDenied,
    SKCloudServiceAuthorizationStatusRestricted,
    SKCloudServiceAuthorizationStatusAuthorized

  SKCloudServiceCapability* = uint

const
  SKCloudServiceCapabilityNone*: SKCloudServiceCapability = 0
  SKCloudServiceCapabilityMusicCatalogPlayback*: SKCloudServiceCapability = 1 shl 0
  SKCloudServiceCapabilityMusicCatalogSubscriptionEligible*: SKCloudServiceCapability = 1 shl 1
  SKCloudServiceCapabilityAddToCloudMusicLibrary*: SKCloudServiceCapability = 1 shl 8

var
  SKCloudServiceCapabilitiesDidChangeNotification {.importc.}: NSString
  SKStorefrontCountryCodeDidChangeNotification {.importc.}: NSString
  SKStorefrontIdentifierDidChangeNotification {.importc.}: NSString

  SKCloudServiceSetupOptionsActionKey {.importc.}: NSString
  SKCloudServiceSetupOptionsITunesItemIdentifierKey {.importc.}: NSString
  SKCloudServiceSetupOptionsAffiliateTokenKey {.importc.}: NSString
  SKCloudServiceSetupOptionsCampaignTokenKey {.importc.}: NSString
  SKCloudServiceSetupOptionsMessageIdentifierKey {.importc.}: NSString

  SKCloudServiceSetupActionSubscribe {.importc.}: NSString

  SKCloudServiceSetupMessageIdentifierJoin {.importc.}: NSString
  SKCloudServiceSetupMessageIdentifierConnect {.importc.}: NSString
  SKCloudServiceSetupMessageIdentifierAddMusic {.importc.}: NSString
  SKCloudServiceSetupMessageIdentifierPlayMusic {.importc.}: NSString

type
  SKCloudServiceController* = ptr object of NSObject

proc authorizationStatus*(t: typedesc[SKCloudServiceController]): SKCloudServiceAuthorizationStatus {.objc: "authorizationStatus".}
proc requestCapabilitiesWithCompletionHandler*(c: SKCloudServiceController; completionHandler: pointer) {.objc: "requestCapabilitiesWithCompletionHandler:".}
proc requestStorefrontCountryCodeWithCompletionHandler*(c: SKCloudServiceController; completionHandler: pointer) {.objc: "requestStorefrontCountryCodeWithCompletionHandler:".}
proc requestStorefrontIdentifierWithCompletionHandler*(c: SKCloudServiceController; completionHandler: pointer) {.objc: "requestStorefrontIdentifierWithCompletionHandler:".}
proc requestUserTokenForDeveloperToken*(c: SKCloudServiceController; developerToken: NSString; completionHandler: pointer) {.objc: "requestUserTokenForDeveloperToken:completionHandler:".}
