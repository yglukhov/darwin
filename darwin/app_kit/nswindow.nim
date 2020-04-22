import ../objc/runtime
import ../core_graphics/cggeometry
import ../foundation / [ nsgeometry ]
import nsview

type NSWindow* = ptr object of NSObject

proc backingScaleFactor(s: NSWindow): CGFloat {.objc: "backingScaleFactor".}
proc scaleFactor*(s: NSWindow): CGFloat =
    if s.respondsToSelector("backingScaleFactor"):
        result = s.backingScaleFactor()
    else:
        result = 1

proc frame*(s: NSWindow): NSRect {.objc.}
proc contentRectForFrameRect*(s: NSWindow, r: NSRect): NSRect {.objc: "contentRectForFrameRect:".}
proc contentView*(s: NSWindow): NSView {.objc.}
