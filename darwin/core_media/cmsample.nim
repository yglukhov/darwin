# CoreMedia CMSampleBuffer bindings
# https://developer.apple.com/documentation/coremedia/cmsamplebuffer

import ../core_foundation/cfbase
import ../core_video/cvbuffer

# Types
type
  CMSampleBufferRef* = ptr object of CFObject  # CFType
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

  CMTimeRange* = object
    start*: CMTime
    duration*: CMTime

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
  kCMSampleBufferError_CannotSubdivide* = -12738
  kCMSampleBufferError_SampleTimingInfoInvalid* = -12739
  kCMSampleBufferError_InvalidMediaTypeForOperation* = -12740
  kCMSampleBufferError_InvalidSampleData* = -12741
  kCMSampleBufferError_InvalidMediaFormat* = -12742
  kCMSampleBufferError_Invalidated* = -12743
  kCMSampleBufferError_DataFailed* = -16750
  kCMSampleBufferError_DataCanceled* = -16751

# Core functions
proc getImageBuffer*(sbuf: CMSampleBufferRef): CVImageBufferRef {.cdecl, importc: "CMSampleBufferGetImageBuffer".}
  ## Returns a CMSampleBuffer's CVImageBuffer of media data.
  ## The caller does not own the returned dataBuffer.

proc getNumSamples*(sbuf: CMSampleBufferRef): CMItemCount {.cdecl, importc: "CMSampleBufferGetNumSamples".}
  ## Returns the number of media samples in a CMSampleBuffer.

proc getDuration*(sbuf: CMSampleBufferRef): CMTime {.cdecl, importc: "CMSampleBufferGetDuration".}
  ## Returns the total duration of a CMSampleBuffer.

proc getPresentationTimeStamp*(sbuf: CMSampleBufferRef): CMTime {.cdecl, importc: "CMSampleBufferGetPresentationTimeStamp".}
  ## Returns the presentation timestamp of the first sample.

proc getDecodeTimeStamp*(sbuf: CMSampleBufferRef): CMTime {.cdecl, importc: "CMSampleBufferGetDecodeTimeStamp".}
  ## Returns the decode timestamp of the first sample.

proc getSampleSize*(sbuf: CMSampleBufferRef; sampleIndex: CMItemCount): uint {.cdecl, importc: "CMSampleBufferGetSampleSize".}
  ## Returns the size of a specified sample.

proc getTotalSampleSize*(sbuf: CMSampleBufferRef): uint {.cdecl, importc: "CMSampleBufferGetTotalSampleSize".}
  ## Returns the total size in bytes of all samples.

proc dataIsReady*(sbuf: CMSampleBufferRef): bool {.cdecl, importc: "CMSampleBufferDataIsReady".}
  ## Returns whether a CMSampleBuffer's data is ready.

proc makeDataReady*(sbuf: CMSampleBufferRef): int32 {.cdecl, importc: "CMSampleBufferMakeDataReady".}
  ## Makes a CMSampleBuffer's data ready.

proc invalidate*(sbuf: CMSampleBufferRef): int32 {.cdecl, importc: "CMSampleBufferInvalidate".}
  ## Invalidates a CMSampleBuffer.

proc isValid*(sbuf: CMSampleBufferRef): bool {.cdecl, importc: "CMSampleBufferIsValid".}
  ## Returns whether a CMSampleBuffer is valid.
