import ../objc/[runtime]

type
  NSAutoreleasePool* = ptr object of NSObject

proc drain*(self: NSAutoreleasePool) {.objc: "drain".}
