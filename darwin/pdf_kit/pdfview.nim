import darwin/objc/runtime
import darwin/foundation/[nsstring, nsarray, nsgeometry]
import darwin/app_kit/[nsview, nsevent]
import darwin/core_graphics/cggeometry
import pdfdocument
import pdfpage

type
  PDFViewObj* = ptr object of NSView
  PDFSelection* = ptr object of NSObject
  PDFDestination* = ptr object of NSObject
  PDFAnnotation* = ptr object of NSObject

  PDFDisplayMode* {.size: sizeof(uint).} = enum
    kPDFDisplaySinglePage = 0
    kPDFDisplaySinglePageContinuous = 1
    kPDFDisplayTwoUp = 2
    kPDFDisplayTwoUpContinuous = 3

  PDFDisplayDirection* {.size: sizeof(uint).} = enum
    kPDFDisplayDirectionVertical = 0
    kPDFDisplayDirectionHorizontal = 1

  PDFInterpolationQuality* {.size: sizeof(uint).} = enum
    kPDFInterpolationQualityNone = 0
    kPDFInterpolationQualityLow = 1
    kPDFInterpolationQualityHigh = 2

# Constructors
proc initWithFrame*(self: PDFViewObj, frame: NSRect): PDFViewObj {.objc: "initWithFrame:".}

# Document
proc document*(self: PDFViewObj): PDFDocument {.objc.}
proc setDocument*(self: PDFViewObj, document: PDFDocument) {.objc: "setDocument:".}

# Page navigation
proc canGoToFirstPage*(self: PDFViewObj): bool {.objc.}
proc goToFirstPage*(self: PDFViewObj, sender: NSObject) {.objc.}
proc canGoToLastPage*(self: PDFViewObj): bool {.objc.}
proc goToLastPage*(self: PDFViewObj, sender: NSObject) {.objc.}
proc canGoToNextPage*(self: PDFViewObj): bool {.objc.}
proc goToNextPage*(self: PDFViewObj, sender: NSObject) {.objc.}
proc canGoToPreviousPage*(self: PDFViewObj): bool {.objc.}
proc goToPreviousPage*(self: PDFViewObj, sender: NSObject) {.objc.}

# Page access
proc currentPage*(self: PDFViewObj): PDFPage {.objc.}
proc setCurrentPage*(self: PDFViewObj, page: PDFPage) {.objc: "setCurrentPage:".}
proc currentDestination*(self: PDFViewObj): PDFDestination {.objc.}

# Display settings
proc displayMode*(self: PDFViewObj): PDFDisplayMode {.objc.}
proc setDisplayMode*(self: PDFViewObj, mode: PDFDisplayMode) {.objc: "setDisplayMode:".}
proc displayDirection*(self: PDFViewObj): PDFDisplayDirection {.objc.}
proc setDisplayDirection*(self: PDFViewObj, direction: PDFDisplayDirection) {.objc: "setDisplayDirection:".}
proc displaysPageBreaks*(self: PDFViewObj): bool {.objc.}
proc setDisplaysPageBreaks*(self: PDFViewObj, displays: bool) {.objc: "setDisplaysPageBreaks:".}
proc pageBreakMargins*(self: PDFViewObj): NSEdgeInsets {.objc.}
proc setPageBreakMargins*(self: PDFViewObj, margins: NSEdgeInsets) {.objc: "setPageBreakMargins:".}

# Display box
proc displayBox*(self: PDFViewObj): PDFDisplayBox {.objc.}
proc setDisplayBox*(self: PDFViewObj, box: PDFDisplayBox) {.objc: "setDisplayBox:".}

# Display options
proc displaysAsBook*(self: PDFViewObj): bool {.objc.}
proc setDisplaysAsBook*(self: PDFViewObj, displaysAsBook: bool) {.objc: "setDisplaysAsBook:".}
proc displaysRTL*(self: PDFViewObj): bool {.objc.}
proc setDisplaysRTL*(self: PDFViewObj, displaysRTL: bool) {.objc: "setDisplaysRTL:".}

