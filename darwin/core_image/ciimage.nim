import ../objc/runtime
import ../core_graphics/[cgimage, cggeometry]
import ../foundation/[nsstring, nsarray, nsdictionary]

type
  CIImage* = ptr object of NSObject
  CIFormat* = cint

# CIImage creation
proc imageWithCGImage*(t: typedesc[CIImage], image: CGImage): CIImage {.objc: "imageWithCGImage:".}
proc imageWithCGImage*(t: typedesc[CIImage], image: CGImage, options: NSDictionary): CIImage {.objc: "imageWithCGImage:options:".}

# CVPixelBuffer support
type CVPixelBuffer = pointer
proc imageWithCVPixelBuffer*(t: typedesc[CIImage], pixelBuffer: CVPixelBuffer): CIImage {.objc: "imageWithCVPixelBuffer:".}
proc imageWithCVPixelBuffer*(t: typedesc[CIImage], pixelBuffer: CVPixelBuffer, options: NSDictionary): CIImage {.objc: "imageWithCVPixelBuffer:options:".}

# CIImage properties
proc extent*(i: CIImage): CGRect {.objc.}
proc properties*(i: CIImage): NSDictionary {.objc.}

# CIFormat constants
var kCIFormatARGB8* {.importc.}: CIFormat
var kCIFormatBGRA8* {.importc.}: CIFormat
var kCIFormatRGBA8* {.importc.}: CIFormat
