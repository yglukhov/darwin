import cgpdfobject
import cgpdfarray

export cgpdfarray.CGPDFArrayRef, cgpdfarray.CGPDFStringRef, cgpdfarray.CGPDFStreamRef

type
  CGPDFDictionaryRef* = ptr object
  CGPDFDictionaryApplierFunction* = proc(key: cstring, value: CGPDFObjectRef, info: pointer) {.cdecl.}

proc getCount*(dict: CGPDFDictionaryRef): csize_t {.importc: "CGPDFDictionaryGetCount".}
proc getObject*(dict: CGPDFDictionaryRef, key: cstring, value: ptr CGPDFObjectRef): bool {.importc: "CGPDFDictionaryGetObject".}
proc getBoolean*(dict: CGPDFDictionaryRef, key: cstring, value: ptr CGPDFBoolean): bool {.importc: "CGPDFDictionaryGetBoolean".}
proc getInteger*(dict: CGPDFDictionaryRef, key: cstring, value: ptr CGPDFInteger): bool {.importc: "CGPDFDictionaryGetInteger".}
proc getNumber*(dict: CGPDFDictionaryRef, key: cstring, value: ptr CGPDFReal): bool {.importc: "CGPDFDictionaryGetNumber".}
proc getName*(dict: CGPDFDictionaryRef, key: cstring, value: ptr cstring): bool {.importc: "CGPDFDictionaryGetName".}
proc applyFunction*(dict: CGPDFDictionaryRef, function: CGPDFDictionaryApplierFunction, info: pointer) {.importc: "CGPDFDictionaryApplyFunction".}

# These use forward declared types
proc getString*(dict: CGPDFDictionaryRef, key: cstring, value: ptr CGPDFStringRef): bool {.importc: "CGPDFDictionaryGetString".}
proc getArray*(dict: CGPDFDictionaryRef, key: cstring, value: ptr CGPDFArrayRef): bool {.importc: "CGPDFDictionaryGetArray".}
proc getDictionary*(dict: CGPDFDictionaryRef, key: cstring, value: ptr CGPDFDictionaryRef): bool {.importc: "CGPDFDictionaryGetDictionary".}
proc getStream*(dict: CGPDFDictionaryRef, key: cstring, value: ptr CGPDFStreamRef): bool {.importc: "CGPDFDictionaryGetStream".}
