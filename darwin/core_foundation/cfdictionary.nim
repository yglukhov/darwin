import cfbase, cfstring, cfpropertylist

type
  CFAbstractDictionary = ptr object of CFPropertyList # CFDictionary
  CFAbstractMutableDictionary = ptr object of CFAbstractDictionary # CFMutableDictionary

  CFDictionary*[K, V] = ptr object of CFAbstractDictionary
  CFMutableDictionary*[K, V] = ptr object of CFDictionary[K, V]

  CFDictionaryRetainCallBack* = proc(allocator: CFAllocator, value: pointer): pointer {.cdecl.}
  CFDictionaryReleaseCallBack* = proc(allocator: CFAllocator, value: pointer) {.cdecl.}
  CFDictionaryCopyDescriptionCallBack* = proc(value: pointer): CFString {.cdecl.}
  CFDictionaryEqualCallBack* = proc(value1, value2: pointer): Boolean {.cdecl.}
  CFDictionaryHashCallBack* = proc(value: pointer): CFHashCode {.cdecl.}

  CFDictionaryKeyCallbacks* {.byref.} = object
    version*: CFIndex
    retain*: CFDictionaryRetainCallBack
    release*: CFDictionaryReleaseCallBack
    copyDescription*: CFDictionaryCopyDescriptionCallBack
    equal*: CFDictionaryEqualCallBack
    hash*: CFDictionaryHashCallBack

  CFDictionaryValueCallBacks* {.byref.} = object
    version*: CFIndex
    retain*: CFDictionaryRetainCallBack
    release*: CFDictionaryReleaseCallBack
    copyDescription*: CFDictionaryCopyDescriptionCallBack
    equal*: CFDictionaryEqualCallBack

var
  cfTypeKeyCallbacks {.importc: "kCFTypeDictionaryKeyCallBacks".}: CFDictionaryKeyCallBacks
  cfCopyStringKeyCallbacks {.importc: "kCFCopyStringDictionaryKeyCallBacks".}: CFDictionaryKeyCallBacks
  cfTypeValueCallbacks {.importc: "kCFTypeDictionaryValueCallBacks".}: CFDictionaryValueCallBacks

template kCFTypeDictionaryKeyCallBacks*: CFDictionaryKeyCallBacks =
  let a = cfTypeKeyCallbacks; a
template kCFCopyStringDictionaryKeyCallBacks*: CFDictionaryKeyCallBacks =
  let a = cfCopyStringKeyCallbacks; a
template kCFTypeDictionaryValueCallBacks*: CFDictionaryValueCallBacks =
  let a = cfTypeValueCallbacks; a

proc CFDictionaryGetTypeID*(): CFTypeID {.importc.}

proc CFDictionaryCreateMutableAbstract(allocator: CFAllocator, capacity: CFIndex, keyCallBacks: CFDictionaryKeyCallBacks, valueCallBacks: CFDictionaryValueCallBacks): CFAbstractMutableDictionary {.importc: "CFDictionaryCreateMutable".}

proc CFDictionaryCreateMutable*[K, V](allocator: CFAllocator, capacity: CFIndex, keyCallBacks: CFDictionaryKeyCallBacks, valueCallBacks: CFDictionaryValueCallBacks): CFMutableDictionary[K, V] {.inline.} =
  cast[CFMutableDictionary[K, V]](CFDictionaryCreateMutableAbstract(allocator, capacity, keyCallBacks, valueCallBacks))

proc CFDictionaryGetCount(d: CFAbstractDictionary): int {.importc.}

proc CFDictionaryGetValue(d: CFAbstractDictionary, key: pointer): pointer {.importc.}

proc CFDictionarySetValue(d: CFAbstractMutableDictionary, k, v: pointer) {.importc.}

proc `[]`*[K, V](d: CFDictionary[K, V], k: K): V {.inline.} =
  cast[V](CFDictionaryGetValue(d, cast[pointer](k)))

proc `[]=`*[K, V](d: CFMutableDictionary[K, V], k: K, v: V) {.inline.} =
  CFDictionarySetValue(cast[CFAbstractMutableDictionary](d), cast[pointer](k), cast[pointer](v))

proc len*(d: CFAbstractDictionary): int {.inline.} =
  CFDictionaryGetCount(d)

proc CFDictionaryGetKeysAndValues(d: CFAbstractDictionary, keys, values: ptr pointer) {.importc.}

proc getKeysAndValues*[K, V](d: CFDictionary[K, V], keys: var seq[K], values: var seq[V]) =
  let c = d.len
  keys.setLen(c)
  values.setLen(c)
  if c != 0:
    CFDictionaryGetKeysAndValues(d, cast[ptr pointer](addr keys[0]), cast[ptr pointer](addr values[0]))

iterator items*[K, V](d: CFDictionary[K, V]): K =
  let c = d.len
  if c != 0:
    var keys = newSeq[K](c)
    CFDictionaryGetKeysAndValues(d, cast[ptr pointer](addr keys[0]), nil)
    for k in keys: yield k

iterator pairs*[K, V](d: CFDictionary[K, V]): (K, V) =
  let c = d.len
  if c != 0:
    var keys = newSeq[K](c)
    var values = newSeq[V](c)
    CFDictionaryGetKeysAndValues(d, cast[ptr pointer](addr keys[0]), cast[ptr pointer](addr values[0]))
    for i in 0 ..< c: yield (keys[i], values[i])
