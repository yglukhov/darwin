import cfbase

export CFString, CFMutableString

type
    CFCharacterSet* = ptr object of CFObject
    CFMutableCharacterSet* = ptr object of CFCharacterSet
    CFData* = ptr object of CFObject

    CFCharacterSetPredefinedSet* {.size: sizeof(CFIndex).} = enum
        kCFCharacterSetControl = 1
        kCFCharacterSetWhitespace
        kCFCharacterSetWhitespaceAndNewline
        kCFCharacterSetDecimalDigit
        kCFCharacterSetLetter
        kCFCharacterSetLowercaseLetter
        kCFCharacterSetUppercaseLetter
        kCFCharacterSetNonBase
        kCFCharacterSetDecomposable
        kCFCharacterSetAlphaNumeric
        kCFCharacterSetPunctuation
        kCFCharacterSetIllegal = 12
        kCFCharacterSetCapitalizedLetter = 13
        kCFCharacterSetSymbol = 14
        kCFCharacterSetNewline = 15

# Type ID
proc CFCharacterSetGetTypeID*(): CFTypeID {.importc.}

# Predefined character sets
proc CFCharacterSetGetPredefined*(theSetIdentifier: CFCharacterSetPredefinedSet): CFCharacterSet {.importc.}

# Creation
proc CFCharacterSetCreateWithCharactersInRange*(alloc: CFAllocator, theRange: CFRange): CFCharacterSet {.importc.}
proc CFCharacterSetCreateWithCharactersInString*(alloc: CFAllocator, theString: CFString): CFCharacterSet {.importc.}
proc CFCharacterSetCreateWithBitmapRepresentation*(alloc: CFAllocator, theData: CFData): CFCharacterSet {.importc.}
proc CFCharacterSetCreateInvertedSet*(alloc: CFAllocator, theSet: CFCharacterSet): CFCharacterSet {.importc.}

# Mutable creation
proc CFCharacterSetCreateMutable*(alloc: CFAllocator): CFMutableCharacterSet {.importc.}
proc CFCharacterSetCreateCopy*(alloc: CFAllocator, theSet: CFCharacterSet): CFCharacterSet {.importc.}
proc CFCharacterSetCreateMutableCopy*(alloc: CFAllocator, theSet: CFCharacterSet): CFMutableCharacterSet {.importc.}

# Query
proc isCharacterMember*(theSet: CFCharacterSet, theChar: UniChar): Boolean {.importc: "CFCharacterSetIsCharacterMember".}
proc isLongCharacterMember*(theSet: CFCharacterSet, theChar: UTF32Char): Boolean {.importc: "CFCharacterSetIsLongCharacterMember".}
proc isSupersetOfSet*(theSet: CFCharacterSet, theOtherset: CFCharacterSet): Boolean {.importc: "CFCharacterSetIsSupersetOfSet".}
proc hasMemberInPlane*(theSet: CFCharacterSet, thePlane: CFIndex): Boolean {.importc: "CFCharacterSetHasMemberInPlane".}

# Bitmap representation
proc CFCharacterSetCreateBitmapRepresentation*(alloc: CFAllocator, theSet: CFCharacterSet): CFData {.importc.}

# Mutable operations
proc addCharactersInRange*(theSet: CFMutableCharacterSet, theRange: CFRange) {.importc: "CFCharacterSetAddCharactersInRange".}
proc removeCharactersInRange*(theSet: CFMutableCharacterSet, theRange: CFRange) {.importc: "CFCharacterSetRemoveCharactersInRange".}
proc addCharactersInString*(theSet: CFMutableCharacterSet, theString: CFString) {.importc: "CFCharacterSetAddCharactersInString".}
proc removeCharactersInString*(theSet: CFMutableCharacterSet, theString: CFString) {.importc: "CFCharacterSetRemoveCharactersInString".}
proc unionWith*(theSet: CFMutableCharacterSet, theOtherSet: CFCharacterSet) {.importc: "CFCharacterSetUnion".}
proc intersectWith*(theSet: CFMutableCharacterSet, theOtherSet: CFCharacterSet) {.importc: "CFCharacterSetIntersect".}
proc invert*(theSet: CFMutableCharacterSet) {.importc: "CFCharacterSetInvert".}
