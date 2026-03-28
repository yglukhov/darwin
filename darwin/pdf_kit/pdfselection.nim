import darwin/objc/runtime
import darwin/foundation/[nsstring, nsarray, nsattributedstring, nsgeometry, nsrange]
import darwin/app_kit/nscolor
import pdftypes

export pdftypes.PDFSelection, pdftypes.PDFPage, pdftypes.PDFDisplayBox

type
  PDFSelectionGranularity* {.size: sizeof(uint).} = enum
    kPDFSelectionGranularityCharacter = 0
    kPDFSelectionGranularityWord = 1
    kPDFSelectionGranularityLine = 2

# Initialization
proc initWithDocument*(self: PDFSelection, document: PDFDocument): PDFSelection {.objc: "initWithDocument:".}

# Properties
proc pages*(self: PDFSelection): NSArray[PDFPage] {.objc.}
proc color*(self: PDFSelection): NSColor {.objc.}
proc setColor*(self: PDFSelection, color: NSColor) {.objc: "setColor:".}
proc string*(self: PDFSelection): NSString {.objc.}
proc attributedString*(self: PDFSelection): NSAttributedString {.objc.}

# Bounds
proc boundsForPage*(self: PDFSelection, page: PDFPage): NSRect {.objc: "boundsForPage:".}

# Text ranges
proc numberOfTextRangesOnPage*(self: PDFSelection, page: PDFPage): NSUInteger {.objc: "numberOfTextRangesOnPage:".}
proc rangeAtIndexOnPage*(self: PDFSelection, index: NSUInteger, page: PDFPage): NSRange {.objc: "rangeAtIndex:onPage:".}

# Selections by line
proc selectionsByLine*(self: PDFSelection): NSArray[PDFSelection] {.objc.}

# Modifying
proc addSelection*(self: PDFSelection, selection: PDFSelection) {.objc: "addSelection:".}
proc addSelections*(self: PDFSelection, selections: NSArray[PDFSelection]) {.objc: "addSelections:".}
proc extendSelectionAtEnd*(self: PDFSelection, count: NSInteger) {.objc: "extendSelectionAtEnd:".}
proc extendSelectionAtStart*(self: PDFSelection, count: NSInteger) {.objc: "extendSelectionAtStart:".}
proc extendSelectionForLineBoundaries*(self: PDFSelection) {.objc.}

# Drawing
proc drawForPageActive*(self: PDFSelection, page: PDFPage, active: bool) {.objc: "drawForPage:active:".}
proc drawForPageWithBoxActive*(self: PDFSelection, page: PDFPage, box: PDFDisplayBox, active: bool) {.objc: "drawForPage:withBox:active:".}
