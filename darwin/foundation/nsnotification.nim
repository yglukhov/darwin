import ../objc/runtime

type NSNotification* = ptr object of NSObject

proc `object`*(self: NSNotification): ID {.objc.}