# Scale
proc scaleFactor*(self: PDFViewObj): CGFloat {.objc.}
proc setScaleFactor*(self: PDFViewObj, scale: CGFloat) {.objc: "setScaleFactor:".}
proc minScaleFactor*(self: PDFViewObj): CGFloat {.objc.}
proc setMinScaleFactor*(self: PDFViewObj, scale: CGFloat) {.objc: "setMinScaleFactor:".}
proc maxScaleFactor*(self: PDFViewObj): CGFloat {.objc.}
proc setMaxScaleFactor*(self: PDFViewObj, scale: CGFloat) {.objc: "setMaxScaleFactor:".}
proc autoScales*(self: PDFViewObj): bool {.objc.}
proc setAutoScales*(self: PDFViewObj, autoScales: bool) {.objc: "setAutoScales:".}
proc zoomIn*(self: PDFViewObj, sender: NSObject) {.objc.}
proc zoomOut*(self: PDFViewObj, sender: NSObject) {.objc.}
proc canZoomIn*(self: PDFViewObj): bool {.objc.}
proc canZoomOut*(self: PDFViewObj): bool {.objc.}

# Background color
proc backgroundColor*(self: PDFViewObj): NSObject {.objc.}
proc setBackgroundColor*(self: PDFViewObj, color: NSObject) {.objc: "setBackgroundColor:".}
proc pageShadowsEnabled*(self: PDFViewObj): bool {.objc.}
proc setPageShadowsEnabled*(self: PDFViewObj, enabled: bool) {.objc: "setPageShadowsEnabled:".}

# Interpolation quality
proc interpolationQuality*(self: PDFViewObj): PDFInterpolationQuality {.objc.}
proc setInterpolationQuality*(self: PDFViewObj, quality: PDFInterpolationQuality) {.objc: "setInterpolationQuality:".}

# Page navigation methods
proc goToPage*(self: PDFViewObj, page: PDFPage) {.objc: "goToPage:".}
proc goToDestination*(self: PDFViewObj, destination: PDFDestination) {.objc: "goToDestination:".}
proc goToSelection*(self: PDFViewObj, selection: PDFSelection) {.objc: "goToSelection:".}
proc goToRectOnPage*(self: PDFViewObj, rect: NSRect, page: PDFPage) {.objc: "goToRect:onPage:".}

# Selection
proc currentSelection*(self: PDFViewObj): PDFSelection {.objc.}
proc setCurrentSelection*(self: PDFViewObj, selection: PDFSelection) {.objc: "setCurrentSelection:".}
proc setCurrentSelectionAnimate*(self: PDFViewObj, selection: PDFSelection, animate: bool) {.objc: "setCurrentSelection:animate:".}
proc clearSelection*(self: PDFViewObj) {.objc.}

# Copy
proc copy*(self: PDFViewObj, sender: NSObject) {.objc.}
proc canCopy*(self: PDFViewObj): bool {.objc.}

# Visible pages
proc visiblePages*(self: PDFViewObj): NSArray[PDFPage] {.objc.}

# Area of interest
proc areaOfInterestForMouse*(self: PDFViewObj, event: NSEvent): NSUInteger {.objc: "areaOfInterestForMouse:".}
proc areaOfInterestForCursor*(self: PDFViewObj, point: NSPoint): NSUInteger {.objc: "areaOfInterestForCursor:".}

# Annotation handling
proc annotationOver*(self: PDFViewObj): PDFAnnotation {.objc.}
proc setAnnotationOver*(self: PDFViewObj, annotation: PDFAnnotation) {.objc: "setAnnotationOver:".}

# PDF view notifications
var
  PDFViewDocumentChangedNotification* {.importc.}: NSString
  PDFViewPageChangedNotification* {.importc.}: NSString
  PDFViewScaleChangedNotification* {.importc.}: NSString
  PDFViewAnnotationHitNotification* {.importc.}: NSString
  PDFViewAnnotationWillHitNotification* {.importc.}: NSString
  PDFViewDisplaysDocumentTitleNotification* {.importc.}: NSString
  PDFViewCopyPermissionNotification* {.importc.}: NSString
  PDFViewPrintPermissionNotification* {.importc.}: NSString

# Type alias for easier use
type PDFView* = PDFViewObj
