import ../objc/runtime
import ../foundation/nsgeometry

type
  NSTrackingArea* = ptr object of NSObject
  NSTrackingAreaOptions* {.size: sizeof(uint).} = enum
    NSTrackingMouseEnteredAndExited = 0x01
    NSTrackingMouseMoved = 0x02
    NSTrackingCursorUpdate = 0x04
    NSTrackingActiveWhenFirstResponder = 0x10
    NSTrackingActiveInKeyWindow = 0x20
    NSTrackingActiveInActiveApp = 0x40
    NSTrackingActiveAlways = 0x80
    NSTrackingAssumeInside = 0x100
    NSTrackingInVisibleRect = 0x200
    NSTrackingEnabledDuringMouseDrag = 0x400

proc `or`*(a, b: NSTrackingAreaOptions): NSTrackingAreaOptions {.inline.} =
  cast[NSTrackingAreaOptions](cast[uint](a) or cast[uint](b))

proc initWithRect*(
  self: NSTrackingArea,
  rect: NSRect,
  options: NSTrackingAreaOptions,
  owner: ID,
  userInfo: ID
): NSTrackingArea {.objc: "initWithRect:options:owner:userInfo:".}
