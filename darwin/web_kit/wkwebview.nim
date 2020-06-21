import ../objc/runtime

when defined(ios):
  import ../ui_kit/uiview
  type WKWebView* = ptr object of UIView
else:
  import ../app_kit/nsview
  type WKWebView* = ptr object of NSView

