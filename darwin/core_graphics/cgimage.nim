import darwin / core_foundation / [cfbase, cfstring]
import cgcolor_space, cggeometry

type
    CGImage* = ptr object of CFObject
    CGDataProvider* = ptr object of CFObject

    CGImageAlphaInfo* {.size: sizeof(uint32).} = enum
        kCGImageAlphaNone
        kCGImageAlphaPremultipliedLast
        kCGImageAlphaPremultipliedFirst
        kCGImageAlphaLast
        kCGImageAlphaFirst
        kCGImageAlphaNoneSkipLast
        kCGImageAlphaNoneSkipFirst
        kCGImageAlphaOnly

    CGImageByteOrderInfo* {.size: sizeof(uint32).} = enum
        kCGImageByteOrderMask = 0x7000
        kCGImageByteOrderDefault = 0
        kCGImageByteOrder16Little = 1 shl 12
        kCGImageByteOrder32Little = 2 shl 12
        kCGImageByteOrder16Big = 3 shl 12
        kCGImageByteOrder32Big = 4 shl 12

    CGImagePixelFormatInfo* {.size: sizeof(uint32).} = enum
        kCGImagePixelFormatMask = 0xF0000
        kCGImagePixelFormatPacked = 0
        kCGImagePixelFormatRGB555 = 1 shl 16
        kCGImagePixelFormatRGB565 = 2 shl 16
        kCGImagePixelFormatRGB101010 = 3 shl 16
        kCGImagePixelFormatRGBCIF10 = 4 shl 16

    CGBitmapInfo* {.size: sizeof(uint32).} = enum
        kCGBitmapAlphaInfoMask = 0x1F
        kCGBitmapFloatInfoMask = 0xF00
        kCGBitmapFloatComponents = 1 shl 8
        kCGBitmapByteOrderMask = kCGImageByteOrderMask.ord
        kCGBitmapByteOrderDefault = kCGImageByteOrderDefault.ord
        kCGBitmapByteOrder16Little = kCGImageByteOrder16Little.ord
        kCGBitmapByteOrder32Little = kCGImageByteOrder32Little.ord
        kCGBitmapByteOrder16Big = kCGImageByteOrder16Big.ord
        kCGBitmapByteOrder32Big = kCGImageByteOrder32Big.ord

    CGColorRenderingIntent* {.size: sizeof(int32).} = enum
        kCGRenderingIntentDefault
        kCGRenderingIntentAbsoluteColorimetric
        kCGRenderingIntentRelativeColorimetric
        kCGRenderingIntentPerceptual
        kCGRenderingIntentSaturation

# Byte order host constants (computed at compile time)
when system.cpuEndian == bigEndian:
    const kCGBitmapByteOrder16Host* = kCGBitmapByteOrder16Big
    const kCGBitmapByteOrder32Host* = kCGBitmapByteOrder32Big
else:
    const kCGBitmapByteOrder16Host* = kCGBitmapByteOrder16Little
    const kCGBitmapByteOrder32Host* = kCGBitmapByteOrder32Little

# Type ID
proc CGImageGetTypeID*(): CFTypeID {.importc.}

# Create functions - keep original C names
proc CGImageCreate*(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow: csize,
    space: CGColorSpace, bitmapInfo: CGBitmapInfo, provider: CGDataProvider,
    decode: ptr CGFloat, shouldInterpolate: bool, intent: CGColorRenderingIntent): CGImage {.importc.}

proc CGImageMaskCreate*(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow: csize,
    provider: CGDataProvider, decode: ptr CGFloat, shouldInterpolate: bool): CGImage {.importc.}

proc CGImageCreateCopy*(image: CGImage): CGImage {.importc.}

proc CGImageCreateWithJPEGDataProvider*(source: CGDataProvider, decode: ptr CGFloat,
    shouldInterpolate: bool, intent: CGColorRenderingIntent): CGImage {.importc.}

