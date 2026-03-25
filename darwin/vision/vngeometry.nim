import ../objc/runtime
import ../foundation/nsarray
import ../foundation/nsstring
import ../foundation/nserror
import ../core_graphics/cggeometry

type
  VNPoint* = ptr object of NSObject
  VNPoint3D* = ptr object of NSObject
  VNVector* = ptr object of NSObject
  VNCircle* = ptr object of NSObject
  VNContour* = ptr object of NSObject

# VNPoint methods
proc zeroPoint*(self: typedesc[VNPoint]): VNPoint {.objc: "zeroPoint".}
proc pointByApplyingVector*(self: typedesc[VNPoint], vector: VNVector, toPoint: VNPoint): VNPoint {.objc: "pointByApplyingVector:toPoint:".}
proc distanceBetween*(self: typedesc[VNPoint], point1: VNPoint, point2: VNPoint): cdouble {.objc: "distanceBetweenPoint:point:".}
proc init*(self: VNPoint, x: cdouble, y: cdouble): VNPoint {.objc: "initWithX:y:".}
proc init*(self: VNPoint, location: CGPoint): VNPoint {.objc: "initWithLocation:".}
proc location*(self: VNPoint): CGPoint {.objc: "location".}
proc x*(self: VNPoint): cdouble {.objc: "x".}
proc y*(self: VNPoint): cdouble {.objc: "y".}
proc distanceToPoint*(self: VNPoint, point: VNPoint): cdouble {.objc: "distanceToPoint:".}

# VNPoint3D methods
proc init*(self: VNPoint3D, position: pointer): VNPoint3D {.objc: "initWithPosition:".}  # simd_float4x4
proc position*(self: VNPoint3D): pointer {.objc: "position".}  # simd_float4x4

# VNVector methods
proc zeroVector*(self: typedesc[VNVector]): VNVector {.objc: "zeroVector".}
proc unitVectorFor*(self: typedesc[VNVector], vector: VNVector): VNVector {.objc: "unitVectorForVector:".}
proc vectorByMultiplying*(self: typedesc[VNVector], vector: VNVector, byScalar: cdouble): VNVector {.objc: "vectorByMultiplyingVector:byScalar:".}
proc vectorByAdding*(self: typedesc[VNVector], v1: VNVector, toVector: VNVector): VNVector {.objc: "vectorByAddingVector:toVector:".}
proc vectorBySubtracting*(self: typedesc[VNVector], v1: VNVector, fromVector: VNVector): VNVector {.objc: "vectorBySubtractingVector:fromVector:".}
proc dotProduct*(self: typedesc[VNVector], v1: VNVector, v2: VNVector): cdouble {.objc: "dotProductOfVector:vector:".}
proc initWithComponents*(self: VNVector, xComponent: cdouble, yComponent: cdouble): VNVector {.objc: "initWithXComponent:yComponent:".}
proc initWithPolar*(self: VNVector, r: cdouble, theta: cdouble): VNVector {.objc: "initWithR:theta:".}
proc initWithHeadAndTail*(self: VNVector, head: VNPoint, tail: VNPoint): VNVector {.objc: "initWithVectorHead:tail:".}
proc x*(self: VNVector): cdouble {.objc: "x".}
proc y*(self: VNVector): cdouble {.objc: "y".}
proc r*(self: VNVector): cdouble {.objc: "r".}
proc theta*(self: VNVector): cdouble {.objc: "theta".}
proc length*(self: VNVector): cdouble {.objc: "length".}
proc squaredLength*(self: VNVector): cdouble {.objc: "squaredLength".}

# VNCircle methods
proc zeroCircle*(self: typedesc[VNCircle]): VNCircle {.objc: "zeroCircle".}
proc initWithCenterRadius*(self: VNCircle, center: VNPoint, radius: cdouble): VNCircle {.objc: "initWithCenter:radius:".}
proc initWithCenterDiameter*(self: VNCircle, center: VNPoint, diameter: cdouble): VNCircle {.objc: "initWithCenter:diameter:".}
proc containsPoint*(self: VNCircle, point: VNPoint): bool {.objc: "containsPoint:".}
proc containsPoint*(self: VNCircle, point: VNPoint, inCircumferentialRingOfWidth: cdouble): bool {.objc: "containsPoint:inCircumferentialRingOfWidth:".}
proc center*(self: VNCircle): VNPoint {.objc: "center".}
proc radius*(self: VNCircle): cdouble {.objc: "radius".}
proc diameter*(self: VNCircle): cdouble {.objc: "diameter".}

# VNContour methods
proc indexPath*(self: VNContour): pointer {.objc: "indexPath".}  # NSIndexPath
proc childContourCount*(self: VNContour): NSInteger {.objc: "childContourCount".}
proc childContours*(self: VNContour): NSArray[VNContour] {.objc: "childContours".}
proc childContourAtIndex*(self: VNContour, childContourIndex: NSUInteger, error: ptr NSError = nil): VNContour {.objc: "childContourAtIndex:error:".}
proc pointCount*(self: VNContour): NSInteger {.objc: "pointCount".}
proc normalizedPoints*(self: VNContour): pointer {.objc: "normalizedPoints".}  # simd_float2 const *
proc normalizedPath*(self: VNContour): pointer {.objc: "normalizedPath".}  # CGPathRef
proc aspectRatio*(self: VNContour): cfloat {.objc: "aspectRatio".}
proc polygonApproximation*(self: VNContour, epsilon: cfloat, error: ptr NSError = nil): VNContour {.objc: "polygonApproximationWithEpsilon:error:".}
