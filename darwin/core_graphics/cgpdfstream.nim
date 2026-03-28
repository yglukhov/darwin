import cgpdfdictionary
import darwin/core_foundation/[cfbase, cfdata]

type
  CGPDFStreamRef* = ptr object
  CGPDFDataFormat* {.size: sizeof(int32).} = enum
    CGPDFDataFormatRaw
    CGPDFDataFormatJPEGEncoded
    CGPDFDataFormatJPEG2000

proc getDictionary*(stream: CGPDFStreamRef): CGPDFDictionaryRef {.importc: "CGPDFStreamGetDictionary".}
proc copyData*(stream: CGPDFStreamRef, format: ptr CGPDFDataFormat): CFData {.importc: "CGPDFStreamCopyData".}
