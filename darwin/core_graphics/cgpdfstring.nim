import darwin/core_foundation/cfstring

type
  CGPDFStringRef* = ptr object

proc getLength*(string: CGPDFStringRef): csize_t {.importc: "CGPDFStringGetLength".}
proc getBytePtr*(string: CGPDFStringRef): ptr uint8 {.importc: "CGPDFStringGetBytePtr".}
proc copyTextString*(string: CGPDFStringRef): CFString {.importc: "CGPDFStringCopyTextString".}
# Note: copyDate returns CFDate which is not yet bound
