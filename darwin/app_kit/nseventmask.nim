type
  NSEventMask* {.size: sizeof(uint64).} = enum
    LeftMouseDown       = 1 shl 1,
    LeftMouseUp         = 1 shl 2,
    RightMouseDown      = 1 shl 3,
    RightMouseUp        = 1 shl 4,
    MouseMoved          = 1 shl 5,
    LeftMouseDragged    = 1 shl 6,
    RightMouseDragged   = 1 shl 7,
    KeyDown             = 1 shl 10,
    KeyUp               = 1 shl 11,
    FlagsChanged        = 1 shl 12,
    ScrollWheel         = 1 shl 22,
    TabletPoint         = 1 shl 23,
    TabletProximity     = 1 shl 24,
    OtherMouseDown      = 1 shl 25,
    OtherMouseUp        = 1 shl 26,
    OtherMouseDragged   = 1 shl 27

const
  NSEventMaskAny* = cast[NSEventMask](uint64.high)
