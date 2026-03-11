import darwin / core_foundation / [cfbase, cfarray, cfdictionary, cfstring]
import darwin / core_graphics / [cgpath, cgcontext, cggeometry]

type
    CTFrame* = ptr object of CFObject

    CTFrameProgression* {.size: sizeof(uint32).} = enum
        kCTFrameProgressionTopToBottom = 0
        kCTFrameProgressionRightToLeft = 1
        kCTFrameProgressionLeftToRight = 2

    CTFramePathFillRule* {.size: sizeof(uint32).} = enum
        kCTFramePathFillEvenOdd = 0
        kCTFramePathFillWindingNumber = 1

    CTLine* = ptr object of CFObject

proc CTFrameGetTypeID*(): CFTypeID {.importc.}

proc getStringRange*(frame: CTFrame): CFRange {.importc: "CTFrameGetStringRange".}
proc getVisibleStringRange*(frame: CTFrame): CFRange {.importc: "CTFrameGetVisibleStringRange".}
proc getPath*(frame: CTFrame): CGPath {.importc: "CTFrameGetPath".}
proc getFrameAttributes*(frame: CTFrame): CFDictionary {.importc: "CTFrameGetFrameAttributes".}
proc getLines*(frame: CTFrame): CFArray[CTLine] {.importc: "CTFrameGetLines".}
proc getLineOrigins*(frame: CTFrame, range: CFRange, origins: ptr CGPoint) {.importc: "CTFrameGetLineOrigins".}
proc draw*(frame: CTFrame, context: CGContext) {.importc: "CTFrameDraw".}

var
    kCTFrameProgressionAttributeName* {.importc.}: CFString
    kCTFramePathFillRuleAttributeName* {.importc.}: CFString
    kCTFramePathWidthAttributeName* {.importc.}: CFString
    kCTFrameClippingPathsAttributeName* {.importc.}: CFString
    kCTFramePathClippingPathAttributeName* {.importc.}: CFString
