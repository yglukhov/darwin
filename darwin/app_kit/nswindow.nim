import ../objc/runtime
import ../core_graphics/cggeometry
import ../foundation / [ nsgeometry ]
import nsview

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

proc `or`*(a,b:NSWindowStyleMask):cint = a.cint or b.cint
proc `or`*(a:cint,b:NSWindowStyleMask):cint = a or b.cint

proc backingScaleFactor(s: NSWindow): CGFloat {.objc: "backingScaleFactor".}
proc scaleFactor*(s: NSWindow): CGFloat =
    if s.respondsToSelector("backingScaleFactor"):
        result = s.backingScaleFactor()
    else:
        result = 1

proc frame*(s: NSWindow): NSRect {.objc.}
proc contentRectForFrameRect*(s: NSWindow, r: NSRect): NSRect {.objc: "contentRectForFrameRect:".}
proc contentView*(s: NSWindow): NSView {.objc.}
