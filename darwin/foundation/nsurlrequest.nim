import ../objc/runtime
import ./nsurl

type
    NSURLRequest* = ptr object of NSObject

proc requestWithURL*(self: typedesc[NSURLRequest], url: NSURL): NSURLRequest {.objc: "requestWithURL:".}
