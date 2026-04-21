import ../objc/runtime
import ../foundation/nsarray
import ../foundation/nserror
import ../foundation/nsstring
import ../foundation/nsindexset
import ../core_graphics/cggeometry
import vntypes
import vnobservation

type
  VNRequest* = ptr object of NSObject
  VNImageBasedRequest* = ptr object of VNRequest

# VNRequest methods
proc initWithCompletionHandler*(self: VNRequest, handler: pointer): VNRequest {.objc: "initWithCompletionHandler:".}
proc preferBackgroundProcessing*(self: VNRequest): bool {.objc: "preferBackgroundProcessing".}
proc setPreferBackgroundProcessing*(self: VNRequest, value: bool) {.objc: "setPreferBackgroundProcessing:".}
proc usesCPUOnly*(self: VNRequest): bool {.objc: "usesCPUOnly".}
proc setUsesCPUOnly*(self: VNRequest, value: bool) {.objc: "setUsesCPUOnly:".}
proc results*(self: VNRequest): NSArray[VNObservation] {.objc: "results".}
proc completionHandler*(self: VNRequest): pointer {.objc: "completionHandler".}
proc revision*(self: VNRequest): NSUInteger {.objc: "revision".}
proc setRevision*(self: VNRequest, value: NSUInteger) {.objc: "setRevision:".}
proc cancel*(self: VNRequest) {.objc: "cancel".}

# Class methods for VNRequest
proc supportedRevisions*(self: typedesc[VNRequest]): NSIndexSet {.objc: "supportedRevisions".}
proc defaultRevision*(self: typedesc[VNRequest]): NSUInteger {.objc: "defaultRevision".}
proc currentRevision*(self: typedesc[VNRequest]): NSUInteger {.objc: "currentRevision".}

# VNImageBasedRequest methods
proc regionOfInterest*(self: VNImageBasedRequest): CGRect {.objc: "regionOfInterest".}
proc setRegionOfInterest*(self: VNImageBasedRequest, value: CGRect) {.objc: "setRegionOfInterest:".}
