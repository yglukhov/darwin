import ../objc/runtime
import ../foundation/nsarray
import vnrequest
import vnobservation
import vntypes

type
  VNDetectRectanglesRequest* = ptr object of VNImageBasedRequest

# VNDetectRectanglesRequest methods
proc init*(self: VNDetectRectanglesRequest): VNDetectRectanglesRequest {.objc: "init".}
proc initWithCompletionHandler*(self: VNDetectRectanglesRequest, handler: pointer): VNDetectRectanglesRequest {.objc: "initWithCompletionHandler:".}
proc results*(self: VNDetectRectanglesRequest): NSArray[VNRectangleObservation] {.objc: "results".}

# Properties
proc minimumAspectRatio*(self: VNDetectRectanglesRequest): VNAspectRatio {.objc: "minimumAspectRatio".}
proc setMinimumAspectRatio*(self: VNDetectRectanglesRequest, value: VNAspectRatio) {.objc: "setMinimumAspectRatio:".}
proc maximumAspectRatio*(self: VNDetectRectanglesRequest): VNAspectRatio {.objc: "maximumAspectRatio".}
proc setMaximumAspectRatio*(self: VNDetectRectanglesRequest, value: VNAspectRatio) {.objc: "setMaximumAspectRatio:".}
proc quadratureTolerance*(self: VNDetectRectanglesRequest): VNDegrees {.objc: "quadratureTolerance".}
proc setQuadratureTolerance*(self: VNDetectRectanglesRequest, value: VNDegrees) {.objc: "setQuadratureTolerance:".}
proc minimumSize*(self: VNDetectRectanglesRequest): cfloat {.objc: "minimumSize".}
proc setMinimumSize*(self: VNDetectRectanglesRequest, value: cfloat) {.objc: "setMinimumSize:".}
proc minimumConfidence*(self: VNDetectRectanglesRequest): VNConfidence {.objc: "minimumConfidence".}
proc setMinimumConfidence*(self: VNDetectRectanglesRequest, value: VNConfidence) {.objc: "setMinimumConfidence:".}
proc maximumObservations*(self: VNDetectRectanglesRequest): NSUInteger {.objc: "maximumObservations".}
proc setMaximumObservations*(self: VNDetectRectanglesRequest, value: NSUInteger) {.objc: "setMaximumObservations:".}

# Constants
const
  VNDetectRectanglesRequestRevision1* = 1.NSUInteger
