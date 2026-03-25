import darwin/objc/runtime
import darwin/foundation/[nsstring, nsarray, nsgeometry]
import darwin/app_kit/[nsview, nsevent]
import darwin/core_graphics/cggeometry
import pdfdocument
import pdfpage
import pdfannotation

type
  PDFView* = ptr object of NSView
  PDFSelection* = ptr object of NSObject
  PDFDestination* = ptr object of NSObject

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
proc initWithFrame*(self: PDFView, frame: NSRect): PDFView {.objc: "initWithFrame:".}

# Document
proc document*(self: PDFView): PDFDocument {.objc.}
proc setDocument*(self: PDFView, document: PDFDocument) {.objc: "setDocument:".}

# Page navigation
proc canGoToFirstPage*(self: PDFView): bool {.objc.}
proc goToFirstPage*(self: PDFView, sender: NSObject) {.objc.}
proc canGoToLastPage*(self: PDFView): bool {.objc.}
proc goToLastPage*(self: PDFView, sender: NSObject) {.objc.}
proc canGoToNextPage*(self: PDFView): bool {.objc.}
proc goToNextPage*(self: PDFView, sender: NSObject) {.objc.}
proc canGoToPreviousPage*(self: PDFView): bool {.objc.}
proc goToPreviousPage*(self: PDFView, sender: NSObject) {.objc.}

# Page access
proc currentPage*(self: PDFView): PDFPage {.objc.}
proc setCurrentPage*(self: PDFView, page: PDFPage) {.objc: "setCurrentPage:".}
proc currentDestination*(self: PDFView): PDFDestination {.objc.}

# Display settings
proc displayMode*(self: PDFView): PDFDisplayMode {.objc.}
proc setDisplayMode*(self: PDFView, mode: PDFDisplayMode) {.objc: "setDisplayMode:".}
proc displayDirection*(self: PDFView): PDFDisplayDirection {.objc.}
proc setDisplayDirection*(self: PDFView, direction: PDFDisplayDirection) {.objc: "setDisplayDirection:".}
proc displaysPageBreaks*(self: PDFView): bool {.objc.}
proc setDisplaysPageBreaks*(self: PDFView, displays: bool) {.objc: "setDisplaysPageBreaks:".}
proc pageBreakMargins*(self: PDFView): NSEdgeInsets {.objc.}
proc setPageBreakMargins*(self: PDFView, margins: NSEdgeInsets) {.objc: "setPageBreakMargins:".}

# Display box
proc displayBox*(self: PDFView): PDFDisplayBox {.objc.}
proc setDisplayBox*(self: PDFView, box: PDFDisplayBox) {.objc: "setDisplayBox:".}

# Display options
proc displaysAsBook*(self: PDFView): bool {.objc.}
proc setDisplaysAsBook*(self: PDFView, displaysAsBook: bool) {.objc: "setDisplaysAsBook:".}
proc displaysRTL*(self: PDFView): bool {.objc.}
proc setDisplaysRTL*(self: PDFView, displaysRTL: bool) {.objc: "setDisplaysRTL:".}

# Scale
proc scaleFactor*(self: PDFView): CGFloat {.objc.}
proc setScaleFactor*(self: PDFView, scale: CGFloat) {.objc: "setScaleFactor:".}
proc minScaleFactor*(self: PDFView): CGFloat {.objc.}
proc setMinScaleFactor*(self: PDFView, scale: CGFloat) {.objc: "setMinScaleFactor:".}
proc maxScaleFactor*(self: PDFView): CGFloat {.objc.}
proc setMaxScaleFactor*(self: PDFView, scale: CGFloat) {.objc: "setMaxScaleFactor:".}
proc autoScales*(self: PDFView): bool {.objc.}
proc setAutoScales*(self: PDFView, autoScales: bool) {.objc: "setAutoScales:".}
proc zoomIn*(self: PDFView, sender: NSObject) {.objc.}
proc zoomOut*(self: PDFView, sender: NSObject) {.objc.}
proc canZoomIn*(self: PDFView): bool {.objc.}
proc canZoomOut*(self: PDFView): bool {.objc.}

# Background color
proc backgroundColor*(self: PDFView): NSObject {.objc.}
proc setBackgroundColor*(self: PDFView, color: NSObject) {.objc: "setBackgroundColor:".}
proc pageShadowsEnabled*(self: PDFView): bool {.objc.}
proc setPageShadowsEnabled*(self: PDFView, enabled: bool) {.objc: "setPageShadowsEnabled:".}

# Interpolation quality
proc interpolationQuality*(self: PDFView): PDFInterpolationQuality {.objc.}
proc setInterpolationQuality*(self: PDFView, quality: PDFInterpolationQuality) {.objc: "setInterpolationQuality:".}

# Page navigation methods
proc goToPage*(self: PDFView, page: PDFPage) {.objc: "goToPage:".}
proc goToDestination*(self: PDFView, destination: PDFDestination) {.objc: "goToDestination:".}
proc goToSelection*(self: PDFView, selection: PDFSelection) {.objc: "goToSelection:".}
proc goToRectOnPage*(self: PDFView, rect: NSRect, page: PDFPage) {.objc: "goToRect:onPage:".}

# Selection
proc currentSelection*(self: PDFView): PDFSelection {.objc.}
proc setCurrentSelection*(self: PDFView, selection: PDFSelection) {.objc: "setCurrentSelection:".}
proc setCurrentSelectionAnimate*(self: PDFView, selection: PDFSelection, animate: bool) {.objc: "setCurrentSelection:animate:".}
proc clearSelection*(self: PDFView) {.objc.}

# Copy
proc copy*(self: PDFView, sender: NSObject) {.objc.}
proc canCopy*(self: PDFView): bool {.objc.}

# Visible pages
proc visiblePages*(self: PDFView): NSArray[PDFPage] {.objc.}

# Area of interest
proc areaOfInterestForMouse*(self: PDFView, event: NSEvent): NSUInteger {.objc: "areaOfInterestForMouse:".}
proc areaOfInterestForCursor*(self: PDFView, point: NSPoint): NSUInteger {.objc: "areaOfInterestForCursor:".}

# Annotation handling
proc annotationOver*(self: PDFView): PDFAnnotation {.objc.}
proc setAnnotationOver*(self: PDFView, annotation: PDFAnnotation) {.objc: "setAnnotationOver:".}

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


