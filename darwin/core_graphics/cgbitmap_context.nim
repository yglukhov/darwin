import cgcontext, cgcolor_space, cgimage

proc CGBitmapContextCreate*(data: pointer,
    width, height, bitsPerComponent, bytesPerRow: csize,
    space: CGColorSpace, bitmapInfo: uint32): CGContext {.importc.}

proc getData*(context: CGContext): pointer {.importc: "CGBitmapContextGetData".}
proc createImage*(context: CGContext): CGImage {.importc: "CGBitmapContextCreateImage".}
