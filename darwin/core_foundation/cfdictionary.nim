import cfbase, cfstring, cfpropertylist

type
  CFAbstractDictionary = ptr object of CFPropertyList # CFDictionary
  CFAbstractMutableDictionary = ptr object of CFAbstractDictionary # CFMutableDictionary

  CFDictionary*[K, V] = ptr object of CFAbstractDictionary
  CFMutableDictionary*[K, V] = ptr object of CFDictionary[K, V]


proc CFDictionaryGetTypeID*(): CFTypeID {.importc.}

proc CFDictionaryGetCount(d: CFAbstractDictionary): int {.importc.}

proc CFDictionaryGetValue(d: CFAbstractDictionary, key: pointer): pointer {.importc.}

proc `[]`*[K, V](d: CFDictionary[K, V], k: K): V {.inline.} =
  cast[V](CFDictionaryGetValue(d, cast[pointer](k)))

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
