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
proc CFCharacterSetIsCharacterMember*(theSet: CFCharacterSet, theChar: UniChar): Boolean {.importc.}
proc CFCharacterSetIsLongCharacterMember*(theSet: CFCharacterSet, theChar: UTF32Char): Boolean {.importc.}
proc CFCharacterSetIsSupersetOfSet*(theSet: CFCharacterSet, theOtherset: CFCharacterSet): Boolean {.importc.}
proc CFCharacterSetHasMemberInPlane*(theSet: CFCharacterSet, thePlane: CFIndex): Boolean {.importc.}

# Bitmap representation
proc CFCharacterSetCreateBitmapRepresentation*(alloc: CFAllocator, theSet: CFCharacterSet): CFData {.importc.}

# Mutable operations
proc CFCharacterSetAddCharactersInRange*(theSet: CFMutableCharacterSet, theRange: CFRange) {.importc.}
proc CFCharacterSetRemoveCharactersInRange*(theSet: CFMutableCharacterSet, theRange: CFRange) {.importc.}
proc CFCharacterSetAddCharactersInString*(theSet: CFMutableCharacterSet, theString: CFString) {.importc.}
proc CFCharacterSetRemoveCharactersInString*(theSet: CFMutableCharacterSet, theString: CFString) {.importc.}
proc CFCharacterSetUnion*(theSet: CFMutableCharacterSet, theOtherSet: CFCharacterSet) {.importc.}
proc CFCharacterSetIntersect*(theSet: CFMutableCharacterSet, theOtherSet: CFCharacterSet) {.importc.}
proc CFCharacterSetInvert*(theSet: CFMutableCharacterSet) {.importc.}
