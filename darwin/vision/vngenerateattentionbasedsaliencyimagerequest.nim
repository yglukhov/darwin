import ../objc/runtime
import ../foundation/nsarray
import vnrequest
import vnobservation

type
  VNGenerateAttentionBasedSaliencyImageRequest* = ptr object of VNImageBasedRequest

# VNGenerateAttentionBasedSaliencyImageRequest methods
proc initWithCompletionHandler*(self: VNGenerateAttentionBasedSaliencyImageRequest, handler: pointer): VNGenerateAttentionBasedSaliencyImageRequest {.objc: "initWithCompletionHandler:".}
proc results*(self: VNGenerateAttentionBasedSaliencyImageRequest): NSArray[VNSaliencyImageObservation] {.objc: "results".}
