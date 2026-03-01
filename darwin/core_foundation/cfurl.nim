import cfbase, cfstring

type
    CFURL* = ptr object of CFObject
    CFURLPathStyle* = enum
        kCFURLPOSIXPathStyle = 0
        kCFURLWindowsPathStyle = 2


proc CFURLGetTypeID*(): CFTypeID {.importc.}

proc createWithBytes*(allocator: CFAllocator, URLBytes: pointer, length: CFIndex, encoding: CFStringEncoding, baseURL: CFURL): CFURL {.importc: "CFURLCreateWithBytes".}
proc createWithString*(allocator: CFAllocator, URLString: CFString, baseURL: CFURL): CFURL {.importc: "CFURLCreateWithString".}
proc createWithFileSystemPath*(allocator: CFAllocator, filePath: CFString, pathStyle: CFURLPathStyle, isDirectory: Boolean): CFURL {.importc: "CFURLCreateWithFileSystemPath".}
proc getFileSystemRepresentation*(url: CFURL, resolveAgainstBase: Boolean, buffer: ptr uint8, maxBufLen: CFIndex): Boolean {.importc: "CFURLGetFileSystemRepresentation".}
