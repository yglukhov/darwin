import ../objc/runtime
import ../core_graphics/cggeometry
import ../foundation/nsstring

type
  CIFeature* = ptr object of NSObject
  CIFaceFeature* = ptr object of CIFeature
  CIRectangleFeature* = ptr object of CIFeature
  CIQRCodeFeature* = ptr object of CIFeature
  CIFeatureType* = NSString

# CIFeature properties
proc `type`*(f: CIFeature): NSString {.objc.}
proc bounds*(f: CIFeature): CGRect {.objc.}

# CIFaceFeature properties
proc hasFaceAngle*(f: CIFaceFeature): BOOL {.objc.}
proc faceAngle*(f: CIFaceFeature): float32 {.objc.}
proc hasLeftEyePosition*(f: CIFaceFeature): BOOL {.objc.}
proc leftEyePosition*(f: CIFaceFeature): CGPoint {.objc.}
proc hasRightEyePosition*(f: CIFaceFeature): BOOL {.objc.}
proc rightEyePosition*(f: CIFaceFeature): CGPoint {.objc.}
proc hasMouthPosition*(f: CIFaceFeature): BOOL {.objc.}
proc mouthPosition*(f: CIFaceFeature): CGPoint {.objc.}
proc hasSmile*(f: CIFaceFeature): BOOL {.objc.}
proc leftEyeClosed*(f: CIFaceFeature): BOOL {.objc.}
proc rightEyeClosed*(f: CIFaceFeature): BOOL {.objc.}

# Feature types
var CIFeatureTypeFace* {.importc.}: CIFeatureType
var CIFeatureTypeRectangle* {.importc.}: CIFeatureType
var CIFeatureTypeQRCode* {.importc.}: CIFeatureType
