import ../objc/runtime
import ../foundation/nsarray

type
  AVCaptureSession* = ptr object of NSObject
  AVCaptureDeviceInput* = ptr object of NSObject
  AVCaptureVideoDataOutput* = ptr object of NSObject

# AVCaptureSession methods
proc alloc*(t: typedesc[AVCaptureSession]): AVCaptureSession {.objc: "alloc".}
proc init*(s: AVCaptureSession): AVCaptureSession {.objc: "init".}
proc startRunning*(s: AVCaptureSession) {.objc.}
proc stopRunning*(s: AVCaptureSession) {.objc.}
proc isRunning*(s: AVCaptureSession): BOOL {.objc.}
proc canAddInput*(s: AVCaptureSession, input: AVCaptureDeviceInput): BOOL {.objc: "canAddInput:".}
proc addInput*(s: AVCaptureSession, input: AVCaptureDeviceInput) {.objc: "addInput:".}
proc canAddOutput*(s: AVCaptureSession, output: AVCaptureVideoDataOutput): BOOL {.objc: "canAddOutput:".}
proc addOutput*(s: AVCaptureSession, output: AVCaptureVideoDataOutput) {.objc: "addOutput:".}
proc beginConfiguration*(s: AVCaptureSession) {.objc.}
proc commitConfiguration*(s: AVCaptureSession) {.objc.}
