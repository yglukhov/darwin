import darwin / core_foundation / [cfbase, cfcharacterset]
import darwin / core_graphics / [cggeometry, cgaffine_transform, cgfont]

import ctfont_descriptor
export CTFontDescriptor, CTFontOrientation, CTFontSymbolicTraits, CFCharacterSet

type
    CTFont* = ptr object of CFObject
    CTFontUIFontType* {.size: sizeof(uint32).} = enum
        kCTFontUIFontNone = 0xFFFFFFFF'u32
        kCTFontUIFontUser = 0
        kCTFontUIFontUserFixedPitch = 1
        kCTFontUIFontSystem = 2
        kCTFontUIFontEmphasizedSystem = 3
        kCTFontUIFontSmallSystem = 4
        kCTFontUIFontSmallEmphasizedSystem = 5
        kCTFontUIFontMiniSystem = 6
        kCTFontUIFontMiniEmphasizedSystem = 7
        kCTFontUIFontViews = 8
        kCTFontUIFontApplication = 9
        kCTFontUIFontLabel = 10
        kCTFontUIFontMenuTitle = 11
        kCTFontUIFontMenuItem = 12
        kCTFontUIFontMenuItemMark = 13
        kCTFontUIFontMenuItemCmdKey = 14
        kCTFontUIFontWindowTitle = 15
        kCTFontUIFontPushButton = 16
        kCTFontUIFontUtilityWindowTitle = 17
        kCTFontUIFontAlertHeader = 18
        kCTFontUIFontSystemDetail = 19
        kCTFontUIFontEmphasizedSystemDetail = 20
        kCTFontUIFontToolbar = 21
        kCTFontUIFontSmallToolbar = 22
        kCTFontUIFontMessage = 23
        kCTFontUIFontPalette = 24
        kCTFontUIFontToolTip = 25
        kCTFontUIFontControlContent = 26

    CTFontOptions* {.size: sizeof(CFOptionFlags).} = enum
        kCTFontOptionsDefault = 0
        kCTFontOptionsPreventAutoActivation = 1 shl 0
        kCTFontOptionsPreventAutoDownload = 1 shl 1
        kCTFontOptionsPreferSystemFont = 1 shl 2

proc CTFontCreateWithName*(name: CFString, size: CGFloat, matrix: ptr CGAffineTransform): CTFont {.importc.}
proc CTFontCreateWithFontDescriptor*(descriptor: CTFontDescriptor, size: CGFloat, matrix: ptr CGAffineTransform): CTFont {.importc.}
proc CTFontCreateWithNameAndOptions*(name: CFString, size: CGFloat, matrix: ptr CGAffineTransform, options: CTFontOptions): CTFont {.importc.}
proc CTFontCreateWithFontDescriptorAndOptions*(descriptor: CTFontDescriptor, size: CGFloat, matrix: ptr CGAffineTransform, options: CTFontOptions): CTFont {.importc.}
proc CTFontCreateUIFontForLanguage*(uiType: CTFontUIFontType, size: CGFloat, language: CFString): CTFont {.importc.}
proc createCopyWithAttributes*(font: CTFont, size: CGFloat, matrix: ptr CGAffineTransform, attributes: CTFontDescriptor): CTFont {.importc: "CTFontCreateCopyWithAttributes".}
proc createCopyWithSymbolicTraits*(font: CTFont, size: CGFloat, matrix: ptr CGAffineTransform, symTraitValue: CTFontSymbolicTraits, symTraitMask: CTFontSymbolicTraits): CTFont {.importc: "CTFontCreateCopyWithSymbolicTraits".}
proc createCopyWithFamily*(font: CTFont, size: CGFloat, matrix: ptr CGAffineTransform, family: CFString): CTFont {.importc: "CTFontCreateCopyWithFamily".}

proc copyFontDescriptor*(font: CTFont): CTFontDescriptor {.importc: "CTFontCopyFontDescriptor".}
proc copyAttribute*(font: CTFont, attribute: CFString): CFObject {.importc: "CTFontCopyAttribute".}
proc getSize*(font: CTFont): CGFloat {.importc: "CTFontGetSize".}
proc getMatrix*(font: CTFont): CGAffineTransform {.importc: "CTFontGetMatrix".}
proc getSymbolicTraits*(font: CTFont): CTFontSymbolicTraits {.importc: "CTFontGetSymbolicTraits".}

