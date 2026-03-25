import darwin/core_foundation/cfbase
import cggeometry
import cgpdfdocument

type
  CGPDFPageRef* = ptr object of CFObject
  CGPDFBox* {.size: sizeof(int32).} = enum
    kCGPDFMediaBox = 0
    kCGPDFCropBox = 1
    kCGPDFBleedBox = 2
    kCGPDFTrimBox = 3
    kCGPDFArtBox = 4

# Memory management
proc retain*(page: CGPDFPageRef): CGPDFPageRef {.importc: "CGPDFPageRetain".}
proc release*(page: CGPDFPageRef) {.importc: "CGPDFPageRelease".}

# Info
proc getDocument*(page: CGPDFPageRef): CGPDFDocumentRef {.importc: "CGPDFPageGetDocument".}
proc getPageNumber*(page: CGPDFPageRef): csize_t {.importc: "CGPDFPageGetPageNumber".}
proc getBoxRect*(page: CGPDFPageRef, box: CGPDFBox): CGRect {.importc: "CGPDFPageGetBoxRect".}
proc getRotationAngle*(page: CGPDFPageRef): int32 {.importc: "CGPDFPageGetRotationAngle".}
proc getDictionary*(page: CGPDFPageRef): CGPDFDictionaryRef {.importc: "CGPDFPageGetDictionary".}

# Type ID
proc getTypeID*(T: typedesc[CGPDFPageRef]): CFTypeID {.importc: "CGPDFPageGetTypeID".}
