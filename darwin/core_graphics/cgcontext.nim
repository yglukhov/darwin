import darwin / core_foundation / [cfbase]
import cgfont, cggeometry, cgaffine_transform

type
    CGContext* = ptr object of CFObject

    CGTextDrawingMode* {.size: sizeof(int32).} = enum
        kCGTextFill = 0
        kCGTextStroke = 1
        kCGTextFillStroke = 2
        kCGTextInvisible = 3
        kCGTextFillClip = 4
        kCGTextStrokeClip = 5
        kCGTextFillStrokeClip = 6
        kCGTextClip = 7

    CGTextEncoding* {.size: sizeof(int32).} = enum
        kCGEncodingFontSpecific = 0
        kCGEncodingMacRoman = 1

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

proc showGlyphsAtPositions*(c: CGContext, glyphs: ptr CGGlyph, positions: ptr CGPoint, count: csize_t) {.importc: "CGContextShowGlyphsAtPositions".}

proc fillRect*(c: CGContext, rect: CGRect) {.importc: "CGContextFillRect".}

proc scaleCTM*(c: CGContext, sx, sy: CGFloat) {.importc: "CGContextScaleCTM".}
proc translateCTM*(c: CGContext, tx, ty: CGFloat) {.importc: "CGContextTranslateCTM".}
proc rotateCTM*(c: CGContext, angle: CGFloat) {.importc: "CGContextRotateCTM".}
proc concatCTM*(c: CGContext, transform: CGAffineTransform) {.importc: "CGContextConcatCTM".}
proc getCTM*(c: CGContext): CGAffineTransform {.importc: "CGContextGetCTM".}

# Retain/Release
proc retain*(c: CGContext): CGContext {.importc: "CGContextRetain".}
proc release*(c: CGContext) {.importc: "CGContextRelease".}

# Graphics State
proc saveGState*(c: CGContext) {.importc: "CGContextSaveGState".}
proc restoreGState*(c: CGContext) {.importc: "CGContextRestoreGState".}

# PDF Drawing - forward declaration
proc drawPDFPage*(c: CGContext, page: pointer) {.importc: "CGContextDrawPDFPage".}

# Text (deprecated but still useful for simple PDF text)
proc selectFont*(c: CGContext, name: cstring, size: CGFloat, textEncoding: CGTextEncoding) {.importc: "CGContextSelectFont".}
proc setTextDrawingMode*(c: CGContext, mode: CGTextDrawingMode) {.importc: "CGContextSetTextDrawingMode".}
proc showTextAtPoint*(c: CGContext, x, y: CGFloat, string: cstring, length: csize_t) {.importc: "CGContextShowTextAtPoint".}
