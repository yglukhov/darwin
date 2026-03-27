import ../objc/runtime
import ./nsevent

type
  NSTextInputContext* = ptr object of NSObject

proc handleEvent*(self: NSTextInputContext, event: NSEvent): BOOL {.objc: "handleEvent:".}
