import ../objc/runtime
import ../foundation/nsarray
import ../foundation/nserror
import vnrequest
import vnobservation
import vntypes

type
  VNDetectBarcodesRequest* = ptr object of VNImageBasedRequest

# VNDetectBarcodesRequest class methods
proc supportedSymbologies*(self: typedesc[VNDetectBarcodesRequest]): NSArray[NSString] {.objc: "supportedSymbologies".}  # NSArray<VNBarcodeSymbology>

# VNDetectBarcodesRequest instance methods
proc init*(self: VNDetectBarcodesRequest): VNDetectBarcodesRequest {.objc: "init".}
proc initWithCompletionHandler*(self: VNDetectBarcodesRequest, handler: pointer): VNDetectBarcodesRequest {.objc: "initWithCompletionHandler:".}
proc supportedSymbologiesAndReturnError*(self: VNDetectBarcodesRequest, error: ptr NSError = nil): NSArray[NSString] {.objc: "supportedSymbologiesAndReturnError:".}  # NSArray<VNBarcodeSymbology>
proc symbologies*(self: VNDetectBarcodesRequest): NSArray[NSString] {.objc: "symbologies".}  # NSArray<VNBarcodeSymbology>
proc setSymbologies*(self: VNDetectBarcodesRequest, symbologies: NSArray[NSString]) {.objc: "setSymbologies:".}  # NSArray<VNBarcodeSymbology>
proc coalesceCompositeSymbologies*(self: VNDetectBarcodesRequest): bool {.objc: "coalesceCompositeSymbologies".}
proc setCoalesceCompositeSymbologies*(self: VNDetectBarcodesRequest, value: bool) {.objc: "setCoalesceCompositeSymbologies:".}
proc results*(self: VNDetectBarcodesRequest): NSArray[VNBarcodeObservation] {.objc: "results".}
