import cfbase, cfurl

type
    CFReadStream* = ptr object of CFObject
    CFWriteStream* = ptr object of CFObject

proc CFReadStreamGetTypeID*(): CFTypeID {.importc.}
proc CFWriteStreamGetTypeID*(): CFTypeID {.importc.}

proc CFReadStreamCreateWithBytesNoCopy*(alloc: CFAllocator, bytes: pointer, length: CFIndex, bytesDeallocator: CFAllocator): CFReadStream {.importc.}
proc CFReadStreamCreateWithFile*(alloc: CFAllocator, fileURL: CFURL): CFReadStream {.importc.}

proc CFWriteStreamCreateWithFile*(alloc: CFAllocator, fileURL: CFURL): CFReadStream {.importc.}

proc CFReadStreamOpen(stream: CFReadStream): Boolean {.importc.}

proc open*(s: CFReadStream): bool {.inline.} = bool CFReadStreamOpen(s)
