# AI Rules for Darwin Bindings

This document describes the coding conventions and rules for creating Nim bindings for Apple frameworks in the `darwin` project.

## Naming Conventions

### 1. Core Foundation (C API) Bindings

#### Type Naming
- Types are defined as `ptr object of ParentType`
- Use the original CF type names without the `Ref` suffix

```nim
type
  CFAttributedString* = ptr object of CFObject
  CFMutableAttributedString* = ptr object of CFAttributedString
```

#### Function Naming

**Rule 1: Use concise naming when the first parameter is the module's primary type**

When a function takes the main type as its first parameter, use a concise name (without the CF prefix).

```nim
# Good - first param is CFAttributedString, use concise naming
proc getCFString*(aStr: CFAttributedString): CFString {.importc: "CFAttributedStringGetString".}
proc getLength*(aStr: CFAttributedString): CFIndex {.importc: "CFAttributedStringGetLength".}
proc getAttributes*(aStr: CFAttributedString, ...): CFDictionary {.importc: "CFAttributedStringGetAttributes".}
proc replaceString*(aStr: CFMutableAttributedString, ...) {.importc: "CFAttributedStringReplaceString".}
proc beginEditing*(aStr: CFMutableAttributedString) {.importc: "CFAttributedStringBeginEditing".}
```

**Rule 2: Use original C names for object creation functions**

Functions that create new objects should keep their original C names.

```nim
# Good - creation functions keep original names
proc CFAttributedStringCreate*(alloc: CFAllocator, ...): CFAttributedString {.importc.}
proc CFAttributedStringCreateMutable*(alloc: CFAllocator, ...): CFMutableAttributedString {.importc.}
proc CFAttributedStringCreateCopy*(alloc: CFAllocator, ...): CFAttributedString {.importc.}
```

**Rule 3: Use original C names for global functions without parameters**

```nim
# Good - global functions keep original names
proc CFAttributedStringGetTypeID*(): CFTypeID {.importc.}
```

**Rule 4: Avoid naming conflicts with Nim standard library**

When concise naming would conflict with Nim's standard library (like `len`, `string`), use more explicit names:

```nim
# Bad - conflicts with Nim's len() and string type
proc len*(aStr: CFAttributedString): CFIndex {.importc: "CFAttributedStringGetLength".}
proc string*(aStr: CFAttributedString): CFString {.importc: "CFAttributedStringGetString".}

# Good - explicit names avoiding conflicts
proc getLength*(aStr: CFAttributedString): CFIndex {.importc: "CFAttributedStringGetLength".}
proc getCFString*(aStr: CFAttributedString): CFString {.importc: "CFAttributedStringGetString".}
```

### 2. Foundation/AppKit (Objective-C) Bindings

#### Type Naming
- Types are defined as `ptr object of NSObject`

```nim
type
  NSAttributedString* = ptr object of NSObject
  NSMutableAttributedString* = ptr object of NSAttributedString
```

#### Method Naming

Use `{.objc.}` pragma with Objective-C selector names:

```nim
proc string*(self: NSAttributedString): NSString {.objc: "string".}
proc length*(self: NSAttributedString): NSUInteger {.objc: "length".}
proc attributesAtIndexEffectiveRange*(self: NSAttributedString; location: NSUInteger; range: NSRangePointer): NSDictionary {.objc: "attributesAtIndex:effectiveRange:".}
```

## File Organization

- Each framework module goes in its own directory under `darwin/`
- Each type or related group of types gets its own `.nim` file
- Framework modules should import and export their submodules

```nim
# darwin/core_foundation.nim
import core_foundation / [cfbase, cfarray, cfdictionary, cfstring, cfattributedstring, ...]
export cfbase, cfarray, cfdictionary, cfstring, cfattributedstring, ...
```

## Reference Headers

When creating new bindings, reference the official Apple headers:

```
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks/
```

## Example: Complete CFAttributedString Binding

```nim
import cfbase, cfstring, cfdictionary

type
  CFAttributedString* = ptr object of CFObject
  CFMutableAttributedString* = ptr object of CFAttributedString

# Global function - keep original name
proc CFAttributedStringGetTypeID*(): CFTypeID {.importc.}

# Creation functions - keep original names
proc CFAttributedStringCreate*(alloc: CFAllocator, str: CFString, attributes: CFDictionary): CFAttributedString {.importc.}
proc CFAttributedStringCreateWithSubstring*(alloc: CFAllocator, aStr: CFAttributedString, range: CFRange): CFAttributedString {.importc.}
proc CFAttributedStringCreateCopy*(alloc: CFAllocator, aStr: CFAttributedString): CFAttributedString {.importc.}
proc CFAttributedStringCreateMutableCopy*(alloc: CFAllocator, maxLength: CFIndex, aStr: CFAttributedString): CFMutableAttributedString {.importc.}
proc CFAttributedStringCreateMutable*(alloc: CFAllocator, maxLength: CFIndex): CFMutableAttributedString {.importc.}

# Instance methods - concise naming (first param is main type)
proc getCFString*(aStr: CFAttributedString): CFString {.importc: "CFAttributedStringGetString".}
proc getLength*(aStr: CFAttributedString): CFIndex {.importc: "CFAttributedStringGetLength".}
proc getAttributes*(aStr: CFAttributedString, loc: CFIndex, effectiveRange: ptr CFRange): CFDictionary {.importc: "CFAttributedStringGetAttributes".}
proc getAttribute*(aStr: CFAttributedString, loc: CFIndex, attrName: CFString, effectiveRange: ptr CFRange): CFObject {.importc: "CFAttributedStringGetAttribute".}

# Mutable instance methods
proc replaceString*(aStr: CFMutableAttributedString, range: CFRange, replacement: CFString) {.importc: "CFAttributedStringReplaceString".}
proc getMutableString*(aStr: CFMutableAttributedString): CFMutableString {.importc: "CFAttributedStringGetMutableString".}
proc setAttributes*(aStr: CFMutableAttributedString, range: CFRange, replacement: CFDictionary, clearOtherAttributes: Boolean) {.importc: "CFAttributedStringSetAttributes".}
proc setAttribute*(aStr: CFMutableAttributedString, range: CFRange, attrName: CFString, value: CFObject) {.importc: "CFAttributedStringSetAttribute".}
proc removeAttribute*(aStr: CFMutableAttributedString, range: CFRange, attrName: CFString) {.importc: "CFAttributedStringRemoveAttribute".}
proc replaceAttributedString*(aStr: CFMutableAttributedString, range: CFRange, replacement: CFAttributedString) {.importc: "CFAttributedStringReplaceAttributedString".}
proc beginEditing*(aStr: CFMutableAttributedString) {.importc: "CFAttributedStringBeginEditing".}
proc endEditing*(aStr: CFMutableAttributedString) {.importc: "CFAttributedStringEndEditing".}
```
