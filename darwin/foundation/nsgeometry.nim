
import ../core_graphics/cggeometry

type
    NSPoint* = CGPoint
    NSRect* = CGRect
    NSSize* = CGSize

proc NSMakePoint*(x, y: CGFloat): NSPoint =
    result.x = x
    result.y = y

proc NSMakeSize*(w, h: CGFloat): NSSize =
    result.width = w
    result.height = h

proc NSMakeRect*(x, y, w, h: CGFloat): NSRect =
    result.origin.x = x
    result.origin.y = y
    result.size.width = w
    result.size.height = h
