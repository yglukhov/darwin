import ../objc/runtime
import ../core_graphics/cggeometry

type NSWindow* = ptr object of NSObject

proc backingScaleFactor(s: NSWindow): CGFloat {.objc: "backingScaleFactor".}
proc scaleFactor*(s: NSWindow): CGFloat =
    if s.respondsToSelector("backingScaleFactor"):
        result = s.backingScaleFactor()
    else:
        result = 1
