{.passL: "-framework CoreMedia".}

# CMSampleBuffer types and functions
type
  CMSampleBufferRef* = pointer
  CVImageBufferRef* = pointer

proc CMSampleBufferGetImageBuffer*(buffer: CMSampleBufferRef): CVImageBufferRef {.cdecl, importc.}
