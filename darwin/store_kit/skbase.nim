{.passL: "-framework StoreKit".}

import ../objc/runtime

proc SKErrorDomain*(): NSString {.importc.}

type
  SKErrorCode* {.size: sizeof(int).} = enum
    SKErrorUnknown = 0,
    SKErrorClientInvalid,
    SKErrorPaymentCancelled,
    SKErrorPaymentInvalid,
    SKErrorPaymentNotAllowed,
    SKErrorStoreProductNotAvailable,
    SKErrorCloudServicePermissionDenied,
    SKErrorCloudServiceNetworkConnectionFailed,
    SKErrorCloudServiceRevoked,
    SKErrorPrivacyAcknowledgementRequired,
    SKErrorUnauthorizedRequestData,
    SKErrorInvalidOfferIdentifier,
    SKErrorInvalidSignature,
    SKErrorMissingOfferParams,
    SKErrorInvalidOfferPrice,
    SKErrorOverlayCancelled,
    SKErrorOverlayInvalidConfiguration,
    SKErrorOverlayTimeout,
    SKErrorIneligibleForOffer,
    SKErrorUnsupportedPlatform,
    SKErrorOverlayPresentedInBackgroundScene,
    SKErrorPaymentMethodBindingConfigurationRequired
