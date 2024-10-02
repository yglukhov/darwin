import ../objc/runtime

type
  WKPreferences* = ptr object of NSObject

proc setDeveloperExtrasEnabled*(self: WKPreferences, a: BOOL) {.objc: "_setDeveloperExtrasEnabled:".}
proc setFullScreenEnabled*(self: WKPreferences, a: BOOL) {.objc: "_setFullScreenEnabled:".}
proc setJavaScriptCanAccessClipboard*(self: WKPreferences, a: BOOL) {.objc: "_setJavaScriptCanAccessClipboard:".}
proc setDOMPasteAllowed*(self: WKPreferences, a: BOOL) {.objc: "_setDOMPasteAllowed:".}
