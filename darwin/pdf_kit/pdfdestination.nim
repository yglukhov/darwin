import darwin/objc/runtime
import darwin/foundation/nsgeometry
import darwin/core_graphics/cggeometry
import pdfdocument

type
  PDFDestination* = ptr object of NSObject

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
proc initWithPageAtPoint*(self: PDFDestination, page: PDFPage, point: NSPoint): PDFDestination {.objc: "initWithPage:atPoint:".}

# Page
proc page*(self: PDFDestination): PDFPage {.objc.}

# Point
proc point*(self: PDFDestination): NSPoint {.objc.}

# Zoom
proc zoom*(self: PDFDestination): CGFloat {.objc.}
proc setZoom*(self: PDFDestination, zoom: CGFloat) {.objc: "setZoom:".}

# Comparison
proc compare*(self: PDFDestination, destination: PDFDestination): NSInteger {.objc.}


