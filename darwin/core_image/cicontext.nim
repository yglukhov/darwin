import ../objc/runtime
import ../core_graphics/[cgimage, cggeometry]
import ../foundation/nsdictionary
import ciimage

type
  CIContext* = ptr object of NSObject

# CIContext creation
proc context*(t: typedesc[CIContext]): CIContext {.objc.}
proc contextWithOptions*(t: typedesc[CIContext], options: NSDictionary): CIContext {.objc: "contextWithOptions:".}

# Rendering
proc createCGImage*(c: CIContext, image: CIImage, fromRect: CGRect): CGImage {.objc: "createCGImage:fromRect:".}
