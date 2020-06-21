import ../objc/runtime
import skpayment

type
  SKPaymentTransaction* = ptr object of NSObject
  SKPaymentTransactionState* {.size: sizeof(uint).} = enum
    purchasing
    purchased
    failed
    restored
    deferred

proc payment*(t: SKPaymentTransaction): SKPayment {.objc.}
proc state*(t: SKPaymentTransaction): SKPaymentTransactionState {.objc: "transactionState".}
proc identifier*(t: SKPaymentTransaction): NSString {.objc: "transactionIdentifier".}
proc original*(t: SKPaymentTransaction): SKPaymentTransaction {.objc: "originalTransaction".}
