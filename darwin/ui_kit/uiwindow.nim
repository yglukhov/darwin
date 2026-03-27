import ../objc/runtime
import ../core_graphics/cggeometry
import ../foundation / [ nsgeometry ]
import ./[uiwindowscene]

type
  UIWindow* = ptr object of NSObject

proc backingScaleFactor(s: UIWindow): CGFloat {.objc: "contentScaleFactor".}
proc scaleFactor*(s: UIWindow): CGFloat =
    if s.respondsToSelector("contentScaleFactor"):
        result = s.backingScaleFactor()
    else:
        result = 1

proc initWithWindowScene*(s: UIWindow, scene: UIWindowScene) {.objc: "initWithWindowScene:".}
proc center*(s: UIWindow) {.objc.}
proc frame*(s: UIWindow): NSRect {.objc.}
proc setDelegate*(s: UIWindow, d: NSObject) {.objc: "setDelegate:".}
