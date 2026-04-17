import ../objc/runtime

type
  CGEventMask* = uint64
  CFTimeInterval* = float64
  CGEventSource* = pointer
  CGEventSourceStateID* {.size: sizeof(cint).} = enum
    EventSourceStatePrivate = -1
    EventSourceStateCombinedSessionState = 0
    EventSourceStateHIDSystemState = 1
  CGEventType* {.size: sizeof(cuint).} = enum
    EventNull = 0
    LeftMouseDown = 1
    LeftMouseUp = 2
    RightMouseDown = 3
    RightMouseUp = 4
    MouseMoved = 5
    LeftMouseDragged = 6
    RightMouseDragged = 7
    KeyDown = 10
    KeyUp = 11
    FlagsChanged = 12
    ScrollWheel = 22
    TabletPointer = 23
    TabletProximity = 24
    OtherMouseDown = 25
    OtherMouseUp = 26
    OtherMouseDragged = 27

# Get the elapsed seconds since the last input event
proc CGEventSourceSecondsSinceLastEventType*(
  stateID: CGEventSourceStateID,
  eventType: CGEventType
): CFTimeInterval {.cdecl, importc.}

# Get the event type mask for a given event type
proc CGEventMaskBit*(eventType: CGEventType): CGEventMask {.inline.} =
  result = 1.CGEventMask shl eventType.cuint

# Get the elapsed seconds since any input event
proc CGEventSourceSecondsSinceLastEvent*(
  stateID: CGEventSourceStateID
): CFTimeInterval {.cdecl, importc: "CGEventSourceSecondsSinceLastEventType".}

# Convenience proc to get idle time (seconds since any event)
proc getIdleTime*(): float64 =
  result = CGEventSourceSecondsSinceLastEventType(
    EventSourceStateCombinedSessionState,
    EventNull
  )
