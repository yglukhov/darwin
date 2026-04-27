import ../objc/runtime
import ../foundation/[nsarray, nsstring, nsdate, nsdata, nserror]
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
proc error*(t: SKPaymentTransaction): NSError {.objc.}
proc downloads*(t: SKPaymentTransaction): NSArray[NSObject] {.objc.}
proc transactionDate*(t: SKPaymentTransaction): NSDate {.objc.}
proc transactionReceipt*(t: SKPaymentTransaction): NSData {.objc.}
