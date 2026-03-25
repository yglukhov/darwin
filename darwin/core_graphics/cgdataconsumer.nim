import darwin / core_foundation / [cfbase, cfdata, cfdictionary, cfurl]
import cggeometry, cgcontext, cgimage

type
    CGDataConsumer* = ptr object of CFObject
    # CGPDFDocument and CGPDFPage are CFTypes (have Retain/Release/GetTypeID)
    CGPDFDocument* = ptr object of CFObject
    CGPDFPage* = ptr object of CFObject
    # These are not CFTypes - they don't have Retain/Release/GetTypeID
    CGPDFDictionary* = ptr object
    CGPDFArray* = ptr object
    CGPDFStream* = ptr object
    CGPDFObject* = ptr object

    CGDataConsumerPutBytesCallback* = proc(info: pointer, buffer: pointer, count: csize_t): csize_t {.cdecl.}
    CGDataConsumerReleaseInfoCallback* = proc(info: pointer) {.cdecl.}

    CGDataConsumerCallbacks* {.byref.} = object
        putBytes*: CGDataConsumerPutBytesCallback
        releaseConsumer*: CGDataConsumerReleaseInfoCallback

    CGPDFBox* {.size: sizeof(int32).} = enum
        kCGPDFMediaBox = 0
        kCGPDFCropBox = 1
        kCGPDFBleedBox = 2
        kCGPDFTrimBox = 3
        kCGPDFArtBox = 4

# CGDataConsumer
proc create*(T: typedesc[CGDataConsumer], info: pointer, cbks: ptr CGDataConsumerCallbacks): CGDataConsumer {.importc: "CGDataConsumerCreate".}
proc createWithURL*(T: typedesc[CGDataConsumer], url: CFURL): CGDataConsumer {.importc: "CGDataConsumerCreateWithURL".}
proc createWithCFData*(T: typedesc[CGDataConsumer], data: CFMutableData): CGDataConsumer {.importc: "CGDataConsumerCreateWithCFData".}
proc retain*(consumer: CGDataConsumer): CGDataConsumer {.importc: "CGDataConsumerRetain".}
proc release*(consumer: CGDataConsumer) {.importc: "CGDataConsumerRelease".}
proc getTypeID*(T: typedesc[CGDataConsumer]): CFTypeID {.importc: "CGDataConsumerGetTypeID".}

# CGPDFDocument
proc createWithProvider*(T: typedesc[CGPDFDocument], provider: CGDataProvider): CGPDFDocument {.importc: "CGPDFDocumentCreateWithProvider".}
proc openWithURL*(T: typedesc[CGPDFDocument], url: CFURL): CGPDFDocument {.importc: "CGPDFDocumentCreateWithURL".}
proc retain*(document: CGPDFDocument): CGPDFDocument {.importc: "CGPDFDocumentRetain".}
proc release*(document: CGPDFDocument) {.importc: "CGPDFDocumentRelease".}
proc getVersion*(document: CGPDFDocument, majorVersion: ptr int32, minorVersion: ptr int32) {.importc: "CGPDFDocumentGetVersion".}
proc isEncrypted*(document: CGPDFDocument): bool {.importc: "CGPDFDocumentIsEncrypted".}
proc unlockWithPassword*(document: CGPDFDocument, password: cstring): bool {.importc: "CGPDFDocumentUnlockWithPassword".}
proc isUnlocked*(document: CGPDFDocument): bool {.importc: "CGPDFDocumentIsUnlocked".}
proc allowsPrinting*(document: CGPDFDocument): bool {.importc: "CGPDFDocumentAllowsPrinting".}
proc allowsCopying*(document: CGPDFDocument): bool {.importc: "CGPDFDocumentAllowsCopying".}
proc getNumberOfPages*(document: CGPDFDocument): csize_t {.importc: "CGPDFDocumentGetNumberOfPages".}
proc getPage*(document: CGPDFDocument, pageNumber: csize_t): CGPDFPage {.importc: "CGPDFDocumentGetPage".}
proc getCatalog*(document: CGPDFDocument): CGPDFDictionary {.importc: "CGPDFDocumentGetCatalog".}
proc getInfo*(document: CGPDFDocument): CGPDFDictionary {.importc: "CGPDFDocumentGetInfo".}
proc getID*(document: CGPDFDocument): CGPDFArray {.importc: "CGPDFDocumentGetID".}
proc getTypeID*(T: typedesc[CGPDFDocument]): CFTypeID {.importc: "CGPDFDocumentGetTypeID".}

# CGPDFPage
proc retain*(page: CGPDFPage): CGPDFPage {.importc: "CGPDFPageRetain".}
proc release*(page: CGPDFPage) {.importc: "CGPDFPageRelease".}
proc getDocument*(page: CGPDFPage): CGPDFDocument {.importc: "CGPDFPageGetDocument".}
proc getPageNumber*(page: CGPDFPage): csize_t {.importc: "CGPDFPageGetPageNumber".}
proc getBoxRect*(page: CGPDFPage, box: CGPDFBox): CGRect {.importc: "CGPDFPageGetBoxRect".}
proc getRotationAngle*(page: CGPDFPage): int32 {.importc: "CGPDFPageGetRotationAngle".}
proc getDictionary*(page: CGPDFPage): CGPDFDictionary {.importc: "CGPDFPageGetDictionary".}
proc getTypeID*(T: typedesc[CGPDFPage]): CFTypeID {.importc: "CGPDFPageGetTypeID".}

# CGPDFContext
proc createPDFContext*(T: typedesc[CGContext], consumer: CGDataConsumer, mediaBox: ptr CGRect, auxiliaryInfo: CFDictionary): CGContext {.importc: "CGPDFContextCreate".}
proc createPDFContextWithURL*(T: typedesc[CGContext], url: CFURL, mediaBox: ptr CGRect, auxiliaryInfo: CFDictionary): CGContext {.importc: "CGPDFContextCreateWithURL".}
proc beginPDFPage*(context: CGContext, pageInfo: CFDictionary) {.importc: "CGPDFContextBeginPage".}
proc endPDFPage*(context: CGContext) {.importc: "CGPDFContextEndPage".}
proc closePDFContext*(context: CGContext) {.importc: "CGPDFContextClose".}
