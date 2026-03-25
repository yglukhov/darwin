import darwin/core_foundation/[cfbase, cfdictionary, cfurl, cfstring, cfdata]
import cggeometry, cgcontext, cgdataconsumer, cgpdfdictionary

# CGPDFContext is not a separate type - it's just a CGContext with PDF-specific functions
# These functions operate on CGContextRef

# Creation
proc createPDFContext*(consumer: CGDataConsumer, mediaBox: ptr CGRect, auxiliaryInfo: CFDictionary): CGContext {.importc: "CGPDFContextCreate".}
proc createPDFContextWithURL*(url: CFURL, mediaBox: ptr CGRect, auxiliaryInfo: CFDictionary): CGContext {.importc: "CGPDFContextCreateWithURL".}

# Page management
proc beginPDFPage*(context: CGContext, pageInfo: CFDictionary) {.importc: "CGPDFContextBeginPage".}
proc endPDFPage*(context: CGContext) {.importc: "CGPDFContextEndPage".}
proc closePDFContext*(context: CGContext) {.importc: "CGPDFContextClose".}

# Document metadata
proc addPDFDocumentMetadata*(context: CGContext, metadata: CFData) {.importc: "CGPDFContextAddDocumentMetadata".}
proc setPDFOutline*(context: CGContext, outline: CFDictionary) {.importc: "CGPDFContextSetOutline".}

# Structure tree (for tagged PDF)
proc setPDFParentTree*(context: CGContext, parentTreeDictionary: CGPDFDictionaryRef) {.importc: "CGPDFContextSetParentTree".}
proc setPDFIDTree*(context: CGContext, IDTreeDictionary: CGPDFDictionaryRef) {.importc: "CGPDFContextSetIDTree".}

# URLs and destinations
proc setPDFURLForRect*(context: CGContext, url: CFURL, rect: CGRect) {.importc: "CGPDFContextSetURLForRect".}
proc addPDFDestinationAtPoint*(context: CGContext, name: CFString, point: CGPoint) {.importc: "CGPDFContextAddDestinationAtPoint".}
proc setPDFDestinationForRect*(context: CGContext, name: CFString, rect: CGRect) {.importc: "CGPDFContextSetDestinationForRect".}

# Tagged PDF (10.15+)
type
  CGPDFTagType* {.size: sizeof(int32).} = enum
    CGPDFTagTypeDocument = 100
    CGPDFTagTypePart
    CGPDFTagTypeArt
    CGPDFTagTypeSection
    CGPDFTagTypeDiv
    CGPDFTagTypeBlockQuote
    CGPDFTagTypeCaption
    CGPDFTagTypeTOC
    CGPDFTagTypeTOCI
    CGPDFTagTypeIndex
    CGPDFTagTypeNonStructure
    CGPDFTagTypePrivate
    CGPDFTagTypeParagraph = 200
    CGPDFTagTypeHeader
    CGPDFTagTypeHeader1
    CGPDFTagTypeHeader2
    CGPDFTagTypeHeader3
    CGPDFTagTypeHeader4
    CGPDFTagTypeHeader5
    CGPDFTagTypeHeader6
    CGPDFTagTypeList = 300
    CGPDFTagTypeListItem
    CGPDFTagTypeLabel
    CGPDFTagTypeListBody
    CGPDFTagTypeTable = 400
    CGPDFTagTypeTableRow
    CGPDFTagTypeTableHeaderCell
    CGPDFTagTypeTableDataCell
    CGPDFTagTypeTableHeader
    CGPDFTagTypeTableBody
    CGPDFTagTypeTableFooter
    CGPDFTagTypeSpan = 500
    CGPDFTagTypeQuote
    CGPDFTagTypeNote
    CGPDFTagTypeReference
    CGPDFTagTypeBibliography
    CGPDFTagTypeCode
    CGPDFTagTypeLink
    CGPDFTagTypeAnnotation
    CGPDFTagTypeRuby = 600
    CGPDFTagTypeRubyBaseText
    CGPDFTagTypeRubyAnnotationText
    CGPDFTagTypeRubyPunctuation
    CGPDFTagTypeWarichu
    CGPDFTagTypeWarichuText
    CGPDFTagTypeWarichuPunctiation
    CGPDFTagTypeFigure = 700
    CGPDFTagTypeFormula
    CGPDFTagTypeForm
    CGPDFTagTypeObject = 800

proc beginPDFTag*(context: CGContext, tagType: CGPDFTagType, tagProperties: CFDictionary) {.importc: "CGPDFContextBeginTag".}
proc endPDFTag*(context: CGContext) {.importc: "CGPDFContextEndTag".}

# Page box keys
var
  kCGPDFContextMediaBox* {.importc.}: CFString
  kCGPDFContextCropBox* {.importc.}: CFString
  kCGPDFContextBleedBox* {.importc.}: CFString
  kCGPDFContextTrimBox* {.importc.}: CFString
  kCGPDFContextArtBox* {.importc.}: CFString

# Document info keys
var
  kCGPDFContextTitle* {.importc.}: CFString
  kCGPDFContextAuthor* {.importc.}: CFString
  kCGPDFContextSubject* {.importc.}: CFString
  kCGPDFContextKeywords* {.importc.}: CFString
  kCGPDFContextCreator* {.importc.}: CFString
  kCGPDFContextOwnerPassword* {.importc.}: CFString
  kCGPDFContextUserPassword* {.importc.}: CFString
  kCGPDFContextAllowsPrinting* {.importc.}: CFString
  kCGPDFContextAllowsCopying* {.importc.}: CFString
  kCGPDFContextAccessPermissions* {.importc.}: CFString
