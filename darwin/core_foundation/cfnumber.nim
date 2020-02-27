import cfbase

type
  CFNumber* = ptr object of CFPropertyList
  CFBoolean* = ptr object of CFPropertyList

  CFNumberType* {.size: sizeof(uint).} = enum
    # Fixed-width types
    kCFNumberSInt8Type = 1,
    kCFNumberSInt16Type = 2,
    kCFNumberSInt32Type = 3,
    kCFNumberSInt64Type = 4,
    kCFNumberFloat32Type = 5,
    kCFNumberFloat64Type = 6, # 64-bit IEEE 754
    # Basic C types
    kCFNumberCharType = 7,
    kCFNumberShortType = 8,
    kCFNumberIntType = 9,
    kCFNumberLongType = 10,
    kCFNumberLongLongType = 11,
    kCFNumberFloatType = 12,
    kCFNumberDoubleType = 13,
    # Other
    kCFNumberCFIndexType = 14,
    kCFNumberNSIntegerType = 15,
    kCFNumberCGFloatType = 16,

proc CFNumberGetTypeID*(): CFTypeID {.importc.}
proc CFBooleanGetTypeID*(): CFTypeID {.importc.}

proc CFBooleanGetValue(boolean: CFBoolean): Boolean {.importc.}
proc CFNumberIsFloatType(n: CFNumber): Boolean {.importc.}
proc CFNumberGetValue(number: CFNumber, theType: CFNumberType, valuePtr: pointer): Boolean {.importc.}

proc getType*(number: CFNumber): CFNumberType {.importc: "CFNumberGetType".}
proc value*(b: CFBoolean): bool {.inline.} = bool CFBooleanGetValue(b)
proc isFloatType*(n: CFNumber): bool {.inline.} = bool CFNumberIsFloatType(n)

proc getFloat*(n: CFNumber): float =
  var d: cdouble
  discard CFNumberGetValue(n, kCFNumberDoubleType, addr d)
  result = d

proc getInt64*(n: CFNumber): int64 =
  discard CFNumberGetValue(n, kCFNumberSInt64Type, addr result)
