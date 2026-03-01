import darwin / core_foundation / [cfbase, cfdictionary, cfstring, cfarray, cfcharacterset]
import darwin / core_graphics / [cggeometry]

type
    CTFontDescriptor* = ptr object of CFObject
    CTFontOrientation* {.size: sizeof(uint32).} = enum
        kCTFontOrientationDefault = 0
        kCTFontOrientationHorizontal = 1
        kCTFontOrientationVertical = 2
    CTFontSymbolicTraits* = uint32
    CTFontFormat* {.size: sizeof(uint32).} = enum
        kCTFontFormatUnrecognized = 0
        kCTFontFormatOpenTypePostScript = 1
        kCTFontFormatOpenTypeTrueType = 2
        kCTFontFormatTrueType = 3
        kCTFontFormatPostScript = 4
        kCTFontFormatBitmap = 5
    CTFontPriority* = uint32

const
    kCTFontPrioritySystem* = 10000.CTFontPriority
    kCTFontPriorityNetwork* = 20000.CTFontPriority
    kCTFontPriorityComputer* = 30000.CTFontPriority
    kCTFontPriorityUser* = 40000.CTFontPriority
    kCTFontPriorityDynamic* = 50000.CTFontPriority
    kCTFontPriorityProcess* = 60000.CTFontPriority

const
    kCTFontTraitItalic* = CTFontSymbolicTraits(1 shl 0)
    kCTFontTraitBold* = CTFontSymbolicTraits(1 shl 1)
    kCTFontTraitExpanded* = CTFontSymbolicTraits(1 shl 5)
    kCTFontTraitCondensed* = CTFontSymbolicTraits(1 shl 6)
    kCTFontTraitMonoSpace* = CTFontSymbolicTraits(1 shl 10)
    kCTFontTraitVertical* = CTFontSymbolicTraits(1 shl 11)
    kCTFontTraitUIOptimized* = CTFontSymbolicTraits(1 shl 12)
    kCTFontTraitColorGlyphs* = CTFontSymbolicTraits(1 shl 13)
    kCTFontTraitComposite* = CTFontSymbolicTraits(1 shl 14)

    kCTFontClassMaskShift* = 28
    kCTFontTraitClassMask* = CTFontSymbolicTraits(15u32 shl kCTFontClassMaskShift)

    kCTFontItalicTrait* = kCTFontTraitItalic
    kCTFontBoldTrait* = kCTFontTraitBold
    kCTFontExpandedTrait* = kCTFontTraitExpanded
    kCTFontCondensedTrait* = kCTFontTraitCondensed
    kCTFontMonoSpaceTrait* = kCTFontTraitMonoSpace
    kCTFontVerticalTrait* = kCTFontTraitVertical
    kCTFontUIOptimizedTrait* = kCTFontTraitUIOptimized
    kCTFontColorGlyphsTrait* = kCTFontTraitColorGlyphs
    kCTFontCompositeTrait* = kCTFontTraitComposite
    kCTFontClassMaskTrait* = kCTFontTraitClassMask

const
    kCTFontClassUnknown* = CTFontSymbolicTraits(0 shl kCTFontClassMaskShift)
    kCTFontClassOldStyleSerifs* = CTFontSymbolicTraits(1 shl kCTFontClassMaskShift)
    kCTFontClassTransitionalSerifs* = CTFontSymbolicTraits(2 shl kCTFontClassMaskShift)
    kCTFontClassModernSerifs* = CTFontSymbolicTraits(3 shl kCTFontClassMaskShift)
    kCTFontClassClarendonSerifs* = CTFontSymbolicTraits(4 shl kCTFontClassMaskShift)
    kCTFontClassSlabSerifs* = CTFontSymbolicTraits(5 shl kCTFontClassMaskShift)
    kCTFontClassFreeformSerifs* = CTFontSymbolicTraits(7 shl kCTFontClassMaskShift)
    kCTFontClassSansSerif* = CTFontSymbolicTraits(8u32 shl kCTFontClassMaskShift)
    kCTFontClassOrnamentals* = CTFontSymbolicTraits(9u32 shl kCTFontClassMaskShift)
    kCTFontClassScripts* = CTFontSymbolicTraits(10u32 shl kCTFontClassMaskShift)
    kCTFontClassSymbolic* = CTFontSymbolicTraits(12u32 shl kCTFontClassMaskShift)

    kCTFontUnknownClass* = kCTFontClassUnknown
    kCTFontOldStyleSerifsClass* = kCTFontClassOldStyleSerifs
    kCTFontTransitionalSerifsClass* = kCTFontClassTransitionalSerifs
    kCTFontModernSerifsClass* = kCTFontClassModernSerifs
    kCTFontClarendonSerifsClass* = kCTFontClassClarendonSerifs
    kCTFontSlabSerifsClass* = kCTFontClassSlabSerifs
    kCTFontFreeformSerifsClass* = kCTFontClassFreeformSerifs
    kCTFontSansSerifClass* = kCTFontClassSansSerif
    kCTFontOrnamentalsClass* = kCTFontClassOrnamentals
    kCTFontScriptsClass* = kCTFontClassScripts
    kCTFontSymbolicClass* = kCTFontClassSymbolic

