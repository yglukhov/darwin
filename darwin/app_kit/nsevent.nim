import ../objc/runtime
import ../core_graphics/cggeometry
import ../foundation/[nsgeometry, nsstring, nsdate]

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
    NSEventModifierFlags* {.size: sizeof(uint).} = enum
      NSEventModifierFlagCapsLock = 1 shl 16
      NSEventModifierFlagShift = 1 shl 17
      NSEventModifierFlagControl = 1 shl 18
      NSEventModifierFlagOption = 1 shl 19
      NSEventModifierFlagCommand = 1 shl 20
      NSEventModifierFlagNumericPad = 1 shl 21
      NSEventModifierFlagHelp = 1 shl 22
      NSEventModifierFlagFunction = 1 shl 23
      NSEventModifierFlagDeviceIndependentFlagsMask = 0xffff0000.uint

proc kind*(e: NSEvent): NSEventKind {.objc: "type".}
proc locationInWindow*(e: NSEvent): NSPoint {.objc: "locationInWindow".}

# Timestamp of the event
proc timestamp*(self: NSEvent): NSTimeInterval {.objc: "timestamp".}

# Modifier flags (Shift, Control, Command, etc.)
proc modifierFlags*(self: NSEvent): NSEventModifierFlags {.objc: "modifierFlags".}

# Event window number
proc windowNumber*(self: NSEvent): NSInteger {.objc: "windowNumber".}

# Get the characters for a key event
proc characters*(self: NSEvent): NSString {.objc: "characters".}

# Get the key code for a key event
proc keyCode*(self: NSEvent): uint16 {.objc: "keyCode".}

# Mouse button number (for mouse-related events)
proc buttonNumber*(self: NSEvent): NSInteger {.objc: "buttonNumber".}

# Delta of scrolling for scroll wheel events
proc scrollingDeltaX*(self: NSEvent): CGFloat {.objc: "scrollingDeltaX".}
proc scrollingDeltaY*(self: NSEvent): CGFloat {.objc: "scrollingDeltaY".}

# Check if the event is a key repeat
proc isARepeat*(self: NSEvent): BOOL {.objc: "isARepeat".}

# Check if the event is a tablet event
proc isTabletEvent*(self: NSEvent): BOOL {.objc: "isTabletPointingDevice".}

# Class methods for event creation (mouse event example)
proc mouseEventWithType*(self: typedesc[NSEvent], eventType: NSEventKind, location: CGPoint, modifierFlags: NSUInteger,
                         timestamp: NSTimeInterval, windowNumber: NSInteger,
                         buttonNumber: NSInteger, clickCount: NSInteger, pressure: CGFloat): NSEvent {.objc: "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:buttonNumber:clickCount:pressure:".}

proc charactersIgnoringModifiers*(self: NSEvent): NSString {.objc: "charactersIgnoringModifiers".}
