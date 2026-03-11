import cfbase

type
    CFData* = ptr object of CFObject
    CFMutableData* = ptr object of CFData
    CFDataSearchFlags* = distinct CFOptionFlags

const
    kCFDataSearchBackwards* = CFDataSearchFlags(1'u shl 0)
    kCFDataSearchAnchored* = CFDataSearchFlags(1'u shl 1)

proc CFDataGetTypeID*(): CFTypeID {.importc.}

proc CFDataCreate*(allocator: CFAllocator, bytes: ptr uint8, length: CFIndex): CFData {.importc.}

proc CFDataCreateWithBytesNoCopy*(allocator: CFAllocator, bytes: ptr uint8, length: CFIndex, bytesDeallocator: CFAllocator): CFData {.importc.}

proc CFDataCreateCopy*(allocator: CFAllocator, theData: CFData): CFData {.importc.}

proc CFDataCreateMutable*(allocator: CFAllocator, capacity: CFIndex): CFMutableData {.importc.}

proc CFDataCreateMutableCopy*(allocator: CFAllocator, capacity: CFIndex, theData: CFData): CFMutableData {.importc.}

proc getLength*(theData: CFData): CFIndex {.importc: "CFDataGetLength".}

proc getBytePtr*(theData: CFData): ptr uint8 {.importc: "CFDataGetBytePtr".}

proc getMutableBytePtr*(theData: CFMutableData): ptr uint8 {.importc: "CFDataGetMutableBytePtr".}

proc getBytes*(theData: CFData, range: CFRange, buffer: ptr uint8) {.importc: "CFDataGetBytes".}

proc setLength*(theData: CFMutableData, length: CFIndex) {.importc: "CFDataSetLength".}

proc increaseLength*(theData: CFMutableData, extraLength: CFIndex) {.importc: "CFDataIncreaseLength".}

proc appendBytes*(theData: CFMutableData, bytes: ptr uint8, length: CFIndex) {.importc: "CFDataAppendBytes".}

proc replaceBytes*(theData: CFMutableData, range: CFRange, newBytes: ptr uint8, newLength: CFIndex) {.importc: "CFDataReplaceBytes".}

proc deleteBytes*(theData: CFMutableData, range: CFRange) {.importc: "CFDataDeleteBytes".}

proc find*(theData: CFData, dataToFind: CFData, searchRange: CFRange, compareOptions: CFDataSearchFlags): CFRange {.importc: "CFDataFind".}
