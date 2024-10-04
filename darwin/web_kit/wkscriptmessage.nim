import ../objc/[runtime]
import ./wkwebview

type
  WKScriptMessage* = ptr object of NSObject

proc name*(self: WKScriptMessage): NSString {.objc: "name".}

proc body*(self: WKScriptMessage): NSString {.objc.}

proc webView*(self: WKScriptMessage): WKWebView {.objc: "webView".}
