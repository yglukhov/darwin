import darwin / core_foundation / [cfbase]
import cgfont, cggeometry, cgaffine_transform

type
    CGContext* = ptr object of CFObject

proc setFont*(c: CGContext, font: CGFont) {.importc: "CGContextSetFont".}
proc setFontSize*(c: CGContext, size: CGFloat) {.importc: "CGContextSetFontSize".}

proc setTextPosition*(c: CGContext, x, y: CGFloat) {.importc: "CGContextSetTextPosition".}
proc getTextPosition*(c: CGContext): CGPoint {.importc: "CGContextGetTextPosition".}

proc setGrayFillColor*(c: CGContext, gray, alpha: CGFloat) {.importc: "CGContextSetGrayFillColor".}
proc setGrayStrokeColor*(c: CGContext, gray, alpha: CGFloat) {.importc: "CGContextSetGrayStrokeColor".}

proc setRGBFillColor*(c: CGContext, r, g, b, a: CGFloat) {.importc: "CGContextSetRGBFillColor".}
proc setRGBStrokeColor*(c: CGContext, r, g, b, a: CGFloat) {.importc: "CGContextSetRGBStrokeColor".}

proc setCMYKFillColor*(c: CGContext, cy, m, y, k, a: CGFloat) {.importc: "CGContextSetCMYKFillColor".}
proc setCMYKStrokeColor*(c: CGContext, cy, m, y, k, a: CGFloat) {.importc: "CGContextSetCMYKStrokeColor".}

proc showGlyphsAtPositions*(c: CGContext, glyphs: ptr CGGlyph, positions: ptr CGPoint, count: csize) {.importc: "CGContextShowGlyphsAtPositions".}

proc scaleCTM*(c: CGContext, sx, sy: CGFloat) {.importc: "CGContextScaleCTM".}
proc translateCTM*(c: CGContext, tx, ty: CGFloat) {.importc: "CGContextTranslateCTM".}
proc rotateCTM*(c: CGContext, angle: CGFloat) {.importc: "CGContextRotateCTM".}
proc concatCTM*(c: CGContext, transform: CGAffineTransform) {.importc: "CGContextConcatCTM".}
proc getCTM*(c: CGContext): CGAffineTransform {.importc: "CGContextGetCTM".}
