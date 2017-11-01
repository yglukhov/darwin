import ../objc/runtime

import nsarray


type
    NSDictionaryAbstract* = ptr object of NSObject
    NSMutableDictionaryAbstract* = ptr object of NSDictionaryAbstract
    NSDictionary*[K, V] = ptr object of NSDictionaryAbstract
    NSMutableDictionary*[K, V] = ptr object of NSDictionary[K, V]


proc objcClass(t: typedesc[NSDictionaryAbstract]): auto {.inline.} = objcClass("NSDictionary")
proc objcClass(t: typedesc[NSMutableDictionaryAbstract]): auto {.inline.} = objcClass("NSMutableDictionary")

proc newDictionaryAbstract[T](t: typedesc[T]): T {.objc: "new".}
proc newDictionary*[K, V](): NSDictionary[K, V] = cast[NSDictionary[K, V]](NSDictionaryAbstract.newDictionaryAbstract())
proc newMutableDictionary*[K, V](): NSMutableDictionary[K, V] = cast[NSMutableDictionary[K, V]](NSMutableDictionaryAbstract.newDictionaryAbstract())

proc withDictionary[T](t: typedesc[T], dict: NSDictionaryAbstract): T {.objc: "dictionaryWithDictionary:".}
proc dictionaryWithDictionary*[K, V](dict: NSDictionary[K, V]): NSDictionary[K, V] = cast[NSDictionary[K, V]](NSDictionaryAbstract.withDictionary(dict))
proc mutableDictionaryWithDictionary*[K, V](dict: NSDictionary[K, V]): NSMutableDictionary[K, V] = cast[NSMutableDictionary[K, V]](NSMutableDictionaryAbstract.withDictionary(dict))

proc allKeys(d: NSDictionaryAbstract): NSArrayAbstract {.objc.}
proc allKeys*[K, V](d: NSDictionary[K, V]): NSArray[K] = cast[NSArray[K]](d.NSDictionaryAbstract.allKeys())
iterator keys*[K, V](d: NSDictionary[K, V]): K =
    for key in d.allKeys():
        yield key

proc allValues(d: NSDictionaryAbstract): NSArrayAbstract {.objc.}
proc allValues*[K, V](d: NSDictionary[K, V]): NSArray[V] = cast[NSArray[V]](d.NSDictionaryAbstract.allValues())
iterator values*[K, V](d: NSDictionary[K, V]): K =
    for value in d.allValues():
        yield value

proc objectForKey(d: NSDictionaryAbstract, k: NSObject): NSObject {.objc: "objectForKey:".}
proc objectForKey*[K, V](d: NSDictionary[K, V], k: K): V = cast[V](d.NSDictionaryAbstract.objectForKey(k))

proc `[]`*[K, V](d: NSDictionary[K, V], k: K): V = d.objectForKey(k)
proc hasKey*[K, V](d: NSDictionary[K, V], k: K): bool = not d[k].isNil

iterator pairs*[K, V](d: NSDictionary[K, V]): (K, V) =
    for k in d.allKeys():
        yield (k, d[k])

proc count*(a: NSDictionaryAbstract): int {.objc: "count".}
proc len*(a: NSDictionaryAbstract): int {.inline.} = a.count

proc setObject(d: NSMutableDictionaryAbstract, o: NSObject, k: NSObject) {.objc: "setObject:forKey:".}
proc setObject*[K, V](d: NSMutableDictionary[K, V], o: V, k: K) = cast[NSMutableDictionaryAbstract](d).setObject(o, k)
proc `[]=`*[K, V](d: NSMutableDictionary[K, V], k: K, o: V) = d.setObject(o, k)

proc removeObject[K, V](d: NSMutableDictionaryAbstract, k: K) {.objc: "removeObjectForKey:".}
proc del*[K, V](d: NSMutableDictionary[K, V], k: K) = cast[NSMutableDictionaryAbstract](d).removeObject(k)
