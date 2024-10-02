import ../objc/runtime
import ../core_graphics/cggeometry
type 
  NSFont* = ptr object of NSObject

proc systemFontOfSize*(self: typedesc[NSFont], size: CGFloat): NSFont {.objc: "systemFontOfSize:".}