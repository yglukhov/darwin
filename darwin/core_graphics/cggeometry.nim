
when sizeof(pointer) == 8:
    type CGFloat* = cdouble
else:
    type CGFloat* = cfloat


type
    CGPoint* {.bycopy.} = object
        x*: CGFloat
        y*: CGFloat

    CGSize* {.bycopy.} = object
        width*: CGFloat
        height*: CGFloat

    CGVector* {.bycopy.} = object
        dx*: CGFloat
        dy*: CGFloat

    CGRect* {.bycopy.} = object
        origin*: CGPoint
        size*: CGSize

proc CGPointMake*(x, y: CGFloat): CGPoint {.inline.} =
    result.x = x
    result.y = y
