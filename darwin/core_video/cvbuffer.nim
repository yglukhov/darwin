# CoreVideo Buffer types

type
  CVBufferRef* = distinct pointer        # struct __CVBuffer *
  CVImageBufferRef* = CVBufferRef        # alias for CVBufferRef
  CVPixelBufferRef* = CVBufferRef        # alias for CVBufferRef
