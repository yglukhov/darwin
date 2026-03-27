import ../objc/runtime
import ../foundation/nsarray
import vnrequest
import vnobservation

type
  VNDetectFaceLandmarksRequest* = ptr object of VNImageBasedRequest

# VNDetectFaceLandmarksRequest methods
proc init*(self: VNDetectFaceLandmarksRequest): VNDetectFaceLandmarksRequest {.objc: "init".}
proc initWithCompletionHandler*(self: VNDetectFaceLandmarksRequest, handler: pointer): VNDetectFaceLandmarksRequest {.objc: "initWithCompletionHandler:".}
proc results*(self: VNDetectFaceLandmarksRequest): NSArray[VNFaceObservation] {.objc: "results".}

# Constants
const
  VNDetectFaceLandmarksRequestRevision1* = 1.NSUInteger
  VNDetectFaceLandmarksRequestRevision2* = 2.NSUInteger
  VNDetectFaceLandmarksRequestRevision3* = 3.NSUInteger
