import ../core_foundation/[cfbase]
import ../opengl/[cgltypes]
import ./cvreturn, ./cvbase

export cvreturn, cvbase

type
  CVDisplayLink* = ptr object of CFObject
  CVDisplayLinkOutputCallback* = proc(displayLink: CVDisplayLink, inNow, inOutputTime: ptr CVTimeStamp, flagsIn: CVOptionFlags, flagsOut: var CVOptionFlags, userInfo: pointer) {.cdecl.}


proc CVDisplayLinkCreateWithActiveCGDisplays*(l: ptr CVDisplayLink): CVReturn {.importc.}
proc setOutputCallback*(l: CVDisplayLink, cb: CVDisplayLinkOutputCallback, userInfo: pointer): CVReturn {.importc: "CVDisplayLinkSetOutputCallback".}
proc setCurrentCGDisplayFromOpenGLContext*(l: CVDisplayLink, cglContext: CGLContextObj, cglPixelFormat: CGLPixelFormatObj): CVReturn {.importc: "CVDisplayLinkSetCurrentCGDisplayFromOpenGLContext".}
proc start*(l: CVDisplayLink): CVReturn {.importc: "CVDisplayLinkStart".}
proc stop*(l: CVDisplayLink): CVReturn {.importc: "CVDisplayLinkStop".}
