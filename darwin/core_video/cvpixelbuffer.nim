# CoreVideo CVPixelBuffer bindings
# https://developer.apple.com/documentation/corevideo/cvpixelbuffer

import ../core_foundation/cfbase
import cvbuffer

# Types
type
  CVPixelBufferRef* = CVImageBufferRef  # Alias
  
  CVPixelBufferLockFlags* {.size: sizeof(uint64).} = enum
    kCVPixelBufferLock_ReadOnly = 1

# Pixel buffer attribute keys
var
  kCVPixelBufferPixelFormatTypeKey* {.importc.}: CFString
  kCVPixelBufferMemoryAllocatorKey* {.importc.}: CFString
  kCVPixelBufferWidthKey* {.importc.}: CFString
  kCVPixelBufferHeightKey* {.importc.}: CFString
  kCVPixelBufferExtendedPixelsLeftKey* {.importc.}: CFString
  kCVPixelBufferExtendedPixelsTopKey* {.importc.}: CFString
  kCVPixelBufferExtendedPixelsRightKey* {.importc.}: CFString
  kCVPixelBufferExtendedPixelsBottomKey* {.importc.}: CFString
  kCVPixelBufferBytesPerRowAlignmentKey* {.importc.}: CFString
  kCVPixelBufferCGBitmapContextCompatibilityKey* {.importc.}: CFString
  kCVPixelBufferCGImageCompatibilityKey* {.importc.}: CFString
  kCVPixelBufferPlaneAlignmentKey* {.importc.}: CFString
  kCVPixelBufferIOSurfacePropertiesKey* {.importc.}: CFString
  kCVPixelBufferMetalCompatibilityKey* {.importc.}: CFString

# Common pixel format types
const
  kCVPixelFormatType_32BGRA* = 0x42475241'u32
  kCVPixelFormatType_32ARGB* = 0x52474241'u32
  kCVPixelFormatType_24RGB* = 0x00000018'u32
  kCVPixelFormatType_24BGR* = 0x32344247'u32
  kCVPixelFormatType_16BE555* = 0x42453535'u32
  kCVPixelFormatType_16BE565* = 0x42353635'u32
  kCVPixelFormatType_32RGBA* = 0x41424752'u32
  kCVPixelFormatType_64ARGB* = 0x62363461'u32
  kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange* = 0x34323076'u32
  kCVPixelFormatType_420YpCbCr8BiPlanarFullRange* = 0x34323066'u32
  kCVPixelFormatType_422YpCbCr8* = 0x32767579'u32
  kCVPixelFormatType_422YpCbCr8_yuvs* = 0x79757673'u32

# CVPixelBuffer functions
proc CVPixelBufferGetWidth*(pixelBuffer: CVPixelBufferRef): uint {.cdecl, importc.}
  ## Returns the width of the pixel buffer.

proc CVPixelBufferGetHeight*(pixelBuffer: CVPixelBufferRef): uint {.cdecl, importc.}
  ## Returns the height of the pixel buffer.

proc CVPixelBufferGetPixelFormatType*(pixelBuffer: CVPixelBufferRef): uint32 {.cdecl, importc.}
  ## Returns the pixel format type.

proc CVPixelBufferLockBaseAddress*(pixelBuffer: CVPixelBufferRef; lockFlags: CVPixelBufferLockFlags): int32 {.cdecl, importc.}
  ## Locks the base address of the pixel buffer.

proc CVPixelBufferUnlockBaseAddress*(pixelBuffer: CVPixelBufferRef; unlockFlags: CVPixelBufferLockFlags): int32 {.cdecl, importc.}
  ## Unlocks the base address of the pixel buffer.

proc CVPixelBufferGetBaseAddress*(pixelBuffer: CVPixelBufferRef): pointer {.cdecl, importc.}
  ## Returns the base address of the pixel buffer.

proc CVPixelBufferGetBytesPerRow*(pixelBuffer: CVPixelBufferRef): uint {.cdecl, importc.}
  ## Returns the bytes per row.

proc CVPixelBufferGetDataSize*(pixelBuffer: CVPixelBufferRef): uint {.cdecl, importc.}
  ## Returns the data size.

proc CVPixelBufferIsPlanar*(pixelBuffer: CVPixelBufferRef): bool {.cdecl, importc.}
  ## Returns whether the pixel buffer is planar.

proc CVPixelBufferGetPlaneCount*(pixelBuffer: CVPixelBufferRef): uint {.cdecl, importc.}
  ## Returns the plane count for planar buffers.

proc CVPixelBufferGetWidthOfPlane*(pixelBuffer: CVPixelBufferRef; planeIndex: uint): uint {.cdecl, importc.}
  ## Returns the width of a plane.

proc CVPixelBufferGetHeightOfPlane*(pixelBuffer: CVPixelBufferRef; planeIndex: uint): uint {.cdecl, importc.}
  ## Returns the height of a plane.

proc CVPixelBufferGetBaseAddressOfPlane*(pixelBuffer: CVPixelBufferRef; planeIndex: uint): pointer {.cdecl, importc.}
  ## Returns the base address of a plane.

proc CVPixelBufferGetBytesPerRowOfPlane*(pixelBuffer: CVPixelBufferRef; planeIndex: uint): uint {.cdecl, importc.}
  ## Returns the bytes per row of a plane.

# Creation functions
proc CVPixelBufferCreate*(allocator: CFAllocator; width: uint; height: uint; pixelFormatType: uint32; pixelBufferAttributes: CFObject; pixelBufferOut: ptr CVPixelBufferRef): int32 {.cdecl, importc.}
  ## Creates a pixel buffer.

proc CVPixelBufferCreateWithBytes*(allocator: CFAllocator; width: uint; height: uint; pixelFormatType: uint32; baseAddress: pointer; bytesPerRow: uint; releaseCallback: pointer; releaseRefCon: pointer; pixelBufferAttributes: CFObject; pixelBufferOut: ptr CVPixelBufferRef): int32 {.cdecl, importc.}
  ## Creates a pixel buffer with existing bytes.
