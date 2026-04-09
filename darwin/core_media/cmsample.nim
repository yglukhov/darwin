# CoreMedia CMSampleBuffer bindings
# https://developer.apple.com/documentation/coremedia/cmsamplebuffer

import ../core_video/cvbuffer

# Types
type
  CMSampleBufferRef* = pointer  # struct opaqueCMSampleBuffer*
  CMItemCount* = int64
  CMTimeValue* = int64
  CMTimeScale* = int32
  CMTimeFlags* = uint32
  CMTimeEpoch* = int64
  
  CMTime* = object
    value*: CMTimeValue
    timescale*: CMTimeScale
    flags*: CMTimeFlags
    epoch*: CMTimeEpoch

# CMSampleBuffer errors
const
  kCMSampleBufferError_AllocationFailed* = -12730
  kCMSampleBufferError_RequiredParameterMissing* = -12731
  kCMSampleBufferError_AlreadyHasDataBuffer* = -12732
  kCMSampleBufferError_BufferNotReady* = -12733
  kCMSampleBufferError_SampleIndexOutOfRange* = -12734
  kCMSampleBufferError_BufferHasNoSampleSizes* = -12735
  kCMSampleBufferError_BufferHasNoSampleTimingInfo* = -12736
  kCMSampleBufferError_ArrayTooSmall* = -12737

# Core functions
proc CMSampleBufferGetImageBuffer*(sbuf: CMSampleBufferRef): CVImageBufferRef {.cdecl, importc.}
  ## Returns a CMSampleBuffer's CVImageBuffer of media data.
  ## The caller does not own the returned dataBuffer.

proc CMSampleBufferGetNumSamples*(sbuf: CMSampleBufferRef): CMItemCount {.cdecl, importc.}
  ## Returns the number of media samples in a CMSampleBuffer.

proc CMSampleBufferGetDuration*(sbuf: CMSampleBufferRef): CMTime {.cdecl, importc.}
  ## Returns the total duration of a CMSampleBuffer.

proc CMSampleBufferGetPresentationTimeStamp*(sbuf: CMSampleBufferRef): CMTime {.cdecl, importc.}
  ## Returns the presentation timestamp of the first sample in a CMSampleBuffer.

proc CMSampleBufferGetDecodeTimeStamp*(sbuf: CMSampleBufferRef): CMTime {.cdecl, importc.}
  ## Returns the decode timestamp of the first sample in a CMSampleBuffer.

proc CMSampleBufferGetSampleSize*(sbuf: CMSampleBufferRef; sampleIndex: CMItemCount): uint {.cdecl, importc.}
  ## Returns the size of a specified sample in a CMSampleBuffer.

proc CMSampleBufferGetTotalSampleSize*(sbuf: CMSampleBufferRef): uint {.cdecl, importc.}
  ## Returns the total size in bytes of all samples in a CMSampleBuffer.

proc CMSampleBufferDataIsReady*(sbuf: CMSampleBufferRef): bool {.cdecl, importc.}
  ## Returns whether a CMSampleBuffer's data is ready.

proc CMSampleBufferMakeDataReady*(sbuf: CMSampleBufferRef): int32 {.cdecl, importc.}
  ## Makes a CMSampleBuffer's data ready.

proc CMSampleBufferInvalidate*(sbuf: CMSampleBufferRef): int32 {.cdecl, importc.}
  ## Invalidates a CMSampleBuffer.

proc CMSampleBufferIsValid*(sbuf: CMSampleBufferRef): bool {.cdecl, importc.}
  ## Returns whether a CMSampleBuffer is valid.

# CFRetain/CFRelease for memory management (from CoreFoundation)
proc CFRetain*(cf: pointer) {.cdecl, importc.}
proc CFRelease*(cf: pointer) {.cdecl, importc.}
