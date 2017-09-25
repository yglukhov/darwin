import ../objc/runtime
import ../foundation/nsgeometry

type
    NSEvent* = ptr object of NSObject

    NSEventKind* = enum
        NSLeftMouseDown      = 1,
        NSLeftMouseUp        = 2,
        NSRightMouseDown     = 3,
        NSRightMouseUp       = 4,
        NSMouseMoved         = 5,
        NSLeftMouseDragged   = 6,
        NSRightMouseDragged  = 7,
        NSMouseEntered       = 8,
        NSMouseExited        = 9,
        NSKeyDown            = 10,
        NSKeyUp              = 11,
        NSFlagsChanged       = 12,
        NSAppKitDefined      = 13,
        NSSystemDefined      = 14,
        NSApplicationDefined = 15,
        NSPeriodic           = 16,
        NSCursorUpdate       = 17,
        NSEventTypeRotate    = 18,
        NSEventTypeBeginGesture = 19,
        NSEventTypeEndGesture   = 20
        NSScrollWheel        = 22,
        NSTabletPoint        = 23,
        NSTabletProximity    = 24,
        NSOtherMouseDown     = 25,
        NSOtherMouseUp       = 26,
        NSOtherMouseDragged  = 27
        NSEventTypeGesture   = 29,
        NSEventTypeMagnify   = 30,
        NSEventTypeSwipe     = 31,
        NSEventTypeSmartMagnify = 32,
        NSEventTypeQuickLook   = 33
        NSEventTypePressure   = 34

proc kind*(e: NSEvent): NSEventKind {.objc: "type".}
proc locationInWindow*(e: NSEvent): NSPoint {.objc: "locationInWindow".}
