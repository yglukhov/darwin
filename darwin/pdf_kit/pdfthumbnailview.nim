import darwin/objc/runtime
import darwin/foundation/nsgeometry
import pdftypes

export pdftypes.PDFThumbnailView, pdftypes.PDFView

# Constructors
proc initWithFrame*(self: PDFThumbnailView, frame: NSRect): PDFThumbnailView {.objc: "initWithFrame:".}

# PDFView association
proc pdfView*(self: PDFThumbnailView): PDFView {.objc.}
proc setPdfView*(self: PDFThumbnailView, pdfView: PDFView) {.objc: "setPDFView:".}

# Selection
proc selectedPages*(self: PDFThumbnailView): NSObject {.objc.}

# Display options
proc thumbnailSize*(self: PDFThumbnailView): NSSize {.objc.}
proc setThumbnailSize*(self: PDFThumbnailView, size: NSSize) {.objc: "setThumbnailSize:".}
proc maximumNumberOfColumns*(self: PDFThumbnailView): NSUInteger {.objc.}
proc setMaximumNumberOfColumns*(self: PDFThumbnailView, columns: NSUInteger) {.objc: "setMaximumNumberOfColumns:".}
proc labelFont*(self: PDFThumbnailView): NSObject {.objc.}
proc setLabelFont*(self: PDFThumbnailView, font: NSObject) {.objc: "setLabelFont:".}

# Background color
proc backgroundColor*(self: PDFThumbnailView): NSObject {.objc.}
proc setBackgroundColor*(self: PDFThumbnailView, color: NSObject) {.objc: "setBackgroundColor:".}

# Layout options
proc allowsDragging*(self: PDFThumbnailView): bool {.objc.}
proc setAllowsDragging*(self: PDFThumbnailView, allows: bool) {.objc: "setAllowsDragging:".}
proc allowsMultipleSelection*(self: PDFThumbnailView): bool {.objc.}
proc setAllowsMultipleSelection*(self: PDFThumbnailView, allows: bool) {.objc: "setAllowsMultipleSelection:".}
