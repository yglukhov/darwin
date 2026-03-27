import darwin / core_foundation / [cfbase, cfarray]
import cggeometry, cgaffine_transform

type
    CGPath* = ptr object of CFObject
    CGMutablePath* = ptr object of CGPath

    CGLineJoin* {.size: sizeof(int32).} = enum
        kCGLineJoinMiter
        kCGLineJoinRound
        kCGLineJoinBevel

    CGLineCap* {.size: sizeof(int32).} = enum
        kCGLineCapButt
        kCGLineCapRound
        kCGLineCapSquare

    CGPathElementType* {.size: sizeof(int32).} = enum
        kCGPathElementMoveToPoint
        kCGPathElementAddLineToPoint
        kCGPathElementAddQuadCurveToPoint
        kCGPathElementAddCurveToPoint
        kCGPathElementCloseSubpath

    CGPathElement* {.bycopy.} = object
        kind*: CGPathElementType
        points*: ptr CGPoint

    CGPathApplierFunction* = proc(info: pointer, element: ptr CGPathElement) {.cdecl.}

# Type ID
proc CGPathGetTypeID*(): CFTypeID {.importc.}

# Create functions - keep original C names for create functions
proc CGPathCreateMutable*(): CGMutablePath {.importc.}
proc CGPathCreateCopy*(path: CGPath): CGPath {.importc.}
proc CGPathCreateCopyByTransformingPath*(path: CGPath, transform: ptr CGAffineTransform): CGPath {.importc.}
proc CGPathCreateMutableCopy*(path: CGPath): CGMutablePath {.importc.}
proc CGPathCreateMutableCopyByTransformingPath*(path: CGPath, transform: ptr CGAffineTransform): CGMutablePath {.importc.}
proc CGPathCreateWithRect*(rect: CGRect, transform: ptr CGAffineTransform): CGPath {.importc.}
proc CGPathCreateWithEllipseInRect*(rect: CGRect, transform: ptr CGAffineTransform): CGPath {.importc.}
proc CGPathCreateWithRoundedRect*(rect: CGRect, cornerWidth, cornerHeight: CGFloat, transform: ptr CGAffineTransform): CGPath {.importc.}

# Retain/Release - concise naming
proc retain*(path: CGPath): CGPath {.importc: "CGPathRetain".}
proc release*(path: CGPath) {.importc: "CGPathRelease".}

# Equality
proc CGPathEqualToPath*(path1, path2: CGPath): bool {.importc.}

# Path construction - concise naming for path as first parameter
proc moveToPoint*(path: CGMutablePath, transform: ptr CGAffineTransform, x, y: CGFloat) {.importc: "CGPathMoveToPoint".}
proc addLineToPoint*(path: CGMutablePath, transform: ptr CGAffineTransform, x, y: CGFloat) {.importc: "CGPathAddLineToPoint".}
proc addQuadCurveToPoint*(path: CGMutablePath, transform: ptr CGAffineTransform, cpx, cpy, x, y: CGFloat) {.importc: "CGPathAddQuadCurveToPoint".}
proc addCurveToPoint*(path: CGMutablePath, transform: ptr CGAffineTransform, cp1x, cp1y, cp2x, cp2y, x, y: CGFloat) {.importc: "CGPathAddCurveToPoint".}
proc closeSubpath*(path: CGMutablePath) {.importc: "CGPathCloseSubpath".}

# Path construction convenience functions - concise naming
proc addRect*(path: CGMutablePath, transform: ptr CGAffineTransform, rect: CGRect) {.importc: "CGPathAddRect".}
proc addRects*(path: CGMutablePath, transform: ptr CGAffineTransform, rects: ptr CGRect, count: csize_t) {.importc: "CGPathAddRects".}
proc addLines*(path: CGMutablePath, transform: ptr CGAffineTransform, points: ptr CGPoint, count: csize_t) {.importc: "CGPathAddLines".}
proc addEllipseInRect*(path: CGMutablePath, transform: ptr CGAffineTransform, rect: CGRect) {.importc: "CGPathAddEllipseInRect".}
proc addRelativeArc*(path: CGMutablePath, transform: ptr CGAffineTransform, x, y, radius, startAngle, delta: CGFloat) {.importc: "CGPathAddRelativeArc".}
proc addArc*(path: CGMutablePath, transform: ptr CGAffineTransform, x, y, radius, startAngle, endAngle: CGFloat, clockwise: bool) {.importc: "CGPathAddArc".}
proc addArcToPoint*(path: CGMutablePath, transform: ptr CGAffineTransform, x1, y1, x2, y2, radius: CGFloat) {.importc: "CGPathAddArcToPoint".}
proc addRoundedRect*(path: CGMutablePath, transform: ptr CGAffineTransform, rect: CGRect, cornerWidth, cornerHeight: CGFloat) {.importc: "CGPathAddRoundedRect".}

# Path information - concise naming
proc isEmpty*(path: CGPath): bool {.importc: "CGPathIsEmpty".}
proc isRect*(path: CGPath, rect: ptr CGRect): bool {.importc: "CGPathIsRect".}
proc getCurrentPoint*(path: CGPath): CGPoint {.importc: "CGPathGetCurrentPoint".}
proc getBoundingBox*(path: CGPath): CGRect {.importc: "CGPathGetBoundingBox".}
proc getPathBoundingBox*(path: CGPath): CGRect {.importc: "CGPathGetPathBoundingBox".}

# Path operations - concise naming
proc containsPoint*(path: CGPath, transform: ptr CGAffineTransform, point: CGPoint, eoFill: bool): bool {.importc: "CGPathContainsPoint".}

# Apply function - concise naming
proc apply*(path: CGPath, info: pointer, function: CGPathApplierFunction) {.importc: "CGPathApply".}

# Path modifications (macOS 13.0+, iOS 16.0+) - keep C names for create functions
proc CGPathCreateCopyByNormalizing*(path: CGPath, evenOddFillRule: bool): CGPath {.importc.}
proc CGPathCreateCopyByUnioningPath*(path, maskPath: CGPath, evenOddFillRule: bool): CGPath {.importc.}
proc CGPathCreateCopyByIntersectingPath*(path, maskPath: CGPath, evenOddFillRule: bool): CGPath {.importc.}
proc CGPathCreateCopyBySubtractingPath*(path, maskPath: CGPath, evenOddFillRule: bool): CGPath {.importc.}
proc CGPathCreateCopyBySymmetricDifferenceOfPath*(path, maskPath: CGPath, evenOddFillRule: bool): CGPath {.importc.}
proc CGPathCreateCopyOfLineBySubtractingPath*(path, maskPath: CGPath, evenOddFillRule: bool): CGPath {.importc.}
proc CGPathCreateCopyOfLineByIntersectingPath*(path, maskPath: CGPath, evenOddFillRule: bool): CGPath {.importc.}
proc CGPathCreateSeparateComponents*(path: CGPath, evenOddFillRule: bool): CFArray {.importc.}
proc CGPathCreateCopyByFlattening*(path: CGPath, flatteningThreshold: CGFloat): CGPath {.importc.}
proc CGPathIntersectsPath*(path1, path2: CGPath, evenOddFillRule: bool): bool {.importc.}
