import darwin/objc/runtime
import darwin/foundation/[nsstring, nsarray, nsgeometry, nsattributedstring, nsdictionary, nsrange]
import darwin/core_graphics/[cgimage, cgcontext]
import pdfdocument
import pdfannotation

# PDFPage is defined in pdfdocument, extend it here
type
  PDFSelection* = ptr object of NSObject

# Page initialization
proc initWithImage*(self: PDFPage, image: CGImage): PDFPage {.objc: "initWithImage:".}

# Page properties
proc document*(self: PDFPage): PDFDocument {.objc.}
proc label*(self: PDFPage): NSString {.objc.}

# Page bounds - use NSRect (same as CGRect)
proc boundsForBox*(self: PDFPage, box: PDFDisplayBox): NSRect {.objc: "boundsForBox:".}
proc setBoundsForBox*(self: PDFPage, bounds: NSRect, box: PDFDisplayBox) {.objc: "setBounds:forBox:".}

# Display
proc drawWithBox*(self: PDFPage, box: PDFDisplayBox) {.objc: "drawWithBox:".}
proc drawWithBoxToContext*(self: PDFPage, box: PDFDisplayBox, context: CGContext) {.objc: "drawWithBox:toContext:".}
proc transformContextForBox*(self: PDFPage, context: CGContext, box: PDFDisplayBox) {.objc: "transformContext:forBox:".}
proc thumbnailOfSizeForBox*(self: PDFPage, size: NSSize, box: PDFDisplayBox): NSObject {.objc: "thumbnailOfSize:forBox:".}

# Annotations
proc annotations*(self: PDFPage): NSArray[PDFAnnotation] {.objc.}
proc addAnnotation*(self: PDFPage, annotation: PDFAnnotation) {.objc: "addAnnotation:".}
proc removeAnnotation*(self: PDFPage, annotation: PDFAnnotation) {.objc: "removeAnnotation:".}
proc annotationAtPoint*(self: PDFPage, point: NSPoint): PDFAnnotation {.objc: "annotationAtPoint:".}

# Selection
proc selectionForRect*(self: PDFPage, rect: NSRect): PDFSelection {.objc: "selectionForRect:".}
proc selectionForPoint*(self: PDFPage, point: NSPoint): PDFSelection {.objc: "selectionForPoint:".}
proc selectionForWordAtPoint*(self: PDFPage, point: NSPoint): PDFSelection {.objc: "selectionForWordAtPoint:".}
proc selectionForLineAtPoint*(self: PDFPage, point: NSPoint): PDFSelection {.objc: "selectionForLineAtPoint:".}
proc selectionFromPointToPoint*(self: PDFPage, startPoint, endPoint: NSPoint): PDFSelection {.objc: "selectionFromPoint:toPoint:".}
proc selectionForRange*(self: PDFPage, range: NSRange): PDFSelection {.objc: "selectionForRange:".}

# String content
proc stringValue*(self: PDFPage): NSString {.objc.}
proc attributedString*(self: PDFPage): NSAttributedString {.objc.}
proc characterBoundsAtIndex*(self: PDFPage, index: NSInteger): NSRect {.objc: "characterBoundsAtIndex:".}
proc characterIndexAtPoint*(self: PDFPage, point: NSPoint): NSInteger {.objc: "characterIndexAtPoint:".}

# PDFSelection methods (PDFSelection type defined above)
proc string*(self: PDFSelection): NSString {.objc.}
proc attributedString*(self: PDFSelection): NSAttributedString {.objc.}
proc boundsForPage*(self: PDFSelection, page: PDFPage): NSRect {.objc: "boundsForPage:".}
proc extendSelectionAtStart*(self: PDFSelection, count: NSInteger) {.objc: "extendSelectionAtStart:".}
proc extendSelectionAtEnd*(self: PDFSelection, count: NSInteger) {.objc: "extendSelectionAtEnd:".}

# Page rotation
proc rotation*(self: PDFPage): NSInteger {.objc.}
proc setRotation*(self: PDFPage, rotation: NSInteger) {.objc: "setRotation:".}

# Rendered images
proc imageOfSizeForBoxWithOptions*(self: PDFPage, size: NSSize, box: PDFDisplayBox, options: NSDictionary): NSObject {.objc: "imageOfSize:forBox:withOptions:".}

# PDF context
proc beginPDFPage*(context: CGContext, pageInfo: NSDictionary) {.importc: "CGPDFContextBeginPage".}
proc endPDFPage*(context: CGContext) {.importc: "CGPDFContextEndPage".}
