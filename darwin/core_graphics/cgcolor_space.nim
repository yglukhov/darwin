import darwin / core_foundation / [cfbase]

type
    CGColorSpace* = ptr object of CFObject

proc CGColorSpaceCreateDeviceGray*(): CGColorSpace {.importc.}
proc CGColorSpaceCreateDeviceRGB*(): CGColorSpace {.importc.}
