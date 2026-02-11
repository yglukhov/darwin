import ../objc/runtime
import ../opengl/[cgltypes]

type
  NSOpenGLPixelFormat* = ptr object of NSObject
  NSOpenGLContext* = ptr object of NSObject
  NSOpenGLContextParameter* {.size: sizeof(cint).} = enum
    NSOpenGLContextParameterSwapInterval = 222
    NSOpenGLContextParameterSurfaceOpacity = 236

const
  NSOpenGLPFAAllRenderers* = 1.uint32
  NSOpenGLPFATripleBuffer* = 3.uint32
  NSOpenGLPFADoubleBuffer* = 5.uint32
  NSOpenGLPFAAuxBuffers* = 7.uint32
  NSOpenGLPFAColorSize* = 8.uint32
  NSOpenGLPFAAlphaSize* = 11.uint32
  NSOpenGLPFADepthSize* = 12.uint32
  NSOpenGLPFAStencilSize* = 13.uint32
  NSOpenGLPFAAccumSize* = 14.uint32
  NSOpenGLPFAMinimumPolicy* = 51.uint32
  NSOpenGLPFAMaximumPolicy* = 52.uint32
  NSOpenGLPFASampleBuffers* = 55.uint32
  NSOpenGLPFASamples* = 56.uint32
  NSOpenGLPFAAuxDepthStencil* = 57.uint32
  NSOpenGLPFAColorFloat* = 58.uint32
  NSOpenGLPFAMultisample* = 59.uint32
  NSOpenGLPFASupersample* = 60.uint32
  NSOpenGLPFASampleAlpha* = 61.uint32
  NSOpenGLPFARendererID* = 70.uint32
  NSOpenGLPFANoRecovery* = 72.uint32
  NSOpenGLPFAAccelerated* = 73.uint32
  NSOpenGLPFAClosestPolicy* = 74.uint32
  NSOpenGLPFABackingStore* = 76.uint32
  NSOpenGLPFAScreenMask* = 84.uint32
  NSOpenGLPFAAllowOfflineRenderers* = 96.uint32
  NSOpenGLPFAAcceleratedCompute* = 97.uint32
  NSOpenGLPFAOpenGLProfile* = 99.uint32
  NSOpenGLPFAVirtualScreenCount* = 128.uint32
  NSOpenGLProfileVersionLegacy* = 0x1000'u32
  NSOpenGLProfileVersion3_2Core* = 0x3200'u32
  NSOpenGLProfileVersion4_1Core* = 0x4100'u32

proc initWithAttributes*(self: NSOpenGLPixelFormat, attrs: ptr uint32): NSOpenGLPixelFormat {.objc: "initWithAttributes:".}
proc cglPixelFormatObj*(self: NSOpenGLPixelFormat): CGLPixelFormatObj {.importc: "CGLPixelFormatObj".}

proc flushBuffer*(self: NSOpenGLContext) {.objc.}
proc makeCurrentContext*(self: NSOpenGLContext) {.objc.}
proc setValues*(self: NSOpenGLContext, values: ptr int32, forParameter: NSOpenGLContextParameter) {.objc: "setValues:forParameter:".}
proc getValues*(self: NSOpenGLContext, values: ptr int32, forParameter: NSOpenGLContextParameter) {.objc: "getValues:forParameter:".}
proc cglContextObj*(self: NSOpenGLContext): CGLContextObj {.objc: "CGLContextObj".}
