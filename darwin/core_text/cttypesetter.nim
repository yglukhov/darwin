import darwin / core_foundation / [cfbase, cfdictionary, cfattributedstring, cfstring]
import ctframe

type
    CTTypesetter* = ptr object of CFObject

proc CTTypesetterGetTypeID*(): CFTypeID {.importc.}

proc CTTypesetterCreateWithAttributedString*(string: CFAttributedString): CTTypesetter {.importc.}
proc CTTypesetterCreateWithAttributedStringAndOptions*(string: CFAttributedString, options: CFDictionary): CTTypesetter {.importc.}

proc createLine*(typesetter: CTTypesetter, stringRange: CFRange): CTLine {.importc: "CTTypesetterCreateLine".}
proc createLineWithOffset*(typesetter: CTTypesetter, stringRange: CFRange, offset: cdouble): CTLine {.importc: "CTTypesetterCreateLineWithOffset".}

proc suggestLineBreak*(typesetter: CTTypesetter, startIndex: CFIndex, width: cdouble): CFIndex {.importc: "CTTypesetterSuggestLineBreak".}
proc suggestLineBreakWithOffset*(typesetter: CTTypesetter, startIndex: CFIndex, width, offset: cdouble): CFIndex {.importc: "CTTypesetterSuggestLineBreakWithOffset".}
proc suggestClusterBreak*(typesetter: CTTypesetter, startIndex: CFIndex, width: cdouble): CFIndex {.importc: "CTTypesetterSuggestClusterBreak".}
proc suggestClusterBreakWithOffset*(typesetter: CTTypesetter, startIndex: CFIndex, width, offset: cdouble): CFIndex {.importc: "CTTypesetterSuggestClusterBreakWithOffset".}

var
    kCTTypesetterOptionAllowUnboundedLayout* {.importc.}: CFString
    kCTTypesetterOptionDisableBidiProcessing* {.importc.}: CFString
    kCTTypesetterOptionForcedEmbeddingLevel* {.importc.}: CFString
