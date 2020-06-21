

import ../objc/runtime
import skproduct

type SKPayment* = ptr object of NSObject

proc withProduct*(t: typedesc[SKPayment], p: SKProduct): SKPayment {.objc: "paymentWithProduct:".}
proc setApplicationUsername*(p: SKProduct, n: NSString) {.objc: "setApplicationUsername:".}
