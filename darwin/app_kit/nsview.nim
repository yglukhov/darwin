import ../objc/runtime
import ../foundation / [ nsgeometry ]

type 
  NSView* = ptr object of NSObject
  NSAutoresizingMaskOptions* {.size: sizeof(uint).} = enum
    NSViewNotSizable = 0
    NSViewMinXMargin = 1
    NSViewWidthSizable = 2
    NSViewMaxXMargin = 4
    NSViewMinYMargin = 8
    NSViewHeightSizable = 16
    NSViewMaxYMargin = 32

proc convertPointFromView*(v: NSView, point: NSPoint, fromView: NSView): NSPoint {.objc: "convertPoint:fromView:".}
proc convertPointToView*(v: NSView, point: NSPoint, toView: NSView): NSPoint {.objc: "convertPoint:toView:".}
proc convertRectToBacking*(v: NSView, rect: NSRect): NSRect {.objc: "convertRectToBacking:".}
proc frame*(v: NSView): NSRect {.objc: "frame".}
proc bounds*(v: NSView): NSRect {.objc: "bounds".}
