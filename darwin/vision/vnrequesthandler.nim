import ../objc/runtime
import ../foundation/nsarray
import ../foundation/nserror
import ../foundation/nsstring
import ../foundation/nsurl
import ../foundation/nsdata
import ../foundation/nsdictionary
import ../core_graphics/cgimage
import ../core_video/cvbuffer
import vnrequest

# CIImage is an Objective-C class
type
  CIImage* = ptr object of NSObject

  VNImageRequestHandler* = ptr object of NSObject
  VNSequenceRequestHandler* = ptr object of NSObject

# VNImageRequestHandler init methods - using overloading
proc initWithCVPixelBuffer*(self: VNImageRequestHandler, pixelBuffer: CVPixelBufferRef, options: NSDictionary): VNImageRequestHandler {.objc: "initWithCVPixelBuffer:options:".}
proc initWithCVPixelBuffer*(self: VNImageRequestHandler, pixelBuffer: CVPixelBufferRef, orientation: cuint, options: NSDictionary): VNImageRequestHandler {.objc: "initWithCVPixelBuffer:orientation:options:".}
proc initWithCGImage*(self: VNImageRequestHandler, image: CGImage, options: NSDictionary): VNImageRequestHandler {.objc: "initWithCGImage:options:".}
proc initWithCGImage*(self: VNImageRequestHandler, image: CGImage, orientation: cuint, options: NSDictionary): VNImageRequestHandler {.objc: "initWithCGImage:orientation:options:".}
proc initWithCIImage*(self: VNImageRequestHandler, image: CIImage, options: NSDictionary): VNImageRequestHandler {.objc: "initWithCIImage:options:".}
proc initWithCIImage*(self: VNImageRequestHandler, image: CIImage, orientation: cuint, options: NSDictionary): VNImageRequestHandler {.objc: "initWithCIImage:orientation:options:".}
proc initWithURL*(self: VNImageRequestHandler, imageURL: NSURL, options: NSDictionary): VNImageRequestHandler {.objc: "initWithURL:options:".}
proc initWithURL*(self: VNImageRequestHandler, imageURL: NSURL, orientation: cuint, options: NSDictionary): VNImageRequestHandler {.objc: "initWithURL:orientation:options:".}
proc initWithData*(self: VNImageRequestHandler, imageData: NSData, options: NSDictionary): VNImageRequestHandler {.objc: "initWithData:options:".}
proc initWithData*(self: VNImageRequestHandler, imageData: NSData, orientation: cuint, options: NSDictionary): VNImageRequestHandler {.objc: "initWithData:orientation:options:".}

# VNImageRequestHandler perform methods
proc performRequests*(self: VNImageRequestHandler, requests: NSArray, error: ptr NSError = nil): bool {.objc: "performRequests:error:".}

# VNSequenceRequestHandler init
proc init*(self: VNSequenceRequestHandler): VNSequenceRequestHandler {.objc: "init".}

# VNSequenceRequestHandler perform methods - using overloading based on type
proc performRequests*(self: VNSequenceRequestHandler, requests: NSArray, pixelBuffer: CVPixelBufferRef, error: ptr NSError = nil): bool {.objc: "performRequests:onCVPixelBuffer:error:".}
proc performRequests*(self: VNSequenceRequestHandler, requests: NSArray, pixelBuffer: CVPixelBufferRef, orientation: cuint, error: ptr NSError = nil): bool {.objc: "performRequests:onCVPixelBuffer:orientation:error:".}
proc performRequests*(self: VNSequenceRequestHandler, requests: NSArray, image: CGImage, error: ptr NSError = nil): bool {.objc: "performRequests:onCGImage:error:".}
proc performRequests*(self: VNSequenceRequestHandler, requests: NSArray, image: CGImage, orientation: cuint, error: ptr NSError = nil): bool {.objc: "performRequests:onCGImage:orientation:error:".}
proc performRequests*(self: VNSequenceRequestHandler, requests: NSArray, image: CIImage, error: ptr NSError = nil): bool {.objc: "performRequests:onCIImage:error:".}
proc performRequests*(self: VNSequenceRequestHandler, requests: NSArray, image: CIImage, orientation: cuint, error: ptr NSError = nil): bool {.objc: "performRequests:onCIImage:orientation:error:".}
proc performRequests*(self: VNSequenceRequestHandler, requests: NSArray, imageURL: NSURL, error: ptr NSError = nil): bool {.objc: "performRequests:onImageURL:error:".}
proc performRequests*(self: VNSequenceRequestHandler, requests: NSArray, imageURL: NSURL, orientation: cuint, error: ptr NSError = nil): bool {.objc: "performRequests:onImageURL:orientation:error:".}
proc performRequests*(self: VNSequenceRequestHandler, requests: NSArray, imageData: NSData, error: ptr NSError = nil): bool {.objc: "performRequests:onImageData:error:".}
proc performRequests*(self: VNSequenceRequestHandler, requests: NSArray, imageData: NSData, orientation: cuint, error: ptr NSError = nil): bool {.objc: "performRequests:onImageData:orientation:error:".}
