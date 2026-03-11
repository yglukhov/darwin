import darwin / core_foundation / [cfbase, cfdictionary, cfattributedstring, cfarray]
import darwin / core_graphics / [cgpath, cggeometry]
import ctframe, cttypesetter

type
    CTFramesetter* = ptr object of CFObject

proc CTFramesetterGetTypeID*(): CFTypeID {.importc.}

proc CTFramesetterCreateWithTypesetter*(typesetter: CTTypesetter): CTFramesetter {.importc.}
proc CTFramesetterCreateWithAttributedString*(attrString: CFAttributedString): CTFramesetter {.importc.}

proc createFrame*(framesetter: CTFramesetter, stringRange: CFRange, path: CGPath, frameAttributes: CFDictionary): CTFrame {.importc: "CTFramesetterCreateFrame".}
proc getTypesetter*(framesetter: CTFramesetter): CTTypesetter {.importc: "CTFramesetterGetTypesetter".}
proc suggestFrameSizeWithConstraints*(framesetter: CTFramesetter, stringRange: CFRange, frameAttributes: CFDictionary, constraints: CGSize, fitRange: ptr CFRange): CGSize {.importc: "CTFramesetterSuggestFrameSizeWithConstraints".}
