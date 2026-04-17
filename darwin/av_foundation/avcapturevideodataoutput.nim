import ../objc/runtime
import ../foundation/[nsarray, nsdictionary, nsnumber, nsstring]
import avcaptureoutput
import avcaptureconnection

type
  AVCaptureVideoDataOutput* = ptr object of AVCaptureOutput
  DispatchQueue = pointer

# AVCaptureVideoDataOutput methods
proc alloc*(t: typedesc[AVCaptureVideoDataOutput]): AVCaptureVideoDataOutput {.objc: "alloc".}
proc init*(o: AVCaptureVideoDataOutput): AVCaptureVideoDataOutput {.objc: "init".}
proc setAlwaysDiscardsLateVideoFrames*(o: AVCaptureVideoDataOutput, enabled: BOOL) {.objc: "setAlwaysDiscardsLateVideoFrames:".}
proc availableVideoPixelFormatTypes*(o: AVCaptureVideoDataOutput): NSArray[NSNumber] {.objc.}
proc setVideoSettings*(o: AVCaptureVideoDataOutput, settings: NSDictionary) {.objc: "setVideoSettings:".}
proc setSampleBufferDelegate*(o: AVCaptureVideoDataOutput, delegate: NSObject, queue: DispatchQueue) {.objc: "setSampleBufferDelegate:queue:".}

# Connection
proc connectionWithMediaType*(o: AVCaptureVideoDataOutput, mediaType: NSString): AVCaptureConnection {.objc.}
