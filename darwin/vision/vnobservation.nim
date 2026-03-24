import ../objc/runtime
import ../foundation/nsarray
import ../foundation/nsstring
import ../foundation/nsdata
import ../foundation/nsurl
import ../foundation/nsuuid
import ../foundation/nsindexset
import ../foundation/nsdictionary
import ../foundation/nsnumber
import ../foundation/nsrange
import ../foundation/nserror
import ../core_graphics/cggeometry
import ../core_graphics/cgaffine_transform
import vntypes
import vngeometry
import vndetectedpoint

type
  VNObservation* = ptr object of NSObject
  VNDetectedObjectObservation* = ptr object of VNObservation
  VNFaceObservation* = ptr object of VNDetectedObjectObservation
  VNClassificationObservation* = ptr object of VNObservation
  VNRecognizedObjectObservation* = ptr object of VNDetectedObjectObservation
  VNRectangleObservation* = ptr object of VNDetectedObjectObservation
  VNTextObservation* = ptr object of VNRectangleObservation
  VNRecognizedText* = ptr object of NSObject
  VNRecognizedTextObservation* = ptr object of VNRectangleObservation
  VNBarcodeObservation* = ptr object of VNRectangleObservation
  VNHorizonObservation* = ptr object of VNObservation
  VNImageAlignmentObservation* = ptr object of VNObservation
  VNImageTranslationAlignmentObservation* = ptr object of VNImageAlignmentObservation
  VNImageHomographicAlignmentObservation* = ptr object of VNImageAlignmentObservation
  VNPixelBufferObservation* = ptr object of VNObservation
  VNSaliencyImageObservation* = ptr object of VNPixelBufferObservation
  VNFeaturePrintObservation* = ptr object of VNObservation
  VNContoursObservation* = ptr object of VNObservation
  VNRecognizedPointsObservation* = ptr object of VNObservation
  VNHumanObservation* = ptr object of VNDetectedObjectObservation
  VNInstanceMaskObservation* = ptr object of VNObservation
  VNAnimalBodyPoseObservation* = ptr object of VNRecognizedPointsObservation
  VNRecognizedPoints3DObservation* = ptr object of VNObservation
  VNHumanBodyPose3DObservation* = ptr object of VNRecognizedPoints3DObservation

# VNObservation methods
proc uuid*(self: VNObservation): NSUUID {.objc: "uuid".}
proc confidence*(self: VNObservation): VNConfidence {.objc: "confidence".}

# VNDetectedObjectObservation methods - using overloading
proc observationWithBoundingBox*(self: typedesc[VNDetectedObjectObservation], boundingBox: CGRect): VNDetectedObjectObservation {.objc: "observationWithBoundingBox:".}
proc observationWithBoundingBox*(self: typedesc[VNDetectedObjectObservation], requestRevision: NSUInteger, boundingBox: CGRect): VNDetectedObjectObservation {.objc: "observationWithRequestRevision:boundingBox:".}
proc boundingBox*(self: VNDetectedObjectObservation): CGRect {.objc: "boundingBox".}

# VNFaceObservation methods - using overloading
proc faceObservationWithRequestRevision*(self: typedesc[VNFaceObservation], requestRevision: NSUInteger, boundingBox: CGRect, roll: NSNumber, yaw: NSNumber): VNFaceObservation {.objc: "faceObservationWithRequestRevision:boundingBox:roll:yaw:".}
proc faceObservationWithRequestRevision*(self: typedesc[VNFaceObservation], requestRevision: NSUInteger, boundingBox: CGRect, roll: NSNumber, yaw: NSNumber, pitch: NSNumber): VNFaceObservation {.objc: "faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:".}
proc landmarks*(self: VNFaceObservation): pointer {.objc: "landmarks".}
proc faceCaptureQuality*(self: VNFaceObservation): NSNumber {.objc: "faceCaptureQuality".}
proc roll*(self: VNFaceObservation): NSNumber {.objc: "roll".}
proc yaw*(self: VNFaceObservation): NSNumber {.objc: "yaw".}
proc pitch*(self: VNFaceObservation): NSNumber {.objc: "pitch".}

# VNClassificationObservation methods
proc identifier*(self: VNClassificationObservation): NSString {.objc: "identifier".}
proc hasPrecisionRecallCurve*(self: VNClassificationObservation): bool {.objc: "hasPrecisionRecallCurve".}
proc hasMinimumRecall*(self: VNClassificationObservation, minimumRecall: cfloat, forPrecision: cfloat): bool {.objc: "hasMinimumRecall:forPrecision:".}
proc hasMinimumPrecision*(self: VNClassificationObservation, minimumPrecision: cfloat, forRecall: cfloat): bool {.objc: "hasMinimumPrecision:forRecall:".}

# VNRecognizedObjectObservation methods
proc labels*(self: VNRecognizedObjectObservation): NSArray[VNClassificationObservation] {.objc: "labels".}

