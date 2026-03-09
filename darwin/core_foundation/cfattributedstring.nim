import cfbase, cfstring, cfdictionary

type
  CFAttributedString* = ptr object of CFObject
  CFMutableAttributedString* = ptr object of CFAttributedString

proc CFAttributedStringGetTypeID*(): CFTypeID {.importc.}

proc CFAttributedStringCreate*(alloc: CFAllocator, str: CFString, attributes: CFDictionary): CFAttributedString {.importc.}
proc CFAttributedStringCreateWithSubstring*(alloc: CFAllocator, aStr: CFAttributedString, range: CFRange): CFAttributedString {.importc.}
proc CFAttributedStringCreateCopy*(alloc: CFAllocator, aStr: CFAttributedString): CFAttributedString {.importc.}

proc getCFString*(aStr: CFAttributedString): CFString {.importc: "CFAttributedStringGetString".}
proc getLength*(aStr: CFAttributedString): CFIndex {.importc: "CFAttributedStringGetLength".}

proc getAttributes*(aStr: CFAttributedString, loc: CFIndex, effectiveRange: ptr CFRange): CFDictionary {.importc: "CFAttributedStringGetAttributes".}
proc getAttribute*(aStr: CFAttributedString, loc: CFIndex, attrName: CFString, effectiveRange: ptr CFRange): CFObject {.importc: "CFAttributedStringGetAttribute".}
proc getAttributesAndLongestEffectiveRange*(aStr: CFAttributedString, loc: CFIndex, inRange: CFRange, longestEffectiveRange: ptr CFRange): CFDictionary {.importc: "CFAttributedStringGetAttributesAndLongestEffectiveRange".}
proc getAttributeAndLongestEffectiveRange*(aStr: CFAttributedString, loc: CFIndex, attrName: CFString, inRange: CFRange, longestEffectiveRange: ptr CFRange): CFObject {.importc: "CFAttributedStringGetAttributeAndLongestEffectiveRange".}

proc CFAttributedStringCreateMutableCopy*(alloc: CFAllocator, maxLength: CFIndex, aStr: CFAttributedString): CFMutableAttributedString {.importc.}
proc CFAttributedStringCreateMutable*(alloc: CFAllocator, maxLength: CFIndex): CFMutableAttributedString {.importc.}

proc replaceString*(aStr: CFMutableAttributedString, range: CFRange, replacement: CFString) {.importc: "CFAttributedStringReplaceString".}
proc getMutableString*(aStr: CFMutableAttributedString): CFMutableString {.importc: "CFAttributedStringGetMutableString".}
proc setAttributes*(aStr: CFMutableAttributedString, range: CFRange, replacement: CFDictionary, clearOtherAttributes: Boolean) {.importc: "CFAttributedStringSetAttributes".}
proc setAttribute*(aStr: CFMutableAttributedString, range: CFRange, attrName: CFString, value: CFObject) {.importc: "CFAttributedStringSetAttribute".}
proc removeAttribute*(aStr: CFMutableAttributedString, range: CFRange, attrName: CFString) {.importc: "CFAttributedStringRemoveAttribute".}
proc replaceAttributedString*(aStr: CFMutableAttributedString, range: CFRange, replacement: CFAttributedString) {.importc: "CFAttributedStringReplaceAttributedString".}
proc beginEditing*(aStr: CFMutableAttributedString) {.importc: "CFAttributedStringBeginEditing".}
proc endEditing*(aStr: CFMutableAttributedString) {.importc: "CFAttributedStringEndEditing".}
