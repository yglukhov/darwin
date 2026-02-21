import ../objc/runtime
import ../foundation/nsstring

type
  SFSpeechRecognitionTask* = ptr object of NSObject

  SFSpeechRecognitionTaskHint* {.size: sizeof(uint).} = enum
    sfSpeechRecognitionTaskHintUnspecified = 0
    sfSpeechRecognitionTaskHintDictation = 1
    sfSpeechRecognitionTaskHintSearch = 2
    sfSpeechRecognitionTaskHintConfirmation = 3

  SFSpeechRecognitionTaskState* {.size: sizeof(uint).} = enum
    sfSpeechRecognitionTaskStateStarting = 0
    sfSpeechRecognitionTaskStateRunning = 1
    sfSpeechRecognitionTaskStateFinishing = 2
    sfSpeechRecognitionTaskStateCanceling = 3
    sfSpeechRecognitionTaskStateCompleted = 4

# Task properties
proc state*(self: SFSpeechRecognitionTask): SFSpeechRecognitionTaskState {.objc: "state".}
proc isFinishing*(self: SFSpeechRecognitionTask): bool {.objc: "isFinishing".}
proc isCancelled*(self: SFSpeechRecognitionTask): bool {.objc: "isCancelled".}
proc error*(self: SFSpeechRecognitionTask): ID {.objc: "error".}

# Task control
proc cancel*(self: SFSpeechRecognitionTask) {.objc: "cancel".}
proc finish*(self: SFSpeechRecognitionTask) {.objc: "finish".}

# Delegate property
proc delegate*(self: SFSpeechRecognitionTask): ID {.objc: "delegate".}
proc setDelegate*(self: SFSpeechRecognitionTask, delegate: ID) {.objc: "setDelegate:".}
