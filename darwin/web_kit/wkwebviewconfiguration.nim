import ../objc/runtime
import ./wkusercontentcontroller
import ./wkpreferences
type
  WKWebViewConfiguration* = ptr object of NSObject

proc newWKWebViewConfiguration*(a: typedesc[WKWebViewConfiguration]): WKWebViewConfiguration{.objc: "new".}

proc userContentController*(self: WKWebViewConfiguration): WKUserContentController {.objc: "userContentController".}
proc setUserContentController*(self: WKWebViewConfiguration, controller: WKUserContentController): void {.objc: "setUserContentController:".}
proc preferences*(self: WKWebViewConfiguration): WKPreferences {.objc.}