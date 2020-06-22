

import ../objc/runtime
import skproduct

type SKPayment* = ptr object of NSObject

proc withProduct*(t: typedesc[SKPayment], p: SKProduct): SKPayment {.objc: "paymentWithProduct:".}
proc setApplicationUsername*(p: SKPayment, n: NSString) {.objc: "setApplicationUsername:".}
