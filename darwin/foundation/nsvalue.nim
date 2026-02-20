import ../objc/runtime
import ./nsrange

export NSRange

type
  NSValue* = ptr object of NSObject

proc rangeValue*(self: NSValue): NSRange {.objc: "rangeValue".}
