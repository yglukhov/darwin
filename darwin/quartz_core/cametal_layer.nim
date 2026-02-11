import ../objc/runtime
import ./calayer
import ../core_graphics/cggeometry
import metalx/metal

{.passL: "-framework QuartzCore".}

type
  CAMetalLayer* = ptr object of CALayer
  CAMetalDrawable* = ptr object of NSObject

proc device*(l: CAMetalLayer): MTLDevice {.objc: "device".}
proc setDevice*(l: CAMetalLayer, d: MTLDevice) {.objc: "setDevice:".}
proc pixelFormat*(l: CAMetalLayer): MTLPixelFormat {.objc: "pixelFormat".}
proc setPixelFormat*(l: CAMetalLayer, f: MTLPixelFormat) {.objc: "setPixelFormat:".}
proc drawableSize*(l: CAMetalLayer): CGSize {.objc: "drawableSize".}
proc setDrawableSize*(l: CAMetalLayer, s: CGSize) {.objc: "setDrawableSize:".}
proc frame*(l: CAMetalLayer): CGRect {.objc: "frame".}
proc setFrame*(l: CAMetalLayer, r: CGRect) {.objc: "setFrame:".}
proc nextDrawable*(l: CAMetalLayer): CAMetalDrawable {.objc: "nextDrawable".}

proc texture*(d: CAMetalDrawable): MTLTexture {.objc: "texture".}
