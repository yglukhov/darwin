import darwin/vision
import darwin/foundation
import darwin/core_graphics/cggeometry
import darwin/objc/runtime

# Test VNDetectFaceRectanglesRequest
var faceRequest = VNDetectFaceRectanglesRequest.alloc().init()
faceRequest.setPreferBackgroundProcessing(true)
doAssert faceRequest.preferBackgroundProcessing()
faceRequest.setRevision(VNDetectFaceRectanglesRequestRevision2)
doAssert faceRequest.revision() == VNDetectFaceRectanglesRequestRevision2

# Test VNImageBasedRequest region of interest
var imageRequest = cast[VNImageBasedRequest](faceRequest)
var rect: CGRect
rect.origin.x = 0.0
rect.origin.y = 0.0
rect.size.width = 1.0
rect.size.height = 1.0
imageRequest.setRegionOfInterest(rect)
var roi = imageRequest.regionOfInterest()
doAssert roi.size.width == 1.0

# Test VNRecognizeTextRequest properties
var textRequest = VNRecognizeTextRequest.alloc().init()
textRequest.setRecognitionLevel(vnRequestTextRecognitionLevelAccurate)
doAssert textRequest.recognitionLevel() == vnRequestTextRecognitionLevelAccurate
textRequest.setUsesLanguageCorrection(true)
doAssert textRequest.usesLanguageCorrection()
textRequest.setMinimumTextHeight(0.5)
doAssert textRequest.minimumTextHeight() == 0.5

# Test VNBarcodeSymbology constants
var barcodeRequest = VNDetectBarcodesRequest.alloc().init()
doAssert VNBarcodeSymbologyQR != nil

# Test VNGeometry
var point = VNPoint.alloc().init(10.0, 20.0)
doAssert point.x() == 10.0
doAssert point.y() == 20.0

var vector = VNVector.alloc().initWithComponents(3.0, 4.0)
doAssert vector.length() == 5.0

var center = VNPoint.alloc().init(0.0, 0.0)
var circle = VNCircle.alloc().initWithCenterRadius(center, 5.0)
doAssert circle.radius() == 5.0

var circle2 = VNCircle.alloc().initWithCenterDiameter(center, 10.0)
doAssert circle2.diameter() == 10.0

var testPoint = VNPoint.alloc().init(1.0, 1.0)
doAssert circle.containsPoint(testPoint)
