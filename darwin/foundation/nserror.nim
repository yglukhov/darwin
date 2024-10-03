import ../objc/runtime
import ../foundation/[nsdictionary]

type NSError* = ptr object of NSObject

proc localizedDescription*(self: NSError): NSString {.objc: "localizedDescription".}
proc localizedFailureReason*(self: NSError): NSString {.objc: "localizedFailureReason".}
proc localizedRecoverySuggestion*(self: NSError): NSString {.objc: "localizedRecoverySuggestion".}
proc code*(self: NSError): NSInteger {.objc.}
proc domain*(self: NSError): NSString {.objc.}
proc userInfo*(self: NSError): NSDictionary {.objc.}
proc errorWithDomain*(domain: NSString, code: NSInteger, userInfo: NSDictionary): NSError {.objc: "errorWithDomain:code:userInfo:".}
