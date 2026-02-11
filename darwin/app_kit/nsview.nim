import ../objc/runtime
import ../foundation / [ nsgeometry ]
import ../quartz_core / [ calayer ]
import ./nstrackingarea
import ./nstextinputcontext

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
proc initWithFrame*(self: NSView, rect: NSRect): NSView {.objc: "initWithFrame:".}
proc addSubview*(self: NSView, sub: NSView) {.objc: "addSubview:".}
proc addTrackingArea*(self: NSView, area: NSTrackingArea) {.objc: "addTrackingArea:".}
proc removeTrackingArea*(self: NSView, area: NSTrackingArea) {.objc: "removeTrackingArea:".}
proc setAutoresizingMask*(self: NSView, opts: NSAutoresizingMaskOptions) {.objc: "setAutoresizingMask:".}
proc setWantsLayer*(s: NSView, l: bool) {.objc: "setWantsLayer:".}
proc setLayer*(s: NSView, l: CALayer) {.objc: "setLayer:".}
proc setNeedsDisplay*(s: NSView, d: bool) {.objc: "setNeedsDisplay:".}
proc inputContext*(self: NSView): NSTextInputContext {.objc.}
