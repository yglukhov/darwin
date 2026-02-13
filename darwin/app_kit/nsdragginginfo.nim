import ../objc/runtime
import ../foundation/nsgeometry
import ./nspasteboard
type 
  NSDraggingInfo* = ptr object of NSObject

proc draggingPasteboard*(self: NSDraggingInfo): NSPasteboard {.objc: "draggingPasteboard".}
proc draggingLocation*(self: NSDraggingInfo): NSPoint {.objc: "draggingLocation".}
