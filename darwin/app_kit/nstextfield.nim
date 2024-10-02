import ../objc/runtime
import ./nscontrol
import ../foundation/nsgeometry
import ./nsfont
import ./nscolor

type 
  NSTextField* = ptr object of NSControl

proc setStringValue*(self: NSTextField, s: NSString) {.objc: "setStringValue:".}
proc setEditable*(self: NSTextField, b: BOOL) {.objc: "setEditable:".}
proc setBezeled*(self: NSTextField, b: BOOL) {.objc: "setBezeled:".}
proc setDrawsBackground*(self: NSTextField, b: BOOL) {.objc: "setDrawsBackground:".}
proc setFont*(self: NSTextField, f: NSFont) {.objc: "setFont:".}
proc setTextColor*(self: NSTextField, f: NSColor) {.objc: "setTextColor:".}
