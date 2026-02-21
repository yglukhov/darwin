import ../objc/runtime
import ../foundation/nsstring
import ../foundation/nsurl
import ../foundation/nsarray

type
  SFSpeechRecognitionRequest* = ptr object of NSObject
  SFSpeechURLRecognitionRequest* = ptr object of SFSpeechRecognitionRequest
  SFSpeechAudioBufferRecognitionRequest* = ptr object of SFSpeechRecognitionRequest

# SFSpeechRecognitionRequest properties
proc shouldReportPartialResults*(self: SFSpeechRecognitionRequest): bool {.objc: "shouldReportPartialResults".}
proc setShouldReportPartialResults*(self: SFSpeechRecognitionRequest, value: bool) {.objc: "setShouldReportPartialResults:".}
proc contextualStrings*(self: SFSpeechRecognitionRequest): NSArray[NSString] {.objc: "contextualStrings".}
proc setContextualStrings*(self: SFSpeechRecognitionRequest, strings: NSArray[NSString]) {.objc: "setContextualStrings:".}
proc interactionIdentifier*(self: SFSpeechRecognitionRequest): NSString {.objc: "interactionIdentifier".}
proc setInteractionIdentifier*(self: SFSpeechRecognitionRequest, identifier: NSString) {.objc: "setInteractionIdentifier:".}
proc requiresOnDeviceRecognition*(self: SFSpeechRecognitionRequest): bool {.objc: "requiresOnDeviceRecognition".}
proc setRequiresOnDeviceRecognition*(self: SFSpeechRecognitionRequest, requires: bool) {.objc: "setRequiresOnDeviceRecognition:".}

# SFSpeechURLRecognitionRequest
proc initWithURL*(self: SFSpeechURLRecognitionRequest, url: NSURL): SFSpeechURLRecognitionRequest {.objc: "initWithURL:".}

# SFSpeechAudioBufferRecognitionRequest
proc nativeAudioFormat*(self: SFSpeechAudioBufferRecognitionRequest): ID {.objc: "nativeAudioFormat".}
proc appendAudioPCMBuffer*(self: SFSpeechAudioBufferRecognitionRequest, buffer: ID) {.objc: "appendAudioPCMBuffer:".}
proc appendAudioSampleBuffer*(self: SFSpeechAudioBufferRecognitionRequest, sampleBuffer: ID) {.objc: "appendAudioSampleBuffer:".}
proc endAudio*(self: SFSpeechAudioBufferRecognitionRequest) {.objc: "endAudio".}
