import ../objc/runtime
import ./nscontrol
import ./nscolor

type
  NSTextField* = ptr object of NSControl

proc setEditable*(self: NSTextField, b: BOOL) {.objc: "setEditable:".}
proc setBezeled*(self: NSTextField, b: BOOL) {.objc: "setBezeled:".}
proc setDrawsBackground*(self: NSTextField, b: BOOL) {.objc: "setDrawsBackground:".}
proc setTextColor*(self: NSTextField, f: NSColor) {.objc: "setTextColor:".}