proc copyPostScriptName*(font: CTFont): CFString {.importc: "CTFontCopyPostScriptName".}
proc copyFamilyName*(font: CTFont): CFString {.importc: "CTFontCopyFamilyName".}
proc copyFullName*(font: CTFont): CFString {.importc: "CTFontCopyFullName".}
proc copyDisplayName*(font: CTFont): CFString {.importc: "CTFontCopyDisplayName".}

proc copyCharacterSet*(font: CTFont): CFCharacterSet {.importc: "CTFontCopyCharacterSet".}
proc getGlyphsForCharacters*(font: CTFont, characters: ptr UniChar, glyphs: ptr CGGlyph, count: CFIndex): bool {.importc: "CTFontGetGlyphsForCharacters".}

proc getAscent*(font: CTFont): CGFloat {.importc: "CTFontGetAscent".}
proc getDescent*(font: CTFont): CGFloat {.importc: "CTFontGetDescent".}
proc getLeading*(font: CTFont): CGFloat {.importc: "CTFontGetLeading".}
proc getUnitsPerEm*(font: CTFont): cuint {.importc: "CTFontGetUnitsPerEm".}
proc getGlyphCount*(font: CTFont): CFIndex {.importc: "CTFontGetGlyphCount".}
proc getBoundingBox*(font: CTFont): CGRect {.importc: "CTFontGetBoundingBox".}
proc getUnderlinePosition*(font: CTFont): CGFloat {.importc: "CTFontGetUnderlinePosition".}
proc getUnderlineThickness*(font: CTFont): CGFloat {.importc: "CTFontGetUnderlineThickness".}
proc getSlantAngle*(font: CTFont): CGFloat {.importc: "CTFontGetSlantAngle".}
proc getCapHeight*(font: CTFont): CGFloat {.importc: "CTFontGetCapHeight".}
proc getXHeight*(font: CTFont): CGFloat {.importc: "CTFontGetXHeight".}

proc getGlyphWithName*(font: CTFont, glyphName: CFString): CGGlyph {.importc: "CTFontGetGlyphWithName".}
proc getBoundingRectsForGlyphs*(font: CTFont, orientation: CTFontOrientation, glyphs: ptr CGGlyph, boundingRects: ptr CGRect, count: CFIndex): CGRect {.importc: "CTFontGetBoundingRectsForGlyphs".}
proc getAdvancesForGlyphs*(font: CTFont, orientation: CTFontOrientation, glyphs: ptr CGGlyph, advances: ptr CGSize, count: CFIndex): cdouble {.importc: "CTFontGetAdvancesForGlyphs".}
proc getVerticalTranslationsForGlyphs*(font: CTFont, glyphs: ptr CGGlyph, translations: ptr CGSize, count: CFIndex) {.importc: "CTFontGetVerticalTranslationsForGlyphs".}

proc copyGraphicsFont*(font: CTFont, attributes: ptr CTFontDescriptor): CGFont {.importc: "CTFontCopyGraphicsFont".}

var
    kCTFontCopyrightNameKey* {.importc.}: CFString
    kCTFontFamilyNameKey* {.importc.}: CFString
    kCTFontSubFamilyNameKey* {.importc.}: CFString
    kCTFontStyleNameKey* {.importc.}: CFString
    kCTFontUniqueNameKey* {.importc.}: CFString
    kCTFontFullNameKey* {.importc.}: CFString
    kCTFontVersionNameKey* {.importc.}: CFString
    kCTFontPostScriptNameKey* {.importc.}: CFString
    kCTFontTrademarkNameKey* {.importc.}: CFString
    kCTFontManufacturerNameKey* {.importc.}: CFString
    kCTFontDesignerNameKey* {.importc.}: CFString
    kCTFontDescriptionNameKey* {.importc.}: CFString
    kCTFontVendorURLNameKey* {.importc.}: CFString
    kCTFontDesignerURLNameKey* {.importc.}: CFString
    kCTFontLicenseNameKey* {.importc.}: CFString
    kCTFontLicenseURLNameKey* {.importc.}: CFString
    kCTFontSampleTextNameKey* {.importc.}: CFString
    kCTFontPostScriptCIDNameKey* {.importc.}: CFString