proc CGImageCreateWithPNGDataProvider*(source: CGDataProvider, decode: ptr CGFloat,
    shouldInterpolate: bool, intent: CGColorRenderingIntent): CGImage {.importc.}

proc CGImageCreateWithImageInRect*(image: CGImage, rect: CGRect): CGImage {.importc.}

proc CGImageCreateWithMask*(image: CGImage, mask: CGImage): CGImage {.importc.}

proc CGImageCreateWithMaskingColors*(image: CGImage, components: ptr CGFloat): CGImage {.importc.}

proc CGImageCreateCopyWithColorSpace*(image: CGImage, space: CGColorSpace): CGImage {.importc.}

# HDR Content Headroom (macOS 15.0+, iOS 18.0+) - keep C names
proc CGImageCreateWithContentHeadroom*(headroom: cfloat, width, height, bitsPerComponent,
    bitsPerPixel, bytesPerRow: csize, space: CGColorSpace, bitmapInfo: CGBitmapInfo,
    provider: CGDataProvider, decode: ptr CGFloat, shouldInterpolate: bool,
    intent: CGColorRenderingIntent): CGImage {.importc.}

proc CGImageCreateCopyWithContentHeadroom*(headroom: cfloat, image: CGImage): CGImage {.importc.}

var kCGDefaultHDRImageContentHeadroom* {.importc.}: cfloat

# Retain/Release - concise naming
proc retain*(image: CGImage): CGImage {.importc: "CGImageRetain".}
proc release*(image: CGImage) {.importc: "CGImageRelease".}

# Image properties - concise naming for image as first parameter
proc isMask*(image: CGImage): bool {.importc: "CGImageIsMask".}
proc getWidth*(image: CGImage): csize {.importc: "CGImageGetWidth".}
proc getHeight*(image: CGImage): csize {.importc: "CGImageGetHeight".}
proc getBitsPerComponent*(image: CGImage): csize {.importc: "CGImageGetBitsPerComponent".}
proc getBitsPerPixel*(image: CGImage): csize {.importc: "CGImageGetBitsPerPixel".}
proc getBytesPerRow*(image: CGImage): csize {.importc: "CGImageGetBytesPerRow".}
proc getColorSpace*(image: CGImage): CGColorSpace {.importc: "CGImageGetColorSpace".}
proc getAlphaInfo*(image: CGImage): CGImageAlphaInfo {.importc: "CGImageGetAlphaInfo".}
proc getDataProvider*(image: CGImage): CGDataProvider {.importc: "CGImageGetDataProvider".}
proc getDecode*(image: CGImage): ptr CGFloat {.importc: "CGImageGetDecode".}
proc getShouldInterpolate*(image: CGImage): bool {.importc: "CGImageGetShouldInterpolate".}
proc getRenderingIntent*(image: CGImage): CGColorRenderingIntent {.importc: "CGImageGetRenderingIntent".}
proc getBitmapInfo*(image: CGImage): CGBitmapInfo {.importc: "CGImageGetBitmapInfo".}
proc getByteOrderInfo*(image: CGImage): CGImageByteOrderInfo {.importc: "CGImageGetByteOrderInfo".}
proc getPixelFormatInfo*(image: CGImage): CGImagePixelFormatInfo {.importc: "CGImageGetPixelFormatInfo".}
proc getContentHeadroom*(image: CGImage): cfloat {.importc: "CGImageGetContentHeadroom".}

# Tone mapping (macOS 15.0+, iOS 18.0+) - concise naming
proc shouldToneMap*(image: CGImage): bool {.importc: "CGImageShouldToneMap".}
proc containsImageSpecificToneMappingMetadata*(image: CGImage): bool {.importc: "CGImageContainsImageSpecificToneMappingMetadata".}

# UTType - concise naming
proc getUTType*(image: CGImage): CFString {.importc: "CGImageGetUTType".}
