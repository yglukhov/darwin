import cgpdfobject

type
  CGPDFArrayRef* = ptr object
  CGPDFStringRef* = ptr object
  CGPDFStreamRef* = ptr object

# Forward declaration - defined in cgpdfdictionary
type CGPDFDictionaryRef* = ptr object

proc getCount*(array: CGPDFArrayRef): csize_t {.importc: "CGPDFArrayGetCount".}
proc getObject*(array: CGPDFArrayRef, index: csize_t, value: ptr CGPDFObjectRef): bool {.importc: "CGPDFArrayGetObject".}
proc getNull*(array: CGPDFArrayRef, index: csize_t): bool {.importc: "CGPDFArrayGetNull".}
proc getBoolean*(array: CGPDFArrayRef, index: csize_t, value: ptr CGPDFBoolean): bool {.importc: "CGPDFArrayGetBoolean".}
proc getInteger*(array: CGPDFArrayRef, index: csize_t, value: ptr CGPDFInteger): bool {.importc: "CGPDFArrayGetInteger".}
proc getNumber*(array: CGPDFArrayRef, index: csize_t, value: ptr CGPDFReal): bool {.importc: "CGPDFArrayGetNumber".}
proc getName*(array: CGPDFArrayRef, index: csize_t, value: ptr cstring): bool {.importc: "CGPDFArrayGetName".}
proc getString*(array: CGPDFArrayRef, index: csize_t, value: ptr CGPDFStringRef): bool {.importc: "CGPDFArrayGetString".}
proc getArray*(array: CGPDFArrayRef, index: csize_t, value: ptr CGPDFArrayRef): bool {.importc: "CGPDFArrayGetArray".}
proc getDictionary*(array: CGPDFArrayRef, index: csize_t, value: ptr CGPDFDictionaryRef): bool {.importc: "CGPDFArrayGetDictionary".}
proc getStream*(array: CGPDFArrayRef, index: csize_t, value: ptr CGPDFStreamRef): bool {.importc: "CGPDFArrayGetStream".}
