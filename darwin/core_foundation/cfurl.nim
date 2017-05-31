import cfbase, cfstring

type
    CFURL* = ptr object of CFObject

proc CFURLGetTypeID*(): CFTypeID {.importc.}

proc CFURLCreateWithBytes*(allocator: CFAllocator, URLBytes: pointer, length: CFIndex, encoding: CFStringEncoding, baseURL: CFURL): CFURL {.importc.}
proc CFURLCreateWithString*(allocator: CFAllocator, URLString: CFString, baseURL: CFURL): CFURL {.importc.}
