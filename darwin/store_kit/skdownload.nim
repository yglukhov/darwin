import ../objc/runtime
import ../foundation/[nsstring, nsnumber, nsurl, nsarray, nserror]
import skpayment_transaction

type
  SKDownloadState* {.size: sizeof(int).} = enum
    SKDownloadStateWaiting = 0,
    SKDownloadStateActive,
    SKDownloadStatePaused,
    SKDownloadStateFinished,
    SKDownloadStateFailed,
    SKDownloadStateCancelled

  SKDownload* = ptr object of NSObject

const
  SKDownloadTimeRemainingUnknown*: cdouble = -1.0

proc state*(d: SKDownload): SKDownloadState {.objc.}
proc downloadState*(d: SKDownload): SKDownloadState {.objc.}
proc contentLength*(d: SKDownload): NSNumber {.objc.}
proc expectedContentLength*(d: SKDownload): int64 {.objc.}
proc contentIdentifier*(d: SKDownload): NSString {.objc.}
proc contentURL*(d: SKDownload): NSURL {.objc.}
proc contentVersion*(d: SKDownload): NSString {.objc.}
proc error*(d: SKDownload): NSError {.objc.}
proc progress*(d: SKDownload): cfloat {.objc.}
proc timeRemaining*(d: SKDownload): cdouble {.objc.}
proc transaction*(d: SKDownload): SKPaymentTransaction {.objc.}
proc contentURLForProductID*(t: typedesc[SKDownload]; productID: NSString): NSURL {.objc: "contentURLForProductID:".}
proc deleteContentForProductID*(t: typedesc[SKDownload]; productID: NSString) {.objc: "deleteContentForProductID:".}
