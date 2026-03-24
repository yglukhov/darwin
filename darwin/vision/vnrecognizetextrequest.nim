import ../objc/runtime
import ../foundation/nsarray
import ../foundation/nserror
import vnrequest
import vnobservation
import vntypes

type
  VNRecognizeTextRequest* = ptr object of VNImageBasedRequest

# VNRecognizeTextRequest class methods
proc supportedRecognitionLanguagesForTextRecognitionLevelRevisionError*(self: typedesc[VNRecognizeTextRequest], recognitionLevel: VNRequestTextRecognitionLevel, requestRevision: NSUInteger, error: ptr NSError = nil): NSArray {.objc: "supportedRecognitionLanguagesForTextRecognitionLevel:revision:error:".}

# VNRecognizeTextRequest instance methods
proc init*(self: VNRecognizeTextRequest): VNRecognizeTextRequest {.objc: "init".}
proc initWithCompletionHandler*(self: VNRecognizeTextRequest, handler: pointer): VNRecognizeTextRequest {.objc: "initWithCompletionHandler:".}
proc supportedRecognitionLanguagesAndReturnError*(self: VNRecognizeTextRequest, error: ptr NSError = nil): NSArray {.objc: "supportedRecognitionLanguagesAndReturnError:".}
proc recognitionLanguages*(self: VNRecognizeTextRequest): NSArray {.objc: "recognitionLanguages".}
proc setRecognitionLanguages*(self: VNRecognizeTextRequest, languages: NSArray) {.objc: "setRecognitionLanguages:".}
proc customWords*(self: VNRecognizeTextRequest): NSArray {.objc: "customWords".}
proc setCustomWords*(self: VNRecognizeTextRequest, words: NSArray) {.objc: "setCustomWords:".}
proc recognitionLevel*(self: VNRecognizeTextRequest): VNRequestTextRecognitionLevel {.objc: "recognitionLevel".}
proc setRecognitionLevel*(self: VNRecognizeTextRequest, level: VNRequestTextRecognitionLevel) {.objc: "setRecognitionLevel:".}
proc usesLanguageCorrection*(self: VNRecognizeTextRequest): bool {.objc: "usesLanguageCorrection".}
proc setUsesLanguageCorrection*(self: VNRecognizeTextRequest, value: bool) {.objc: "setUsesLanguageCorrection:".}
proc automaticallyDetectsLanguage*(self: VNRecognizeTextRequest): bool {.objc: "automaticallyDetectsLanguage".}
proc setAutomaticallyDetectsLanguage*(self: VNRecognizeTextRequest, value: bool) {.objc: "setAutomaticallyDetectsLanguage:".}
proc minimumTextHeight*(self: VNRecognizeTextRequest): cfloat {.objc: "minimumTextHeight".}
proc setMinimumTextHeight*(self: VNRecognizeTextRequest, value: cfloat) {.objc: "setMinimumTextHeight:".}
proc results*(self: VNRecognizeTextRequest): NSArray {.objc: "results".}  # NSArray<VNRecognizedTextObservation*>

# Progress handling
proc progressHandler*(self: VNRecognizeTextRequest): pointer {.objc: "progressHandler".}
proc setProgressHandler*(self: VNRecognizeTextRequest, handler: pointer) {.objc: "setProgressHandler:".}
proc indeterminate*(self: VNRecognizeTextRequest): bool {.objc: "indeterminate".}
