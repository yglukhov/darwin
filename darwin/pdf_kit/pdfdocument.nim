import darwin/objc/runtime
import darwin/foundation/[nsstring, nsurl, nsdata, nsarray, nsdictionary]

# Forward declarations
type
  PDFPage* = ptr object of NSObject
  PDFOutline* = ptr object of NSObject
  PDFSelection* = ptr object of NSObject
  PDFDocument* = ptr object of NSObject

  PDFDisplayBox* {.size: sizeof(uint).} = enum
    kPDFDisplayBoxMediaBox = 0
    kPDFDisplayBoxCropBox = 1
    kPDFDisplayBoxBleedBox = 2
    kPDFDisplayBoxTrimBox = 3
    kPDFDisplayBoxArtBox = 4

  PDFDocumentPermissions* {.size: sizeof(uint).} = enum
    kPDFDocumentPermissionsNone = 0
    kPDFDocumentPermissionsUser = 1
    kPDFDocumentPermissionsOwner = 2

  PDFDocumentAttribute* = NSString

# Document creation
proc initWithURL*(self: PDFDocument, url: NSURL): PDFDocument {.objc: "initWithURL:".}
proc initWithData*(self: PDFDocument, data: NSData): PDFDocument {.objc: "initWithData:".}
proc documentWithURL*(cls: typedesc[PDFDocument], url: NSURL): PDFDocument {.objc: "documentWithURL:".}
proc documentWithData*(cls: typedesc[PDFDocument], data: NSData): PDFDocument {.objc: "documentWithData:".}

# Saving
proc writeToFile*(self: PDFDocument, path: NSString): bool {.objc: "writeToFile:".}
proc writeToFileWithOptions*(self: PDFDocument, path: NSString, options: NSDictionary): bool {.objc: "writeToFile:withOptions:".}
proc writeToURL*(self: PDFDocument, url: NSURL): bool {.objc: "writeToURL:".}
proc writeToURLWithOptions*(self: PDFDocument, url: NSURL, options: NSDictionary): bool {.objc: "writeToURL:withOptions:".}

# Document properties
proc documentURL*(self: PDFDocument): NSURL {.objc.}
proc documentAttributes*(self: PDFDocument): NSDictionary[NSString, NSObject] {.objc.}
proc setDocumentAttributes*(self: PDFDocument, attributes: NSDictionary) {.objc: "setDocumentAttributes:".}

# Page access
proc pageCount*(self: PDFDocument): NSUInteger {.objc.}
proc pageAtIndex*(self: PDFDocument, index: NSUInteger): PDFPage {.objc: "pageAtIndex:".}
proc indexForPage*(self: PDFDocument, page: PDFPage): NSUInteger {.objc: "indexForPage:".}
proc insertPageAtIndex*(self: PDFDocument, page: PDFPage, index: NSUInteger) {.objc: "insertPage:atIndex:".}
proc removePageAtIndex*(self: PDFDocument, index: NSUInteger) {.objc: "removePageAtIndex:".}
proc exchangePageAtIndexWithPageAtIndex*(self: PDFDocument, indexA, indexB: NSUInteger) {.objc: "exchangePageAtIndex:withPageAtIndex:".}

# Outline
proc outlineRoot*(self: PDFDocument): PDFOutline {.objc.}
proc setOutlineRoot*(self: PDFDocument, outline: PDFOutline) {.objc: "setOutlineRoot:".}

# Selection
proc selectionForEntireDocument*(self: PDFDocument): PDFSelection {.objc.}

# String content
proc stringValue*(self: PDFDocument): NSString {.objc.}
proc documentRef*(self: PDFDocument): pointer {.objc.}

# Security
proc allowsPrinting*(self: PDFDocument): bool {.objc.}
proc allowsCopying*(self: PDFDocument): bool {.objc.}
proc isLocked*(self: PDFDocument): bool {.objc.}
proc unlockWithPassword*(self: PDFDocument, password: NSString): bool {.objc: "unlockWithPassword:".}

# PDF actions
proc beginFindString*(self: PDFDocument, string: NSString, options: NSInteger) {.objc: "beginFindString:withOptions:".}
proc findString*(self: PDFDocument, string: NSString, options: NSInteger): NSArray[PDFSelection] {.objc: "findString:withOptions:".}
proc findStringFromSelection*(self: PDFDocument, string: NSString, selection: PDFSelection, options: NSInteger): PDFSelection {.objc: "findString:fromSelection:withOptions:".}

# Data representation
proc dataRepresentation*(self: PDFDocument): NSData {.objc.}

# Delegate
proc delegate*(self: PDFDocument): NSObject {.objc.}
proc setDelegate*(self: PDFDocument, delegate: NSObject) {.objc: "setDelegate:".}

# Document attribute keys
var
  PDFDocumentTitleAttribute* {.importc.}: PDFDocumentAttribute
  PDFDocumentAuthorAttribute* {.importc.}: PDFDocumentAttribute
  PDFDocumentSubjectAttribute* {.importc.}: PDFDocumentAttribute
  PDFDocumentCreatorAttribute* {.importc.}: PDFDocumentAttribute
  PDFDocumentProducerAttribute* {.importc.}: PDFDocumentAttribute
  PDFDocumentCreationDateAttribute* {.importc.}: PDFDocumentAttribute
  PDFDocumentModificationDateAttribute* {.importc.}: PDFDocumentAttribute
  PDFDocumentKeywordsAttribute* {.importc.}: PDFDocumentAttribute
