import darwin / core_foundation / [cfbase]

type
    CTFontDescriptor* = ptr object of CFObject
    CTFontOrientation* {.size: sizeof(uint32).} = enum
        kCTFontOrientationDefault = 0
        kCTFontOrientationHorizontal = 1
        kCTFontOrientationVertical = 2
