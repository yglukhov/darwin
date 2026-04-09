{.passL: "-framework CoreVideo".}

import foundation/nsstring
import core_video/cvbuffer
export cvbuffer

# CVPixelBuffer keys
var kCVPixelBufferPixelFormatTypeKey* {.importc: "kCVPixelBufferPixelFormatTypeKey".}: NSString

# Common pixel format types
const
  kCVPixelFormatType_32BGRA* = 0x42475241
  kCVPixelFormatType_32ARGB* = 0x52474241
  kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange* = 0x34323076
  kCVPixelFormatType_420YpCbCr8BiPlanarFullRange* = 0x34323066
