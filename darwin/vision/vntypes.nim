import ../objc/runtime
import ../foundation/nsstring

# Type definitions
type
  VNConfidence* = cfloat
  VNAspectRatio* = cfloat
  VNDegrees* = cfloat

  VNImageCropAndScaleOption* {.size: sizeof(cuint).} = enum
    vnImageCropAndScaleOptionCenterCrop = 0
    vnImageCropAndScaleOptionScaleFit = 1
    vnImageCropAndScaleOptionScaleFill = 2
    vnImageCropAndScaleOptionScaleFitRotate90CCW = 0x100
    vnImageCropAndScaleOptionScaleFillRotate90CCW = 0x101

  VNElementType* {.size: sizeof(cuint).} = enum
    vnElementTypeUnknown = 0
    vnElementTypeFloat = 1
    vnElementTypeDouble = 2

  VNChirality* {.size: sizeof(cint).} = enum
    vnChiralityUnknown = 0
    vnChiralityLeft = -1
    vnChiralityRight = 1

  VNPointsClassification* {.size: sizeof(cint).} = enum
    vnPointsClassificationDisconnected = 0
    vnPointsClassificationOpenPath = 1
    vnPointsClassificationClosedPath = 2

  VNBarcodeCompositeType* {.size: sizeof(cint).} = enum
    vnBarcodeCompositeTypeNone = 0
    vnBarcodeCompositeTypeLinked = 1
    vnBarcodeCompositeTypeGS1TypeA = 2
    vnBarcodeCompositeTypeGS1TypeB = 3
    vnBarcodeCompositeTypeGS1TypeC = 4

  VNRequestTextRecognitionLevel* {.size: sizeof(cint).} = enum
    vnRequestTextRecognitionLevelAccurate = 0
    vnRequestTextRecognitionLevelFast = 1

  VNBarcodeSymbology* = NSString
  VNRecognizedPointKey* = NSString
  VNRecognizedPointGroupKey* = NSString
  VNComputeStage* = NSString
  VNImageOption* = NSString

# Barcode symbology constants
var
  VNBarcodeSymbologyAztec* {.importc.}: NSString
  VNBarcodeSymbologyCode39* {.importc.}: NSString
  VNBarcodeSymbologyCode39Checksum* {.importc.}: NSString
  VNBarcodeSymbologyCode39FullASCII* {.importc.}: NSString
  VNBarcodeSymbologyCode39FullASCIIChecksum* {.importc.}: NSString
  VNBarcodeSymbologyCode93* {.importc.}: NSString
  VNBarcodeSymbologyCode93i* {.importc.}: NSString
  VNBarcodeSymbologyCode128* {.importc.}: NSString
  VNBarcodeSymbologyDataMatrix* {.importc.}: NSString
  VNBarcodeSymbologyEAN8* {.importc.}: NSString
  VNBarcodeSymbologyEAN13* {.importc.}: NSString
  VNBarcodeSymbologyI2of5* {.importc.}: NSString
  VNBarcodeSymbologyI2of5Checksum* {.importc.}: NSString
  VNBarcodeSymbologyITF14* {.importc.}: NSString
  VNBarcodeSymbologyPDF417* {.importc.}: NSString
  VNBarcodeSymbologyQR* {.importc.}: NSString
  VNBarcodeSymbologyUPCE* {.importc.}: NSString
  VNBarcodeSymbologyCodabar* {.importc.}: NSString
  VNBarcodeSymbologyGS1DataBar* {.importc.}: NSString
  VNBarcodeSymbologyGS1DataBarExpanded* {.importc.}: NSString
  VNBarcodeSymbologyGS1DataBarLimited* {.importc.}: NSString
  VNBarcodeSymbologyMicroPDF417* {.importc.}: NSString
  VNBarcodeSymbologyMicroQR* {.importc.}: NSString
  VNBarcodeSymbologyMSIPlessey* {.importc.}: NSString

# Compute stage constants
var
  VNComputeStageMain* {.importc.}: NSString
  VNComputeStagePostProcessing* {.importc.}: NSString

# Image option constants
var
  VNImageOptionProperties* {.importc.}: NSString
  VNImageOptionCameraIntrinsics* {.importc.}: NSString
  VNImageOptionCIContext* {.importc.}: NSString

# Revision constants
const
  VNRequestRevisionUnspecified* = 0.NSUInteger

  VNDetectFaceRectanglesRequestRevision1* = 1.NSUInteger
  VNDetectFaceRectanglesRequestRevision2* = 2.NSUInteger
  VNDetectFaceRectanglesRequestRevision3* = 3.NSUInteger

  VNRecognizeTextRequestRevision1* = 1.NSUInteger
  VNRecognizeTextRequestRevision2* = 2.NSUInteger
  VNRecognizeTextRequestRevision3* = 3.NSUInteger

  VNDetectBarcodesRequestRevision1* = 1.NSUInteger
  VNDetectBarcodesRequestRevision2* = 2.NSUInteger
  VNDetectBarcodesRequestRevision3* = 3.NSUInteger
  VNDetectBarcodesRequestRevision4* = 4.NSUInteger
