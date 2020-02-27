import cfbase, cfarray

export CFString, CFMutableString

type
    CFStringEncoding* = distinct uint32

const
    kCFStringEncodingInvalidId* = CFStringEncoding(0xffffffff'u32)
    kCFStringEncodingMacRoman* = CFStringEncoding(0'u32)
    kCFStringEncodingWindowsLatin1* = CFStringEncoding(0x0500'u32)
    kCFStringEncodingISOLatin1* = CFStringEncoding(0x0201'u32)
    kCFStringEncodingNextStepLatin* = CFStringEncoding(0x0B01'u32)
    kCFStringEncodingASCII* = CFStringEncoding(0x0600'u32)
    kCFStringEncodingUnicode* = CFStringEncoding(0x0100'u32)
    kCFStringEncodingUTF8* = CFStringEncoding(0x08000100'u32)
    kCFStringEncodingNonLossyASCII* = CFStringEncoding(0x0BFF'u32)

    kCFStringEncodingUTF16* = CFStringEncoding(0x0100'u32)
    kCFStringEncodingUTF16BE* = CFStringEncoding(0x10000100'u32)
    kCFStringEncodingUTF16LE* = CFStringEncoding(0x14000100'u32)

    kCFStringEncodingUTF32* = CFStringEncoding(0x0c000100'u32)
    kCFStringEncodingUTF32BE* = CFStringEncoding(0x18000100'u32)
    kCFStringEncodingUTF32LE* = CFStringEncoding(0x1c000100'u32)

proc CFStringGetTypeID*(): CFTypeID {.importc.}

proc CFStringCreateWithCString*(alloc: CFAllocator, cStr: cstring, encoding: CFStringEncoding): CFString {.importc.}
proc CFStringCreateWithBytes*(alloc: CFAllocator, bytes: pointer, numBytes: CFIndex, encoding: CFStringEncoding, isExternalRepresentation: Boolean): CFString {.importc.}
proc CFStringCreateWithCharacters*(alloc: CFAllocator, chars: ptr UniChar, numChars: CFIndex): CFString {.importc.}

proc CFStringCreate*(cStr: cstring, encoding: CFStringEncoding): CFString {.inline.} = CFStringCreateWithCString(kCFAllocatorDefault, cStr, encoding)
proc CFStringCreate*(bytes: pointer, numBytes: CFIndex, encoding: CFStringEncoding, isExternalRepresentation: bool): CFString {.inline.} = CFStringCreateWithBytes(kCFAllocatorDefault, bytes, numBytes, encoding, toBoolean(isExternalRepresentation))
proc CFStringCreate*(chars: ptr UniChar, numChars: CFIndex): CFString {.inline.} = CFStringCreateWithCharacters(kCFAllocatorDefault, chars, numChars)
proc CFStringCreate*(s: string): CFString {.inline.} = CFStringCreate(s, kCFStringEncodingUTF8)

proc CFStringCreateWithCStringNoCopy*(alloc: CFAllocator, cStr: cstring, encoding: CFStringEncoding, contentsDeallocator: CFAllocator): CFString {.importc.}
proc CFStringCreateWithBytesNoCopy*(alloc: CFAllocator, bytes: pointer, numBytes: CFIndex, encoding: CFStringEncoding, isExternalRepresentation: Boolean, contentsDeallocator: CFAllocator): CFString {.importc.}
proc CFStringCreateWithCharactersNoCopy*(alloc: CFAllocator, chars: ptr UniChar, numChars: CFIndex, contentsDeallocator: CFAllocator): CFString {.importc.}

proc CFStringCreateWithSubstring*(alloc: CFAllocator, str: CFString, rng: CFRange): CFString {.importc.}
proc CFStringCreateCopy*(alloc: CFAllocator, theString: CFString): CFString {.importc.}

proc CFStringCreateMutable*(alloc: CFAllocator, maxLength: CFIndex): CFMutableString {.importc.}
proc CFStringCreateMutableCopy*(alloc: CFAllocator, maxLength: CFIndex, theString: CFString): CFMutableString {.importc.}

proc len*(theString: CFString): CFIndex {.importc: "CFStringGetLength".}

proc getCharacterAtIndex*(theString: CFString, idx: CFIndex): UniChar {.importc: "CFStringGetCharacterAtIndex".}
proc getCharacters*(theString: CFString, rng: CFRange, buffer: ptr UniChar): UniChar {.importc: "CFStringGetCharacters".}

proc getCString*(theString: CFString, buffer: cstring, bufferSize: CFIndex, encoding: CFStringEncoding): Boolean {.importc: "CFStringGetCString".}

proc getCStringPtr*(theString: CFString, encoding: CFStringEncoding): cstring {.importc: "CFStringGetCStringPtr".}
proc getCharactersPtr*(theString: CFString): cstring {.importc: "CFStringGetCharactersPtr".}
proc getBytes*(theString: CFString, rng: CFRange, encoding: CFStringEncoding, lossByte: char, isExternalRepresentation: bool, buffer: pointer, maxBufLen: CFIndex, usedBufLen: ptr CFIndex): CFIndex {.importc: "CFStringGetBytes".}


proc getIntValue*(theString: CFString): int32 {.importc: "CFStringGetIntValue".}
proc getDoubleValue*(theString: CFString): cdouble {.importc: "CFStringGetDoubleValue".}

proc append*(theString: CFMutableString, appendedString: CFString) {.importc: "CFStringAppend".}

proc show*(obj: CFObject) {.importc: "CFShow".}
proc show*(obj: CFString) {.importc: "CFShowStr".}

proc `$`*(s: CFString): string =
    var ln: int
    let rng = CFRangeMake(0, s.len)
    discard getBytes(s, rng, kCFStringEncodingUTF8, '?', false, nil, 0, addr ln)
    result = newString(ln)
    if ln != 0:
        discard getBytes(s, rng, kCFStringEncodingUTF8, '?', false, addr(result[0]), ln, nil)
