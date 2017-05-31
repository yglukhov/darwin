import cggeometry

type CGAffineTransform* = object
    a*, b*, c*, d*: CGFloat
    tx*, ty*: CGFloat

var
    CGAffineTransformIdentityAux {.importc: "CGAffineTransformIdentity".}: CGAffineTransform

template CGAffineTransformIdentity*: CGAffineTransform =
    let a = CGAffineTransformIdentityAux; a

proc translate*(t: CGAffineTransform, tx, ty: CGFloat): CGAffineTransform {.importc: "CGAffineTransformTranslate".}
proc scale*(t: CGAffineTransform, sx, sy: CGFloat): CGAffineTransform {.importc: "CGAffineTransformScale".}
proc rotate*(t: CGAffineTransform, angle: CGFloat): CGAffineTransform {.importc: "CGAffineTransformRotate".}
proc invert*(t: CGAffineTransform): CGAffineTransform {.importc: "CGAffineTransformInvert".}
proc concat*(t1, t2: CGAffineTransform): CGAffineTransform {.importc: "CGAffineTransformConcat".}
