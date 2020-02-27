import cfbase, cfstring

type
    CFURL* = ptr object of CFObject
    CFURLPathStyle* = enum
        kCFURLPOSIXPathStyle = 0
        kCFURLWindowsPathStyle = 2


proc CFURLGetTypeID*(): CFTypeID {.importc.}

proc CFURLCreateWithBytes*(allocator: CFAllocator, URLBytes: pointer, length: CFIndex, encoding: CFStringEncoding, baseURL: CFURL): CFURL {.importc.}
proc CFURLCreateWithString*(allocator: CFAllocator, URLString: CFString, baseURL: CFURL): CFURL {.importc.}
proc CFURLCreateWithFileSystemPath*(allocator: CFAllocator, filePath: CFString, pathStyle: CFURLPathStyle, isDirectory: Boolean): CFURL {.importc.}
