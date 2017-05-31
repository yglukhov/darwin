import cgcontext, cgcolor_space

proc CGBitmapContextCreate*(data: pointer,
    width, height, bitsPerComponent, bytesPerRow: csize,
    space: CGColorSpace, bitmapInfo: uint32): CGContext {.importc.}
