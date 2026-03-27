import ../objc/runtime
import ../core_graphics/cggeometry
import ../foundation/nsgeometry
import ../foundation/nsarray

type NSScreen* = ptr object of NSObject

proc mainScreen(n: typedesc[NSScreen]): NSScreen {.objc: "mainScreen".}
proc mainScreen*(): NSScreen {.inline.} = NSScreen.mainScreen()
proc screens*(n: typedesc[NSScreen]): NSArray[NSScreen] {.objc: "screens".}
proc frame*(s: NSScreen): NSRect {.objc.}

proc backingScaleFactor(s: NSScreen): CGFloat {.objc: "backingScaleFactor".}
proc scaleFactor*(s: NSScreen): CGFloat =
    if s.respondsToSelector("backingScaleFactor"):
        result = s.backingScaleFactor()
    else:
        result = 1
