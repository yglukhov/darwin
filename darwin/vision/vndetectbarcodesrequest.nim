import ../objc/runtime
import ../foundation/nsarray
import ../foundation/nserror
import vnrequest
import vnobservation
import vntypes

type
  VNDetectBarcodesRequest* = ptr object of VNImageBasedRequest

# VNDetectBarcodesRequest class methods
proc supportedSymbologies*(self: typedesc[VNDetectBarcodesRequest]): NSArray {.objc: "supportedSymbologies".}

# VNDetectBarcodesRequest instance methods
proc init*(self: VNDetectBarcodesRequest): VNDetectBarcodesRequest {.objc: "init".}
proc initWithCompletionHandler*(self: VNDetectBarcodesRequest, handler: pointer): VNDetectBarcodesRequest {.objc: "initWithCompletionHandler:".}
proc supportedSymbologiesAndReturnError*(self: VNDetectBarcodesRequest, error: ptr NSError = nil): NSArray {.objc: "supportedSymbologiesAndReturnError:".}
proc symbologies*(self: VNDetectBarcodesRequest): NSArray {.objc: "symbologies".}
proc setSymbologies*(self: VNDetectBarcodesRequest, symbologies: NSArray) {.objc: "setSymbologies:".}
proc coalesceCompositeSymbologies*(self: VNDetectBarcodesRequest): bool {.objc: "coalesceCompositeSymbologies".}
proc setCoalesceCompositeSymbologies*(self: VNDetectBarcodesRequest, value: bool) {.objc: "setCoalesceCompositeSymbologies:".}
proc results*(self: VNDetectBarcodesRequest): NSArray {.objc: "results".}  # NSArray<VNBarcodeObservation*>
