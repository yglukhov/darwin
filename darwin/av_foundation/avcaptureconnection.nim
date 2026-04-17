import ../objc/runtime

type
  AVCaptureConnection* = ptr object of NSObject
  AVCaptureVideoOrientation* {.size: sizeof(cint).} = enum
    Portrait = 1
    PortraitUpsideDown = 2
    LandscapeRight = 3
    LandscapeLeft = 4

# AVCaptureConnection methods
proc setVideoOrientation*(c: AVCaptureConnection, orientation: AVCaptureVideoOrientation) {.objc: "setVideoOrientation:".}
proc isVideoOrientationSupported*(c: AVCaptureConnection): BOOL {.objc.}
