import ../objc/runtime
import ../foundation/[nsstring, nsarray, nsnumber, nsdecimal_number, nslocale]
import skproductsubscriptionperiod
import skproductdiscount

type SKProduct* = ptr object of NSObject

proc localizedDescription*(p: SKProduct): NSString {.objc.}
proc localizedTitle*(p: SKProduct): NSString {.objc.}
proc priceLocale*(p: SKProduct): NSLocale {.objc.}
proc price*(p: SKProduct): NSDecimalNumber {.objc.}
proc productIdentifier*(p: SKProduct): NSString {.objc.}
proc isDownloadable*(p: SKProduct): BOOL {.objc.}
proc downloadable*(p: SKProduct): BOOL {.objc.}
proc isFamilyShareable*(p: SKProduct): BOOL {.objc.}
proc contentLengths*(p: SKProduct): NSArray[NSNumber] {.objc.}
proc downloadContentLengths*(p: SKProduct): NSArray[NSNumber] {.objc.}
proc contentVersion*(p: SKProduct): NSString {.objc.}
proc downloadContentVersion*(p: SKProduct): NSString {.objc.}
proc subscriptionPeriod*(p: SKProduct): SKProductSubscriptionPeriod {.objc.}
proc introductoryPrice*(p: SKProduct): SKProductDiscount {.objc.}
proc subscriptionGroupIdentifier*(p: SKProduct): NSString {.objc.}
proc discounts*(p: SKProduct): NSArray[SKProductDiscount] {.objc.}
