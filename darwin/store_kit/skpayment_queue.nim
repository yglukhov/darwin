
import ../objc/runtime
import skpayment, skpayment_transaction

type SKPaymentQueue* = ptr object of NSObject

proc defaultQueue*(t: typedesc[SKPaymentQueue]): SKPaymentQueue {.objc.}
proc add*(q: SKPaymentQueue, p: SKPayment) {.objc: "addPayment:".}
proc finish*(q: SKPaymentQueue, t: SKPaymentTransaction) {.objc: "finishTransaction:".}
proc addTransactionObserver*(q: SKPaymentQueue, a: NSObject) {.objc: "addTransactionObserver:".}