proc CTFontDescriptorCreateWithNameAndSize*(name: CFString, size: CGFloat): CTFontDescriptor {.importc.}
proc CTFontDescriptorCreateWithAttributes*(attributes: CFDictionary): CTFontDescriptor {.importc.}
proc createCopyWithAttributes*(original: CTFontDescriptor, attributes: CFDictionary): CTFontDescriptor {.importc: "CTFontDescriptorCreateCopyWithAttributes".}
proc createCopyWithFamily*(original: CTFontDescriptor, family: CFString): CTFontDescriptor {.importc: "CTFontDescriptorCreateCopyWithFamily".}
proc createCopyWithSymbolicTraits*(original: CTFontDescriptor, symTraitValue: CTFontSymbolicTraits, symTraitMask: CTFontSymbolicTraits): CTFontDescriptor {.importc: "CTFontDescriptorCreateCopyWithSymbolicTraits".}

proc copyAttributes*(descriptor: CTFontDescriptor): CFDictionary {.importc: "CTFontDescriptorCopyAttributes".}
proc copyAttribute*(descriptor: CTFontDescriptor, attribute: CFString): CFObject {.importc: "CTFontDescriptorCopyAttribute".}
proc copyLocalizedAttribute*(descriptor: CTFontDescriptor, attribute: CFString, language: ptr CFString): CFObject {.importc: "CTFontDescriptorCopyLocalizedAttribute".}

proc createMatchingFontDescriptors*(descriptor: CTFontDescriptor, mandatoryAttributes: CFArray): CFArray {.importc: "CTFontDescriptorCreateMatchingFontDescriptors".}
proc createMatchingFontDescriptor*(descriptor: CTFontDescriptor, mandatoryAttributes: CFArray): CTFontDescriptor {.importc: "CTFontDescriptorCreateMatchingFontDescriptor".}

var
    kCTFontURLAttribute* {.importc.}: CFString
    kCTFontNameAttribute* {.importc.}: CFString
    kCTFontDisplayNameAttribute* {.importc.}: CFString
    kCTFontFamilyNameAttribute* {.importc.}: CFString
    kCTFontStyleNameAttribute* {.importc.}: CFString
    kCTFontTraitsAttribute* {.importc.}: CFString
    kCTFontVariationAttribute* {.importc.}: CFString
    kCTFontSizeAttribute* {.importc.}: CFString
    kCTFontMatrixAttribute* {.importc.}: CFString
    kCTFontCascadeListAttribute* {.importc.}: CFString
    kCTFontCharacterSetAttribute* {.importc.}: CFString
    kCTFontLanguagesAttribute* {.importc.}: CFString
    kCTFontBaselineAdjustAttribute* {.importc.}: CFString
    kCTFontMacintoshEncodingsAttribute* {.importc.}: CFString
    kCTFontFeaturesAttribute* {.importc.}: CFString
    kCTFontFeatureSettingsAttribute* {.importc.}: CFString
    kCTFontFixedAdvanceAttribute* {.importc.}: CFString
    kCTFontOrientationAttribute* {.importc.}: CFString
    kCTFontFormatAttribute* {.importc.}: CFString
    kCTFontRegistrationScopeAttribute* {.importc.}: CFString
    kCTFontPriorityAttribute* {.importc.}: CFString
    kCTFontEnabledAttribute* {.importc.}: CFString
