import ../objc/runtime
import ../foundation/[nsstring, nsarray, nsdictionary]
import ciimage
import cicontext

type
  CIDetector* = ptr object of NSObject
  CIDetectorType* = NSString

# CIDetector creation
proc detectorOfType*(t: typedesc[CIDetector], `type`: CIDetectorType, context: CIContext, options: NSDictionary): CIDetector {.objc: "detectorOfType:context:options:".}

# Feature detection
proc featuresInImage*(d: CIDetector, image: CIImage): NSArray[ptr NSObject] {.objc: "featuresInImage:".}
proc featuresInImage*(d: CIDetector, image: CIImage, options: NSDictionary): NSArray[ptr NSObject] {.objc: "featuresInImage:options:".}

# CIDetector types
var CIDetectorTypeFace* {.importc.}: CIDetectorType
var CIDetectorTypeRectangle* {.importc.}: CIDetectorType
var CIDetectorTypeQRCode* {.importc.}: CIDetectorType

# CIDetector options
var CIDetectorAccuracy* {.importc.}: NSString
var CIDetectorAccuracyLow* {.importc.}: NSString
var CIDetectorAccuracyHigh* {.importc.}: NSString
var CIDetectorTracking* {.importc.}: NSString
var CIDetectorMinFeatureSize* {.importc.}: NSString
var CIDetectorMaxFeatureCount* {.importc.}: NSString

# Image options
var CIDetectorImageOrientation* {.importc.}: NSString
var CIDetectorEyeBlink* {.importc.}: NSString
var CIDetectorSmile* {.importc.}: NSString
