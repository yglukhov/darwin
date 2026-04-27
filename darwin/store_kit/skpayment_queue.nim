import ../objc/runtime
import ../foundation/[nsarray, nsstring, nsdictionary]
import skpayment
import skpayment_transaction
import skstorefront

type SKPaymentQueue* = ptr object of NSObject

proc defaultQueue*(t: typedesc[SKPaymentQueue]): SKPaymentQueue {.objc.}
proc canMakePayments*(t: typedesc[SKPaymentQueue]): BOOL {.objc: "canMakePayments".}
proc add*(q: SKPaymentQueue, p: SKPayment) {.objc: "addPayment:".}
proc restoreCompletedTransactions*(q: SKPaymentQueue) {.objc.}
proc restoreCompletedTransactionsWithApplicationUsername*(q: SKPaymentQueue; username: NSString) {.objc: "restoreCompletedTransactionsWithApplicationUsername:".}
proc finish*(q: SKPaymentQueue, t: SKPaymentTransaction) {.objc: "finishTransaction:".}
proc startDownloads*(q: SKPaymentQueue; downloads: NSArray[NSObject]) {.objc: "startDownloads:".}
proc pauseDownloads*(q: SKPaymentQueue; downloads: NSArray[NSObject]) {.objc: "pauseDownloads:".}
proc resumeDownloads*(q: SKPaymentQueue; downloads: NSArray[NSObject]) {.objc: "resumeDownloads:".}
proc cancelDownloads*(q: SKPaymentQueue; downloads: NSArray[NSObject]) {.objc: "cancelDownloads:".}
proc addTransactionObserver*(q: SKPaymentQueue, a: NSObject) {.objc: "addTransactionObserver:".}
proc removeTransactionObserver*(q: SKPaymentQueue; observer: NSObject) {.objc: "removeTransactionObserver:".}
proc transactionObservers*(q: SKPaymentQueue): NSArray[NSObject] {.objc.}
proc transactions*(q: SKPaymentQueue): NSArray[SKPaymentTransaction] {.objc.}
proc showPriceConsentIfNeeded*(q: SKPaymentQueue) {.objc.}
proc presentCodeRedemptionSheet*(q: SKPaymentQueue) {.objc.}
proc delegate*(q: SKPaymentQueue): NSObject {.objc.}
proc `delegate=`*(q: SKPaymentQueue; delegate: NSObject) {.objc: "setDelegate:".}
proc storefront*(q: SKPaymentQueue): SKStorefront {.objc.}
