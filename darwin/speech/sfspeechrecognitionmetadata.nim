import ../objc/runtime

# SFSpeechRecognitionMetadata
# Metadata about speech in the audio of a speech recognition request
# Available in iOS 10.0+, macOS 10.15+, Mac Catalyst 13.0+

type
  SFSpeechRecognitionMetadata* = ptr object of NSObject

# Duration of the speech in seconds
proc speechDuration*(self: SFSpeechRecognitionMetadata): float64 {.objc: "speechDuration".}

# Start time of the speech in the audio (in seconds)
proc speechStartTimestamp*(self: SFSpeechRecognitionMetadata): float64 {.objc: "speechStartTimestamp".}

# Total duration of the audio (in seconds)
proc audioDuration*(self: SFSpeechRecognitionMetadata): float64 {.objc: "audioDuration".}

# Start time of the audio (in seconds)
proc audioStartTimestamp*(self: SFSpeechRecognitionMetadata): float64 {.objc: "audioStartTimestamp".}

# Voice analytics (available in iOS 13.0+, macOS 10.15+, Mac Catalyst 13.0+)
# Returns SFVoiceAnalytics object or nil if not available
proc voiceAnalytics*(self: SFSpeechRecognitionMetadata): ID {.objc: "voiceAnalytics".}

# Average pause duration between utterances (in seconds)
proc averagePauseDuration*(self: SFSpeechRecognitionMetadata): float64 {.objc: "averagePauseDuration".}

# Number of utterances detected
proc numberOfUtterances*(self: SFSpeechRecognitionMetadata): int {.objc: "numberOfUtterances".}
