import ../objc/runtime
import ../foundation/nsstring
import ../foundation/nsarray

type
  SFTranscriptionSegment* = ptr object of NSObject
  SFTranscription* = ptr object of NSObject
  SFSpeechRecognitionResult* = ptr object of NSObject

# SFTranscriptionSegment
proc substring*(self: SFTranscriptionSegment): NSString {.objc: "substring".}
proc substringRange*(self: SFTranscriptionSegment): ID {.objc: "substringRange".}
proc timestamp*(self: SFTranscriptionSegment): float64 {.objc: "timestamp".}
proc duration*(self: SFTranscriptionSegment): float64 {.objc: "duration".}
proc confidence*(self: SFTranscriptionSegment): float {.objc: "confidence".}
proc alternativeSubstrings*(self: SFTranscriptionSegment): NSArray[NSString] {.objc: "alternativeSubstrings".}

# SFTranscription
proc formattedString*(self: SFTranscription): NSString {.objc: "formattedString".}
proc segments*(self: SFTranscription): NSArray[SFTranscriptionSegment] {.objc: "segments".}

# SFSpeechRecognitionResult
proc bestTranscription*(self: SFSpeechRecognitionResult): SFTranscription {.objc: "bestTranscription".}
proc transcriptions*(self: SFSpeechRecognitionResult): NSArray[SFTranscription] {.objc: "transcriptions".}
proc isFinal*(self: SFSpeechRecognitionResult): bool {.objc: "isFinal".}

# Speech recognition metadata (available in iOS 10.0+, macOS 10.15+, Mac Catalyst 13.0+)
# Returns SFSpeechRecognitionMetadata object or nil if not available
proc speechRecognitionMetadata*(self: SFSpeechRecognitionResult): ID {.objc: "speechRecognitionMetadata".}
