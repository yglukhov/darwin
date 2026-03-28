import cggeometry

type
  CGPDFObjectRef* = ptr object
  CGPDFBoolean* = uint8
  CGPDFInteger* = clong
  CGPDFReal* = CGFloat

  CGPDFObjectType* {.size: sizeof(int32).} = enum
    kCGPDFObjectTypeNull = 1
    kCGPDFObjectTypeBoolean
    kCGPDFObjectTypeInteger
    kCGPDFObjectTypeReal
    kCGPDFObjectTypeName
    kCGPDFObjectTypeString
    kCGPDFObjectTypeArray
    kCGPDFObjectTypeDictionary
    kCGPDFObjectTypeStream

proc getType*(obj: CGPDFObjectRef): CGPDFObjectType {.importc: "CGPDFObjectGetType".}
proc getValue*(obj: CGPDFObjectRef, `type`: CGPDFObjectType, value: pointer): bool {.importc: "CGPDFObjectGetValue".}
