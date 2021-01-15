

import ../objc/runtime
import skproduct

type SKPayment* = ptr object of NSObject

proc withProduct*(t: typedesc[SKPayment], p: SKProduct): SKPayment {.objc: "paymentWithProduct:".}
proc applicationUsername*(p: SKPayment): NSString {.objc: "applicationUsername".}
