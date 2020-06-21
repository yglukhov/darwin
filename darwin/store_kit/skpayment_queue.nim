
import ../objc/runtime
import skpayment

type SKPaymentQueue* = ptr object of NSObject

proc defaultQueue*(t: typedesc[SKPaymentQueue]): SKPaymentQueue {.objc.}
proc add*(q: SKPaymentQueue, p: SKPayment) {.objc: "addPayment:".}
proc addObserver*(q: SKPaymentQueue, a: NSObject) {.objc: "addObserver:".}