# VNRectangleObservation methods
proc rectangleObservationWithRequestRevision*(self: typedesc[VNRectangleObservation], requestRevision: NSUInteger, topLeft: CGPoint, bottomLeft: CGPoint, bottomRight: CGPoint, topRight: CGPoint): VNRectangleObservation {.objc: "rectangleObservationWithRequestRevision:topLeft:bottomLeft:bottomRight:topRight:".}
proc rectangleObservationWithRequestRevision*(self: typedesc[VNRectangleObservation], requestRevision: NSUInteger, topLeft: CGPoint, topRight: CGPoint, bottomRight: CGPoint, bottomLeft: CGPoint): VNRectangleObservation {.objc: "rectangleObservationWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:".}
proc topLeft*(self: VNRectangleObservation): CGPoint {.objc: "topLeft".}
proc topRight*(self: VNRectangleObservation): CGPoint {.objc: "topRight".}
proc bottomLeft*(self: VNRectangleObservation): CGPoint {.objc: "bottomLeft".}
proc bottomRight*(self: VNRectangleObservation): CGPoint {.objc: "bottomRight".}

# VNTextObservation methods
proc characterBoxes*(self: VNTextObservation): NSArray[VNRectangleObservation] {.objc: "characterBoxes".}

# VNRecognizedText methods
proc string*(self: VNRecognizedText): NSString {.objc: "string".}
proc boundingBoxForRange*(self: VNRecognizedText, range: NSRange, error: ptr NSError = nil): VNRectangleObservation {.objc: "boundingBoxForRange:error:".}

# VNRecognizedTextObservation methods
proc topCandidates*(self: VNRecognizedTextObservation, maxCandidateCount: NSUInteger): NSArray[VNRecognizedText] {.objc: "topCandidates:".}

# VNBarcodeObservation methods
proc symbology*(self: VNBarcodeObservation): VNBarcodeSymbology {.objc: "symbology".}
proc barcodeDescriptor*(self: VNBarcodeObservation): pointer {.objc: "barcodeDescriptor".}
proc payloadStringValue*(self: VNBarcodeObservation): NSString {.objc: "payloadStringValue".}
proc payloadData*(self: VNBarcodeObservation): NSData {.objc: "payloadData".}
proc isGS1DataCarrier*(self: VNBarcodeObservation): bool {.objc: "isGS1DataCarrier".}
proc isColorInverted*(self: VNBarcodeObservation): bool {.objc: "isColorInverted".}
proc supplementalCompositeType*(self: VNBarcodeObservation): VNBarcodeCompositeType {.objc: "supplementalCompositeType".}
proc supplementalPayloadString*(self: VNBarcodeObservation): NSString {.objc: "supplementalPayloadString".}
proc supplementalPayloadData*(self: VNBarcodeObservation): NSData {.objc: "supplementalPayloadData".}

# VNHorizonObservation methods
proc transform*(self: VNHorizonObservation): CGAffineTransform {.objc: "transform".}
proc angle*(self: VNHorizonObservation): CGFloat {.objc: "angle".}
proc transformForImage*(self: VNHorizonObservation, width: csize_t, height: csize_t): CGAffineTransform {.objc: "transformForImageWidth:height:".}

# VNImageTranslationAlignmentObservation methods
proc alignmentTransform*(self: VNImageTranslationAlignmentObservation): CGAffineTransform {.objc: "alignmentTransform".}

# VNImageHomographicAlignmentObservation methods
proc warpTransform*(self: VNImageHomographicAlignmentObservation): pointer {.objc: "warpTransform".}  # matrix_float3x3

# VNPixelBufferObservation methods
proc pixelBuffer*(self: VNPixelBufferObservation): pointer {.objc: "pixelBuffer".}  # CVPixelBufferRef
proc featureName*(self: VNPixelBufferObservation): NSString {.objc: "featureName".}

# VNSaliencyImageObservation methods
proc salientObjects*(self: VNSaliencyImageObservation): NSArray[VNRectangleObservation] {.objc: "salientObjects".}

# VNFeaturePrintObservation methods
proc elementType*(self: VNFeaturePrintObservation): VNElementType {.objc: "elementType".}
proc elementCount*(self: VNFeaturePrintObservation): NSUInteger {.objc: "elementCount".}
proc data*(self: VNFeaturePrintObservation): NSData {.objc: "data".}
proc computeDistance*(self: VNFeaturePrintObservation, outDistance: ptr cfloat, toFeaturePrint: VNFeaturePrintObservation, error: ptr NSError = nil): bool {.objc: "computeDistance:toFeaturePrintObservation:error:".}

# VNContoursObservation methods
proc contourCount*(self: VNContoursObservation): NSInteger {.objc: "contourCount".}
proc contourAtIndex*(self: VNContoursObservation, contourIndex: NSInteger, error: ptr NSError = nil): pointer {.objc: "contourAtIndex:error:".}
proc topLevelContourCount*(self: VNContoursObservation): NSInteger {.objc: "topLevelContourCount".}
proc topLevelContours*(self: VNContoursObservation): NSArray[NSObject] {.objc: "topLevelContours".}  # NSArray<VNContour*>
proc contourAtIndexPath*(self: VNContoursObservation, indexPath: pointer, error: ptr NSError = nil): pointer {.objc: "contourAtIndexPath:error:".}
proc normalizedPath*(self: VNContoursObservation): pointer {.objc: "normalizedPath".}  # CGPathRef

