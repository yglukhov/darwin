import ../objc/runtime
import ../foundation/[nsstring, nsarray, nserror]

type
  AVCaptureDevice* = ptr object of NSObject
  AVCaptureDevicePosition* {.size: sizeof(cint).} = enum
    Unspecified = 0
    Back = 1
    Front = 2

  AVMediaType* = NSString

# Device discovery
proc defaultDeviceWithMediaType*(self: typedesc[AVCaptureDevice], mediaType: AVMediaType): AVCaptureDevice {.objc: "defaultDeviceWithMediaType:".}
proc devices*(self: typedesc[AVCaptureDevice]): NSArray[AVCaptureDevice] {.objc.}
proc hasMediaType*(d: AVCaptureDevice, mediaType: AVMediaType): BOOL {.objc: "hasMediaType:".}
proc position*(d: AVCaptureDevice): AVCaptureDevicePosition {.objc.}
proc localizedName*(d: AVCaptureDevice): NSString {.objc.}

# Media type constants
var AVMediaTypeVideo* {.importc.}: AVMediaType
