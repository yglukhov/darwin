import ../objc/runtime
import ../foundation/nserror
import avcapturedevice

type
  AVCaptureDeviceInput* = ptr object of NSObject

# AVCaptureDeviceInput methods
proc alloc*(t: typedesc[AVCaptureDeviceInput]): AVCaptureDeviceInput {.objc: "alloc".}
proc initWithDevice*(i: AVCaptureDeviceInput, device: AVCaptureDevice, error: ptr ID): AVCaptureDeviceInput {.objc: "initWithDevice:error:".}
