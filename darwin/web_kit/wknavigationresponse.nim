import ../objc/[runtime]
import ../foundation/[nsurlresponse, nsurl]
import ./wkwebview

type
  WKNavigationResponse* = ptr object of NSObject

# Properties
proc canShowMIMEType*(self: WKNavigationResponse): BOOL {.objc: "canShowMIMEType".}
proc isForMainFrame*(self: WKNavigationResponse): BOOL {.objc: "forMainFrame".}
proc response*(self: WKNavigationResponse): NSURLResponse {.objc: "response".}
