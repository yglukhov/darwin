import ../objc/runtime

import nsarray
import nsenumerator

type
    NSSetAbstract* = ptr object of NSObject
    NSMutableSetAbstract* = ptr object of NSSetAbstract
    NSSet*[T] = ptr object of NSSetAbstract
    NSMutableSet*[T] = ptr object of NSSet[T]
    

proc objcClass(t: typedesc[NSSetAbstract]): auto {.inline.} = objcClass("NSSet")
proc objcClass(t: typedesc[NSMutableSetAbstract]): auto {.inline.} = objcClass("NSMutableSet")


proc newSetAbstract[T](t: typedesc[T]): T {.objc: "new".}
proc newSet*[T](): NSSet[T] = cast[NSSet[T]](NSSetAbstract.newSetAbstract())
proc newMutableSet*[T]: NSMutableSet[T] = cast[NSMutableSet[T]](NSMutableSetAbstract.newSetAbstract())

proc withObjectsAndCount[T](t: typedesc[T], objs: pointer, count: int): T {.objc: "setWithObjects:count:".}
proc setWithObjects*[T](objs: varargs[T]): NSSet[T] = cast[NSSet[T]](NSSetAbstract.withObjectsAndCount(unsafeAddr objs[0], objs.len))
proc mutableSetWithObjects*[T](objs: varargs[T]): NSMutableSet[T] = cast[NSMutableSet[T]](NSMutableSetAbstract.withObjectsAndCount(unsafeAddr objs[0], objs.len))

proc withArray[T](t: typedesc[T], arr: NSArrayAbstract): T {.objc: "setWithArray:".}
proc setWithArray*[T](arr: NSArray[T]): NSSet[T] = cast[NSSet[T]](NSSetAbstract.withArray(cast[NSArrayAbstract](arr)))
proc mutableSetWithArray*[T](arr: NSArray[T]): NSMutableSet[T] = cast[NSMutableSet[T]](NSMutableSetAbstract.withArray(cast[NSArrayAbstract](arr)))

proc withSet[T](t: typedesc[T], s: NSSetAbstract): T {.objc: "setWithSet:".}
proc setWithSet*[T](s: NSSet[T]): NSSet[T] = cast[NSSet[T]](NSSetAbstract.withSet(cast[NSSetAbstract](s)))
proc mutableSetWithSet*[T](s: NSSet[T]): NSMutableSet[T] = cast[NSMutableSet[T]](NSMutableSetAbstract.withSet(cast[NSSetAbstract](s)))

proc setByAddingObjectsFromSet(s: NSSetAbstract, sa: NSSetAbstract): NSSetAbstract {.objc: "setByAddingObjectsFromSet:".}
proc setByAddingObjectsFromSet*[T](s: NSSet[T], sa: NSSet[T]): NSSet[T] = cast[NSSet[T]](cast[NSSetAbstract](s).setByAddingObjectsFromSet(cast[NSSetAbstract](sa)))

proc setByAddingObjectsFromArray(s: NSSetAbstract, sa: NSArrayAbstract): NSSetAbstract {.objc: "setByAddingObjectsFromArray:".}
proc setByAddingObjectsFromArray*[T](s: NSSet[T], sa: NSArray[T]): NSSet[T] = cast[NSSet[T]](cast[NSSetAbstract](s).setByAddingObjectsFromArray(cast[NSArrayAbstract](sa)))

proc count*(s: NSSetAbstract): int {.objc: "count".}
proc len*(s: NSSetAbstract): int {.inline.} = s.count

proc containsObject(s: NSSetAbstract, obj: NSObject): bool {.objc: "containsObject:".}
proc contains*[T](s: NSSet[T], obj: T): bool = containsObject(cast[NSSetAbstract](s), obj)

proc objectEnumerator*(s: NSSetAbstract): NSEnumeratorAbstract {.objc.}
proc objectEnumerator*[T](s: NSSet[T]): NSEnumerator[T] = cast[NSEnumerator[T]](cast[NSSetAbstract](s).objectEnumerator())

iterator items*[T](s: NSSet[T]): T =
    var enumerator = s.objectEnumerator()
    while true:
        let obj = enumerator.nextObject()
        if obj.isNil:
            break
        yield obj

proc setWithCapacity(t: typedesc[NSMutableSetAbstract], capacity: int): NSMutableSetAbstract {.objc: "setWithCapacity:".}
proc mutableSetWithCapacity*[T](capacity: int): NSMutableSet[T] = cast[NSMutableSet[T]](NSMutableSetAbstract.setWithCapacity(capacity))

proc addObject(s: NSMutableSetAbstract, o: NSObject) {.objc: "addObject:".}
proc addObject*[T](s: NSMutableSet[T], o: NSObject) = cast[NSMutableSetAbstract](s).addObject(o)
proc incl*[T](s: NSMutableSet[T], o: NSObject) = s.addObject(o)

proc removeObject(s: NSMutableSetAbstract, o: NSObject) {.objc: "removeObject:".}
proc removeObject*[T](s: NSMutableSet[T], o: NSObject) = cast[NSMutableSetAbstract](s).removeObject(o)
proc excl*[T](s: NSMutableSet[T], o: NSObject) = s.removeObject(o)

proc removeAllObjects(s: NSMutableSetAbstract) {.objc.}
proc removeAllObjects*[T](s: NSMutableSet[T]) = cast[NSMutableSetAbstract](s).removeAllObjects()

proc addObjectsFromArray(s: NSMutableSetAbstract, a: NSArrayAbstract) {.objc: "addObjectsFromArray:".}
proc addObjectsFromArray*[T](s: NSMutableSet[T], arr: NSArray[T]) = cast[NSMutableSetAbstract](s).addObjectsFromArray(cast[NSArrayAbstract](arr))