import ../objc/runtime
import ../foundation/[nsstring, nsuuid, nsnumber]

type
  SKPaymentDiscount* = ptr object of NSObject

proc init*(d: SKPaymentDiscount; identifier: NSString; keyIdentifier: NSString; nonce: NSUUID; signature: NSString; timestamp: NSNumber): SKPaymentDiscount {.objc: "initWithIdentifier:keyIdentifier:nonce:signature:timestamp:", discardable.}
proc identifier*(d: SKPaymentDiscount): NSString {.objc.}
proc keyIdentifier*(d: SKPaymentDiscount): NSString {.objc.}
proc nonce*(d: SKPaymentDiscount): NSUUID {.objc.}
proc signature*(d: SKPaymentDiscount): NSString {.objc.}
proc timestamp*(d: SKPaymentDiscount): NSNumber {.objc.}
