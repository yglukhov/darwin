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
proc getWidth*(pixelBuffer: CVPixelBufferRef): uint {.cdecl, importc: "CVPixelBufferGetWidth".}
  ## Returns the width of the pixel buffer.

proc getHeight*(pixelBuffer: CVPixelBufferRef): uint {.cdecl, importc: "CVPixelBufferGetHeight".}
  ## Returns the height of the pixel buffer.

proc getPixelFormatType*(pixelBuffer: CVPixelBufferRef): uint32 {.cdecl, importc: "CVPixelBufferGetPixelFormatType".}
  ## Returns the pixel format type.

proc lockBaseAddress*(pixelBuffer: CVPixelBufferRef; lockFlags: CVPixelBufferLockFlags): int32 {.cdecl, importc: "CVPixelBufferLockBaseAddress".}
  ## Locks the base address of the pixel buffer.

proc unlockBaseAddress*(pixelBuffer: CVPixelBufferRef; unlockFlags: CVPixelBufferLockFlags): int32 {.cdecl, importc: "CVPixelBufferUnlockBaseAddress".}
  ## Unlocks the base address of the pixel buffer.

proc getBaseAddress*(pixelBuffer: CVPixelBufferRef): pointer {.cdecl, importc: "CVPixelBufferGetBaseAddress".}
  ## Returns the base address of the pixel buffer.

proc getBytesPerRow*(pixelBuffer: CVPixelBufferRef): uint {.cdecl, importc: "CVPixelBufferGetBytesPerRow".}
  ## Returns the bytes per row.

proc getDataSize*(pixelBuffer: CVPixelBufferRef): uint {.cdecl, importc: "CVPixelBufferGetDataSize".}
  ## Returns the data size.

proc isPlanar*(pixelBuffer: CVPixelBufferRef): bool {.cdecl, importc: "CVPixelBufferIsPlanar".}
  ## Returns whether the pixel buffer is planar.

proc getPlaneCount*(pixelBuffer: CVPixelBufferRef): uint {.cdecl, importc: "CVPixelBufferGetPlaneCount".}
  ## Returns the plane count for planar buffers.

proc getWidthOfPlane*(pixelBuffer: CVPixelBufferRef; planeIndex: uint): uint {.cdecl, importc: "CVPixelBufferGetWidthOfPlane".}
  ## Returns the width of a plane.

proc getHeightOfPlane*(pixelBuffer: CVPixelBufferRef; planeIndex: uint): uint {.cdecl, importc: "CVPixelBufferGetHeightOfPlane".}
  ## Returns the height of a plane.

proc getBaseAddressOfPlane*(pixelBuffer: CVPixelBufferRef; planeIndex: uint): pointer {.cdecl, importc: "CVPixelBufferGetBaseAddressOfPlane".}
  ## Returns the base address of a plane.

proc getBytesPerRowOfPlane*(pixelBuffer: CVPixelBufferRef; planeIndex: uint): uint {.cdecl, importc: "CVPixelBufferGetBytesPerRowOfPlane".}
  ## Returns the bytes per row of a plane.

# Creation functions
proc CVPixelBufferCreate*(allocator: CFAllocator; width: uint; height: uint; pixelFormatType: uint32; pixelBufferAttributes: CFObject; pixelBufferOut: ptr CVPixelBufferRef): int32 {.cdecl, importc.}
  ## Creates a pixel buffer.

proc CVPixelBufferCreateWithBytes*(allocator: CFAllocator; width: uint; height: uint; pixelFormatType: uint32; baseAddress: pointer; bytesPerRow: uint; releaseCallback: pointer; releaseRefCon: pointer; pixelBufferAttributes: CFObject; pixelBufferOut: ptr CVPixelBufferRef): int32 {.cdecl, importc.}
  ## Creates a pixel buffer with existing bytes.
