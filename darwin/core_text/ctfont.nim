import darwin / core_foundation / [cfbase]
import darwin / core_graphics / [cggeometry, cgaffine_transform, cgfont]

import ctfont_descriptor

type
    CTFont* = ptr object of CFObject

proc CTFontCreateWithName*(name: CFString, size: CGFloat, transform: ptr CGAffineTransform): CTFont {.importc.}
proc getGlyphsForCharacters*(font: CTFont, characters: ptr UniChar, glyphs: ptr CGGlyph, count: CFIndex): bool {.importc: "CTFontGetGlyphsForCharacters".}

proc getAscent*(font: CTFont): CGFloat {.importc: "CTFontGetAscent".}
proc getDescent*(font: CTFont): CGFloat {.importc: "CTFontGetDescent".}
proc getSize*(font: CTFont): CGFloat {.importc: "CTFontGetSize".}

proc getBoundingRectsForGlyphs*(font: CTFont, orientation: CTFontOrientation, glyphs: ptr CGGlyph, boundingRects: ptr CGRect, count: CFIndex): CGRect {.importc: "CTFontGetBoundingRectsForGlyphs".}

proc getAdvancesForGlyphs*(font: CTFont, orientation: CTFontOrientation, glyphs: ptr CGGlyph, advances: ptr CGSize, count: CFIndex): cdouble {.importc: "CTFontGetAdvancesForGlyphs".}

proc copyGraphicsFont*(font: CTFont, attributes: CTFontDescriptor): CGFont {.importc: "CTFontCopyGraphicsFont".}
