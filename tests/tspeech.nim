import ../darwin/speech
import ../darwin/foundation

# Test 1: Check authorization status
block authorization_status:
  let status = SFSpeechRecognizer.authorizationStatus()
  # Status should be one of the enum values
  doAssert(status.ord >= 0 and status.ord <= 3)

# Test 2: Check SFSpeechRecognizer class methods
block recognizer_class_methods:
  discard SFSpeechRecognizer.authorizationStatus()

# Test 3: Create SFSpeechRecognizer instance
block recognizer_creation:
  let recognizer = SFSpeechRecognizer.alloc().init()
  doAssert(recognizer != nil)
  discard recognizer.isAvailable()

# Test 4: Create SFSpeechURLRecognitionRequest
block url_request_creation:
  let url = NSURL.fileURLWithPath(NSString("/tmp/test.wav"))
  let request = SFSpeechURLRecognitionRequest.alloc().initWithURL(url)
  doAssert(request != nil)

# Test 5: Create SFSpeechAudioBufferRecognitionRequest
block audio_buffer_request_creation:
  let request = SFSpeechAudioBufferRecognitionRequest.alloc().init()
  doAssert(request != nil)
  discard request.shouldReportPartialResults()

# Test 6: Test request properties
block request_properties:
  let request = SFSpeechAudioBufferRecognitionRequest.alloc().init()
  request.setShouldReportPartialResults(true)
  doAssert(request.shouldReportPartialResults() == true)
  request.setShouldReportPartialResults(false)
  doAssert(request.shouldReportPartialResults() == false)

# Test 7: Test transcription segment and result types exist
block transcription_types:
  var segment: SFTranscriptionSegment
  var transcription: SFTranscription
  var result: SFSpeechRecognitionResult
  discard segment
  discard transcription
  discard result

# Test 8: Test task state enum
block task_state_enum:
  doAssert(sfSpeechRecognitionTaskStateStarting.ord == 0)
  doAssert(sfSpeechRecognitionTaskStateRunning.ord == 1)
  doAssert(sfSpeechRecognitionTaskStateFinishing.ord == 2)
  doAssert(sfSpeechRecognitionTaskStateCanceling.ord == 3)
  doAssert(sfSpeechRecognitionTaskStateCompleted.ord == 4)

# Test 9: Test task hint enum
block task_hint_enum:
  doAssert(sfSpeechRecognitionTaskHintUnspecified.ord == 0)
  doAssert(sfSpeechRecognitionTaskHintDictation.ord == 1)
  doAssert(sfSpeechRecognitionTaskHintSearch.ord == 2)
  doAssert(sfSpeechRecognitionTaskHintConfirmation.ord == 3)

# Test 10: Test recognizer basic properties
block recognizer_properties:
  let recognizer = SFSpeechRecognizer.alloc().init()
  recognizer.setDefaultTaskHint(sfSpeechRecognitionTaskHintDictation.ord)
  doAssert(recognizer.defaultTaskHint() == sfSpeechRecognitionTaskHintDictation.ord)
