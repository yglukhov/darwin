import ../objc/runtime
import ../foundation/nsstring
import vntypes
import vngeometry

type
  VNDetectedPoint* = ptr object of VNPoint
  VNRecognizedPoint* = ptr object of VNDetectedPoint

# VNDetectedPoint methods
proc confidence*(self: VNDetectedPoint): VNConfidence {.objc: "confidence".}

# VNRecognizedPoint methods
proc identifier*(self: VNRecognizedPoint): VNRecognizedPointKey {.objc: "identifier".}
