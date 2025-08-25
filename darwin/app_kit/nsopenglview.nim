import ../objc/runtime
import ../foundation / [ nsgeometry ]
import ./[nsview, nsopengl]

type
  NSOpenGLView* = ptr object of NSView

proc initWithFrame*(self: NSOpenGLView, frame: NSRect, pixelFormat: NSOpenGLPixelFormat): NSOpenGLView {.objc: "initWithFrame:pixelFormat:".}

proc setWantsBestResolutionOpenGLSurface*(self: NSOpenGLView, flag: bool) {.objc: "setWantsBestResolutionOpenGLSurface:".}
proc openGLContext*(self: NSOpenGLView): NSOpenGLContext {.objc.}
proc reshape*(self: NSOpenGLView) {.objc.}
