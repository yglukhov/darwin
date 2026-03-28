import darwin/core_foundation/[cfbase, cfurl]
import cgimage
import cgpdfdictionary

export cgpdfdictionary.CGPDFDictionaryRef, cgpdfdictionary.CGPDFArrayRef

type
  CGPDFDocumentRef* = ptr object of CFObject
  CGPDFAccessPermissions* {.size: sizeof(uint32).} = enum
    kCGPDFAllowsLowQualityPrinting = 1 shl 0
    kCGPDFAllowsHighQualityPrinting = 1 shl 1
    kCGPDFAllowsDocumentChanges = 1 shl 2
    kCGPDFAllowsDocumentAssembly = 1 shl 3
    kCGPDFAllowsContentCopying = 1 shl 4
    kCGPDFAllowsContentAccessibility = 1 shl 5
    kCGPDFAllowsCommenting = 1 shl 6
    kCGPDFAllowsFormFieldEntry = 1 shl 7

# Forward declaration
type
  CGPDFPageRef* = ptr object of CFObject

# Creation
proc createWithProvider*(T: typedesc[CGPDFDocumentRef], provider: CGDataProvider): CGPDFDocumentRef {.importc: "CGPDFDocumentCreateWithProvider".}
proc createWithURL*(T: typedesc[CGPDFDocumentRef], url: CFURL): CGPDFDocumentRef {.importc: "CGPDFDocumentCreateWithURL".}

# Memory management
proc retain*(document: CGPDFDocumentRef): CGPDFDocumentRef {.importc: "CGPDFDocumentRetain".}
proc release*(document: CGPDFDocumentRef) {.importc: "CGPDFDocumentRelease".}

# Info
proc getVersion*(document: CGPDFDocumentRef, majorVersion: ptr int32, minorVersion: ptr int32) {.importc: "CGPDFDocumentGetVersion".}
proc isEncrypted*(document: CGPDFDocumentRef): bool {.importc: "CGPDFDocumentIsEncrypted".}
proc unlockWithPassword*(document: CGPDFDocumentRef, password: cstring): bool {.importc: "CGPDFDocumentUnlockWithPassword".}
proc isUnlocked*(document: CGPDFDocumentRef): bool {.importc: "CGPDFDocumentIsUnlocked".}
proc allowsPrinting*(document: CGPDFDocumentRef): bool {.importc: "CGPDFDocumentAllowsPrinting".}
proc allowsCopying*(document: CGPDFDocumentRef): bool {.importc: "CGPDFDocumentAllowsCopying".}
proc getAccessPermissions*(document: CGPDFDocumentRef): CGPDFAccessPermissions {.importc: "CGPDFDocumentGetAccessPermissions".}

# Pages
proc getNumberOfPages*(document: CGPDFDocumentRef): csize_t {.importc: "CGPDFDocumentGetNumberOfPages".}
proc getPage*(document: CGPDFDocumentRef, pageNumber: csize_t): CGPDFPageRef {.importc: "CGPDFDocumentGetPage".}

# Catalog/Info/ID
proc getCatalog*(document: CGPDFDocumentRef): CGPDFDictionaryRef {.importc: "CGPDFDocumentGetCatalog".}
proc getInfo*(document: CGPDFDocumentRef): CGPDFDictionaryRef {.importc: "CGPDFDocumentGetInfo".}
proc getID*(document: CGPDFDocumentRef): CGPDFArrayRef {.importc: "CGPDFDocumentGetID".}

# Type ID
proc getTypeID*(T: typedesc[CGPDFDocumentRef]): CFTypeID {.importc: "CGPDFDocumentGetTypeID".}
