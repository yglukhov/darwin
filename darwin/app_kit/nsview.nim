import ../objc/runtime
import ../foundation / [ nsgeometry ]

type NSView* = ptr object of NSObject

proc convertPointFromView*(v: NSView, point: NSPoint, fromView: NSView): NSPoint {.objc: "convertPoint:fromView:".}
proc convertPointToView*(v: NSView, point: NSPoint, toView: NSView): NSPoint {.objc: "convertPoint:toView:".}
proc convertRectToBacking*(v: NSView, rect: NSRect): NSRect {.objc: "convertRectToBacking:".}
proc frame*(v: NSView): NSRect {.objc: "frame".}
proc bounds*(v: NSView): NSRect {.objc: "bounds".}
