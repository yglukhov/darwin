import darwin/objc/runtime
import darwin/foundation/nsgeometry
import darwin/app_kit/nsview

# Import pdfview to get the proper PDFView type
import pdfview

type
  PDFThumbnailViewObj* = ptr object of NSView

# Constructors
proc initWithFrame*(self: PDFThumbnailViewObj, frame: NSRect): PDFThumbnailViewObj {.objc: "initWithFrame:".}

# PDFView association - use PDFView from pdfview module
proc pdfView*(self: PDFThumbnailViewObj): PDFView {.objc.}
proc setPdfView*(self: PDFThumbnailViewObj, pdfView: PDFView) {.objc: "setPDFView:".}

# Selection
proc selectedPages*(self: PDFThumbnailViewObj): NSObject {.objc.}

# Display options
proc thumbnailSize*(self: PDFThumbnailViewObj): NSSize {.objc.}
proc setThumbnailSize*(self: PDFThumbnailViewObj, size: NSSize) {.objc: "setThumbnailSize:".}
proc maximumNumberOfColumns*(self: PDFThumbnailViewObj): NSUInteger {.objc.}
proc setMaximumNumberOfColumns*(self: PDFThumbnailViewObj, columns: NSUInteger) {.objc: "setMaximumNumberOfColumns:".}
proc labelFont*(self: PDFThumbnailViewObj): NSObject {.objc.}
proc setLabelFont*(self: PDFThumbnailViewObj, font: NSObject) {.objc: "setLabelFont:".}

# Background color
proc backgroundColor*(self: PDFThumbnailViewObj): NSObject {.objc.}
proc setBackgroundColor*(self: PDFThumbnailViewObj, color: NSObject) {.objc: "setBackgroundColor:".}

# Layout options - PDFThumbnailView uses 'allowsDragging' not 'allowsDragAndDrop'
proc allowsDragging*(self: PDFThumbnailViewObj): bool {.objc.}
proc setAllowsDragging*(self: PDFThumbnailViewObj, allows: bool) {.objc: "setAllowsDragging:".}
proc allowsMultipleSelection*(self: PDFThumbnailViewObj): bool {.objc.}
proc setAllowsMultipleSelection*(self: PDFThumbnailViewObj, allows: bool) {.objc: "setAllowsMultipleSelection:".}

# Type alias for easier use
type PDFThumbnailView* = PDFThumbnailViewObj
