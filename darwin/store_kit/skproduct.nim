import ../objc/runtime
import ../foundation/[nsdecimal_number, nslocale]

type SKProduct* = ptr object of NSObject

proc localizedDescription*(p: SKProduct): NSString {.objc.}
proc localizedTitle*(p: SKProduct): NSString {.objc.}
proc priceLocale*(p: SKProduct): NSLocale {.objc.}
proc price*(p: SKProduct): NSDecimalNumber {.objc.}
proc productIdentifier*(p: SKProduct): NSString {.objc.}
