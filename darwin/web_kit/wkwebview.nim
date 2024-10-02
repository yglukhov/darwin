import ../objc/runtime
import ../core_graphics/cggeometry
import ./wkwebviewconfiguration
import ../foundation/[nsurl, nsurlrequest]
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