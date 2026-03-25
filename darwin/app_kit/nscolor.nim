import ../objc/runtime
import ../core_graphics/cggeometry

type
  NSColor* = ptr object of NSObject

# Factory methods
proc colorWithDeviceRed*(self: typedesc[NSColor], red, green, blue, alpha: CGFloat): NSColor {.objc: "colorWithDeviceRed:green:blue:alpha:".}
proc colorWithRed*(self: typedesc[NSColor], red, green, blue, alpha: CGFloat): NSColor {.objc: "colorWithRed:green:blue:alpha:".}

# Common colors
proc blackColor*(self: typedesc[NSColor]): NSColor {.objc: "blackColor".}
proc whiteColor*(self: typedesc[NSColor]): NSColor {.objc: "whiteColor".}
proc clearColor*(self: typedesc[NSColor]): NSColor {.objc: "clearColor".}
