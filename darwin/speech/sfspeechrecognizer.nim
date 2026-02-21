{.passL: "-framework Speech".}

import ../objc/runtime
import ../foundation/nsstring
import ../foundation/nsarray

type
  SFSpeechRecognizer* = ptr object of NSObject
  SFSpeechRecognitionRequest* = ptr object of NSObject
  SFSpeechRecognitionTask* = ptr object of NSObject

  # Authorization status enum
  SFSpeechRecognizerAuthorizationStatus* {.size: sizeof(uint).} = enum
    sfSpeechRecognizerAuthorizationStatusNotDetermined = 0
    sfSpeechRecognizerAuthorizationStatusDenied = 1
    sfSpeechRecognizerAuthorizationStatusRestricted = 2
    sfSpeechRecognizerAuthorizationStatusAuthorized = 3

# Authorization status - use class method
proc authorizationStatus*(self: typedesc[SFSpeechRecognizer]): SFSpeechRecognizerAuthorizationStatus {.objc: "authorizationStatus".}

# Request authorization - use class method
proc requestAuthorization*(self: typedesc[SFSpeechRecognizer], handler: proc(status: SFSpeechRecognizerAuthorizationStatus)) {.objc: "requestAuthorization:".}

# Class methods
proc supportsOnDeviceRecognition*(self: typedesc[SFSpeechRecognizer]): bool {.objc: "supportsOnDeviceRecognition".}

# Instance methods
proc initWithLocale*(self: SFSpeechRecognizer, locale: ID): SFSpeechRecognizer {.objc: "initWithLocale:".}
proc isAvailable*(self: SFSpeechRecognizer): bool {.objc: "isAvailable".}
proc locale*(self: SFSpeechRecognizer): ID {.objc: "locale".}
proc queue*(self: SFSpeechRecognizer): ID {.objc: "queue".}
proc setQueue*(self: SFSpeechRecognizer, queue: ID) {.objc: "setQueue:".}
proc defaultTaskHint*(self: SFSpeechRecognizer): int {.objc: "defaultTaskHint".}
proc setDefaultTaskHint*(self: SFSpeechRecognizer, hint: int) {.objc: "setDefaultTaskHint:".}
proc requiresOnDeviceRecognition*(self: SFSpeechRecognizer): bool {.objc: "requiresOnDeviceRecognition".}
proc setRequiresOnDeviceRecognition*(self: SFSpeechRecognizer, requires: bool) {.objc: "setRequiresOnDeviceRecognition:".}

# Recognition task methods
proc recognitionTaskWithRequest*(self: SFSpeechRecognizer, request: SFSpeechRecognitionRequest): SFSpeechRecognitionTask {.objc: "recognitionTaskWithRequest:".}

# Delegate property
proc delegate*(self: SFSpeechRecognizer): ID {.objc: "delegate".}
proc setDelegate*(self: SFSpeechRecognizer, delegate: ID) {.objc: "setDelegate:".}
