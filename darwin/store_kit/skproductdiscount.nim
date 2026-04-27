import ../objc/runtime
import ../foundation/[nsstring, nsdecimal_number, nslocale]
import skproductsubscriptionperiod

type
  SKProductDiscountPaymentMode* {.size: sizeof(uint).} = enum
    SKProductDiscountPaymentModePayAsYouGo = 0,
    SKProductDiscountPaymentModePayUpFront,
    SKProductDiscountPaymentModeFreeTrial

  SKProductDiscountType* {.size: sizeof(uint).} = enum
    SKProductDiscountTypeIntroductory = 0,
    SKProductDiscountTypeSubscription

  SKProductDiscount* = ptr object of NSObject

proc price*(d: SKProductDiscount): NSDecimalNumber {.objc.}
proc priceLocale*(d: SKProductDiscount): NSLocale {.objc.}
proc identifier*(d: SKProductDiscount): NSString {.objc.}
proc subscriptionPeriod*(d: SKProductDiscount): SKProductSubscriptionPeriod {.objc.}
proc numberOfPeriods*(d: SKProductDiscount): NSUInteger {.objc.}
proc paymentMode*(d: SKProductDiscount): SKProductDiscountPaymentMode {.objc.}
proc `type`*(d: SKProductDiscount): SKProductDiscountType {.objc.}
