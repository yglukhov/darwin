import ../objc/runtime
import ./nscontrol
import ./nsimage
import ./nscell

type
  NSImageView* = ptr object of NSControl

proc setImage*(self: NSImageView, image: NSImage) {.objc: "setImage:".}
proc setImageScaling*(self: NSImageView, scaling: NSImageScaling) {.objc: "setImageScaling:".}
