import ../objc/runtime
import ../foundation/[nsstring, nsdata]
import skproduct
import skpaymentdiscount

type
  SKPayment* = ptr object of NSObject
  SKMutablePayment* = ptr object of SKPayment

proc withProduct*(t: typedesc[SKPayment], p: SKProduct): SKPayment {.objc: "paymentWithProduct:".}
proc withProductIdentifier*(t: typedesc[SKPayment], identifier: NSString): SKPayment {.objc: "paymentWithProductIdentifier:".}
proc productIdentifier*(p: SKPayment): NSString {.objc.}
proc requestData*(p: SKPayment): NSData {.objc.}
proc quantity*(p: SKPayment): NSInteger {.objc.}
proc applicationUsername*(p: SKPayment): NSString {.objc: "applicationUsername".}
proc simulatesAskToBuyInSandbox*(p: SKPayment): BOOL {.objc.}
proc paymentDiscount*(p: SKPayment): SKPaymentDiscount {.objc.}

## SKMutablePayment
proc `applicationUsername=`*(p: SKMutablePayment; username: NSString) {.objc: "setApplicationUsername:".}
proc `paymentDiscount=`*(p: SKMutablePayment; discount: SKPaymentDiscount) {.objc: "setPaymentDiscount:".}
proc `productIdentifier=`*(p: SKMutablePayment; identifier: NSString) {.objc: "setProductIdentifier:".}
proc `quantity=`*(p: SKMutablePayment; quantity: NSInteger) {.objc: "setQuantity:".}
proc `requestData=`*(p: SKMutablePayment; data: NSData) {.objc: "setRequestData:".}
proc `simulatesAskToBuyInSandbox=`*(p: SKMutablePayment; simulates: BOOL) {.objc: "setSimulatesAskToBuyInSandbox:".}
