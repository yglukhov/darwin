import ../objc/runtime
import ../foundation/nsarray
import vnrequest
import vnobservation

type
  VNDetectFaceRectanglesRequest* = ptr object of VNImageBasedRequest

# VNDetectFaceRectanglesRequest methods
proc init*(self: VNDetectFaceRectanglesRequest): VNDetectFaceRectanglesRequest {.objc: "init".}
proc initWithCompletionHandler*(self: VNDetectFaceRectanglesRequest, handler: pointer): VNDetectFaceRectanglesRequest {.objc: "initWithCompletionHandler:".}
proc results*(self: VNDetectFaceRectanglesRequest): NSArray {.objc: "results".}  # NSArray<VNFaceObservation*>
