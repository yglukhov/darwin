import ../objc/[runtime, blocks]
import ../core_graphics/cggeometry
import ./wkwebviewconfiguration
import ../foundation/[nsurl, nsurlrequest, nserror]
import ./wknavigation

when defined(ios):
  import ../ui_kit/uiview
  type WKWebView* = ptr object of UIView
else:
  import ../app_kit/nsview
  type WKWebView* = ptr object of NSView

proc initWithFrame*(self: WKWebView, frame: CGRect): WKWebView {.objc: "initWithFrame:".}

proc initWithFrameAndConfiguration*(self: WKWebView, frame: CGRect, conf: WKWebViewConfiguration): WKWebView {.objc: "initWithFrame:configuration:".}

proc loadHTMLString*(self: WKWebView, str: NSString, baseURL: NSURL): WKNavigation {.objc: "loadHTMLString:baseURL:" , discardable.}

proc loadRequest*(self: WKWebView, request: NSURLRequest): WKNavigation {.objc: "loadRequest:", discardable.}

proc configuration*(self: WKWebView): WKWebViewConfiguration {.objc: "configuration".}

proc evaluateJavaScript*(self: WKWebView, javaScriptString: NSString, completionHandler: Block[proc (res: ID; err: NSError)]) {.objc: "evaluateJavaScript:completionHandler:".}

proc setNavigationDelegate*(s: WKWebview, d: NSObject) {.objc: "setNavigationDelegate:".}
