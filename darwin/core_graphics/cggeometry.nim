
when sizeof(pointer) == 8:
    type CGFloat* = cdouble
else:
    type CGFloat* = cfloat


type
    CGPoint* = object
        x*: CGFloat
        y*: CGFloat

    CGSize* = object
        width*: CGFloat
        height*: CGFloat

    CGVector* = object
        dx*: CGFloat
        dy*: CGFloat

    CGRect* = object
        origin*: CGPoint
        size*: CGSize

proc CGPointMake*(x, y: CGFloat): CGPoint {.inline.} =
    result.x = x
    result.y = y
