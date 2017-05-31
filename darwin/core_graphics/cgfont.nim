import darwin / core_foundation / [cfbase, cfstring]
import cggeometry

type
    CGFont* = ptr object of CFObject
    CGFontIndex* = distinct uint16
    CGGlyph* = distinct CGFontIndex

proc CGFontCreateWithFontName*(name: CFString): CGFont {.importc.}
proc getGlyphAdvances*(font: CGFont, glyphs: ptr CGGlyph, count: csize, advances: ptr cint): bool {.importc: "CGFontGetGlyphAdvances".}
proc getGlyphBBoxes*(font: CGFont, glyphs: ptr CGGlyph, count: csize, bboxes: ptr CGRect): bool {.importc: "CGFontGetGlyphBBoxes".}

proc getAscent*(font: CGFont): cint {.importc: "CGFontGetAscent".}
proc getDescent*(font: CGFont): cint {.importc: "CGFontGetDescent".}
