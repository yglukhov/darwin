import darwin/objc/runtime
import darwin/foundation/nsgeometry
import darwin/core_graphics/cggeometry
import pdfdocument

type
  PDFDestinationObj* = ptr object of NSObject

  PDFDestinationType* {.size: sizeof(uint).} = enum
    kPDFDestinationTypeXYZ = 0
    kPDFDestinationTypeFit = 1
    kPDFDestinationTypeFitH = 2
    kPDFDestinationTypeFitV = 3
    kPDFDestinationTypeFitR = 4
    kPDFDestinationTypeFitB = 5
    kPDFDestinationTypeFitBH = 6
    kPDFDestinationTypeFitBV = 7

# Creation
proc initWithPageAtPoint*(self: PDFDestinationObj, page: PDFPage, point: NSPoint): PDFDestinationObj {.objc: "initWithPage:atPoint:".}

# Page
proc page*(self: PDFDestinationObj): PDFPage {.objc.}

# Point
proc point*(self: PDFDestinationObj): NSPoint {.objc.}
proc setPoint*(self: PDFDestinationObj, point: NSPoint) {.objc: "setPoint:".}

# Zoom
proc zoom*(self: PDFDestinationObj): CGFloat {.objc.}
proc setZoom*(self: PDFDestinationObj, zoom: CGFloat) {.objc: "setZoom:".}

# Comparison
proc compare*(self: PDFDestinationObj, destination: PDFDestinationObj): NSInteger {.objc.}

# Type alias for easier use
type PDFDestination* = PDFDestinationObj