# VNRecognizedPointsObservation methods
proc availableKeys*(self: VNRecognizedPointsObservation): NSArray[NSString] {.objc: "availableKeys".}  # NSArray<VNRecognizedPointKey>
proc availableGroupKeys*(self: VNRecognizedPointsObservation): NSArray[NSString] {.objc: "availableGroupKeys".}  # NSArray<VNRecognizedPointGroupKey>
proc recognizedPointForKey*(self: VNRecognizedPointsObservation, pointKey: VNRecognizedPointKey, error: ptr NSError = nil): VNRecognizedPoint {.objc: "recognizedPointForKey:error:".}
proc recognizedPointsForGroupKey*(self: VNRecognizedPointsObservation, groupKey: VNRecognizedPointGroupKey, error: ptr NSError = nil): NSDictionary {.objc: "recognizedPointsForGroupKey:error:".}

# VNHumanObservation methods
proc upperBodyOnly*(self: VNHumanObservation): bool {.objc: "upperBodyOnly".}

# VNInstanceMaskObservation methods
proc instanceMask*(self: VNInstanceMaskObservation): pointer {.objc: "instanceMask".}  # CVPixelBufferRef
proc allInstances*(self: VNInstanceMaskObservation): NSIndexSet {.objc: "allInstances".}
proc generateMaskForInstances*(self: VNInstanceMaskObservation, instances: NSIndexSet, error: ptr NSError = nil): pointer {.objc: "generateMaskForInstances:error:".}  # CVPixelBufferRef

# VNAnimalBodyPoseObservation methods
proc availableJointNames*(self: VNAnimalBodyPoseObservation): NSArray[NSString] {.objc: "availableJointNames".}  # NSArray<VNAnimalBodyPoseObservationJointName>
proc availableJointGroupNames*(self: VNAnimalBodyPoseObservation): NSArray[NSString] {.objc: "availableJointGroupNames".}  # NSArray<VNAnimalBodyPoseObservationJointsGroupName>
proc recognizedPointForJointName*(self: VNAnimalBodyPoseObservation, jointName: NSString, error: ptr NSError = nil): VNRecognizedPoint {.objc: "recognizedPointForJointName:error:".}
proc recognizedPointsForJointsGroupName*(self: VNAnimalBodyPoseObservation, jointsGroupName: NSString, error: ptr NSError = nil): NSDictionary {.objc: "recognizedPointsForJointsGroupName:error:".}

# VNRecognizedPoints3DObservation methods
proc recognizedPointForKey*(self: VNRecognizedPoints3DObservation, pointKey: VNRecognizedPointKey, error: ptr NSError = nil): pointer {.objc: "recognizedPointForKey:error:".}  # VNRecognizedPoint3D
proc recognizedPointsForGroupKey*(self: VNRecognizedPoints3DObservation, groupKey: VNRecognizedPointGroupKey, error: ptr NSError = nil): NSDictionary {.objc: "recognizedPointsForGroupKey:error:".}

# VNHumanBodyPose3DObservation methods
proc heightEstimation*(self: VNHumanBodyPose3DObservation): cint {.objc: "heightEstimation".}
proc cameraOriginMatrix*(self: VNHumanBodyPose3DObservation): pointer {.objc: "cameraOriginMatrix".}  # simd_float4x4
proc availableJointsGroupNames*(self: VNHumanBodyPose3DObservation): NSArray[NSString] {.objc: "availableJointsGroupNames".}  # NSArray<VNHumanBodyPose3DObservationJointsGroupName>
proc availableJointNames*(self: VNHumanBodyPose3DObservation): NSArray[NSString] {.objc: "availableJointNames".}  # NSArray<VNHumanBodyPose3DObservationJointName>
proc bodyHeight*(self: VNHumanBodyPose3DObservation): cfloat {.objc: "bodyHeight".}
proc recognizedPointsForJointsGroupName*(self: VNHumanBodyPose3DObservation, jointsGroupName: NSString, error: ptr NSError = nil): NSDictionary {.objc: "recognizedPointsForJointsGroupName:error:".}
proc recognizedPointForJointName*(self: VNHumanBodyPose3DObservation, jointName: NSString, error: ptr NSError = nil): pointer {.objc: "recognizedPointForJointName:error:".}  # VNHumanBodyRecognizedPoint3D
proc pointInImageForJointName*(self: VNHumanBodyPose3DObservation, jointName: NSString, error: ptr NSError = nil): VNPoint {.objc: "pointInImageForJointName:error:".}
proc parentJointNameForJointName*(self: VNHumanBodyPose3DObservation, jointName: NSString): NSString {.objc: "parentJointNameForJointName:".}
proc getCameraRelativePosition*(self: VNHumanBodyPose3DObservation, modelPositionOut: pointer, forJointName: NSString, error: ptr NSError = nil): bool {.objc: "getCameraRelativePosition:forJointName:error:".}
