import ../objc/runtime
import ../core_graphics/cggeometry
import ../foundation / [ nsgeometry ]
import nsview
import ./nscolor
import ./nsscreen
import ./nsappearance

type 
  NSWindow* = ptr object of NSObject
  NSWindowStyleMask* {.size: sizeof(uint).} = enum
    NSWindowStyleMaskBorderless             = 0
    NSWindowStyleMaskTitled                 = 1 shl 0
    NSWindowStyleMaskClosable               = 1 shl 1
    NSWindowStyleMaskMiniaturizable         = 1 shl 2
    NSWindowStyleMaskResizable              = 1 shl 3
    NSWindowStyleMaskUtilityWindow          = 1 shl 4
    NSWindowStyleMaskDocModalWindow         = 1 shl 6
    NSWindowStyleMaskNonactivatingPanel     = 1 shl 7
    NSWindowStyleMaskUnifiedTitleAndToolbar = 1 shl 12
    NSWindowStyleMaskHUDWindow              = 1 shl 13
    NSWindowStyleMaskFullScreen             = 1 shl 14
    NSWindowStyleMaskFullSizeContentView    = 1 shl 15
  NSBackingStoreType* {.size: sizeof(uint).} = enum
    NSBackingStoreBuffered = 2

proc `or`*(a, b: NSWindowStyleMask): NSWindowStyleMask {.inline.} =
  cast[NSWindowStyleMask](cast[uint](a) or cast[uint](b))

proc `or`*(a: cint, b: NSWindowStyleMask): cint = a or b.cint

proc backingScaleFactor(s: NSWindow): CGFloat {.objc: "backingScaleFactor".}
proc scaleFactor*(s: NSWindow): CGFloat =
    if s.respondsToSelector("backingScaleFactor"):
        result = s.backingScaleFactor()
    else:
        result = 1

proc initWithContentRect*(s: NSWindow, contentRect: NSRect, styleMask: NSWindowStyleMask, backing: NSBackingStoreType, `defer`: BOOL):  NSWindow {.objc: "initWithContentRect:styleMask:backing:defer:", discardable.}
proc setTitle*(s: NSWindow, title: NSString) {.objc: "setTitle:".}
proc setContentView*(s: NSWindow, view: NSView) {.objc: "setContentView:".}
proc makeFirstResponder*(s: NSWindow, v: NSView): BOOL {.objc: "makeFirstResponder:".}
proc center*(s: NSWindow) {.objc.}
proc frame*(s: NSWindow): NSRect {.objc.}
proc setFrame*(s: NSWindow, rect: NSRect, display: BOOL) {.objc: "setFrame:display:".}
proc contentRectForFrameRect*(s: NSWindow, r: NSRect): NSRect {.objc: "contentRectForFrameRect:".}
proc contentView*(s: NSWindow): NSView {.objc.}
proc screen*(s: NSWindow): NSScreen {.objc.}
proc close*(s: NSWindow) {.objc.}
proc orderFront*(s: NSWindow, sender: ID) {.objc: "orderFront:".}
proc orderOut*(s: NSWindow, sender: ID) {.objc: "orderOut:".}
proc orderFrontRegardless*(s: NSWindow) {.objc.}
proc toggleFullScreen*(s: NSWindow, sender: ID) {.objc: "toggleFullScreen:".}
proc zoom*(s: NSWindow, sender: ID) {.objc: "zoom:".}
proc isZoomed*(s: NSWindow): BOOL {.objc: "isZoomed".}
proc miniaturize*(s: NSWindow, sender: ID) {.objc: "miniaturize:".}
proc deminiaturize*(s: NSWindow, sender: ID) {.objc: "deminiaturize:".}
proc setMinSize*(s: NSWindow, size: NSSize) {.objc: "setMinSize:".}
proc setMaxSize*(s: NSWindow, size: NSSize) {.objc: "setMaxSize:".}
proc mouseLocationOutsideOfEventStream*(s: NSWindow): NSPoint {.objc.}
proc setReleasedWhenClosed*(s: NSWindow, b: BOOL) {.objc: "setReleasedWhenClosed:".}
proc setRestorable*(s: NSWindow, b: BOOL) {.objc: "setRestorable:".}
proc setBackgroundColor*(s: NSWindow, c: NSColor) {.objc: "setBackgroundColor:".}
proc setStyleMask*(s: NSWindow, m: NSWindowStyleMask) {.objc: "setStyleMask:".}
proc makeKeyAndOrderFront*(s: NSWindow, sender: ID) {.objc: "makeKeyAndOrderFront:".}
proc setDelegate*(s: NSWindow, d: NSObject) {.objc: "setDelegate:".}

# NSAppearanceCustomization protocol
proc appearance*(self: NSWindow): NSAppearance {.objc.}
proc `appearance=`*(self: NSWindow, appearance: NSAppearance) {.objc: "setAppearance:".}
proc effectiveAppearance*(self: NSWindow): NSAppearance {.objc.}
