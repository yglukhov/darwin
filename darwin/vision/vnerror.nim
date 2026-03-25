import ../objc/runtime
import ../foundation/nsstring

# Error domain
proc vnErrorDomain*(): NSString {.inline.} = @"VNErrorDomain"

# Error codes
type
  VNErrorCode* {.size: sizeof(cint).} = enum
    vnErrorTuriCoreErrorCode = -1
    vnErrorOK = 0
    vnErrorRequestCancelled = 1
    vnErrorInvalidFormat = 2
    vnErrorOperationFailed = 3
    vnErrorOutOfBoundsError = 4
    vnErrorInvalidOption = 5
    vnErrorIOError = 6
    vnErrorMissingOption = 7
    vnErrorNotImplemented = 8
    vnErrorInternalError = 9
    vnErrorOutOfMemory = 10
    vnErrorUnknownError = 11
    vnErrorInvalidOperation = 12
    vnErrorInvalidImage = 13
    vnErrorInvalidArgument = 14
    vnErrorInvalidModel = 15
    vnErrorUnsupportedRevision = 16
    vnErrorDataUnavailable = 17
    vnErrorTimeStampNotFound = 18
    vnErrorUnsupportedRequest = 19
    vnErrorTimeout = 20
    vnErrorUnsupportedComputeStage = 21
    vnErrorUnsupportedComputeDevice = 22
