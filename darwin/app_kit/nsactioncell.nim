import ../objc/runtime
import ./nscell

type
  NSActionCell* = ptr object of NSCell

proc target*(self: NSActionCell): Id {.objc: "target".}
proc setTarget*(self: NSActionCell, target: Id) {.objc: "setTarget:".}

proc action*(self: NSActionCell): SEL {.objc: "action".}
proc setAction*(self: NSActionCell, action: SEL) {.objc: "setAction:".}

proc tag*(self: NSActionCell): NSInteger {.objc: "tag".}
proc setTag*(self: NSActionCell, tag: NSInteger) {.objc: "setTag:".}
