import ../objc/[runtime, blocks]

type
    NSArrayAbstract* = ptr object of NSObject
    NSMutableArrayAbstract* = ptr object of NSArrayAbstract
    NSArray*[T] = ptr object of NSArrayAbstract
    NSMutableArray*[T] = ptr object of NSArray[T]

proc objcClass(t: typedesc[NSArrayAbstract]): auto {.inline.} = objcClass("NSArray")
proc objcClass(t: typedesc[NSMutableArrayAbstract]): auto {.inline.} = objcClass("NSMutableArray")

proc objectAtIndex*(a: NSArrayAbstract, i: int): NSObject {.objc: "objectAtIndex:".}
proc withObjectsAndCount(n: typedesc[NSArrayAbstract], objs: pointer, count: int): NSArrayAbstract {.objc: "arrayWithObjects:count:".}
proc withObjectsAndCount(n: typedesc[NSMutableArrayAbstract], objs: pointer, count: int): NSArrayAbstract {.objc: "arrayWithObjects:count:".}
proc withCapacity(n: typedesc[NSMutableArrayAbstract], c: int): NSArrayAbstract {.objc: "arrayWithCapacity:".}
proc arrayWithObjects*[T](objs: varargs[T]): NSArray[T] =
    cast[NSArray[T]](NSArrayAbstract.withObjectsAndCount(cast[ptr T](objs), objs.len))

proc newMutableArrayAbstract(n: typedesc[NSMutableArrayAbstract]): NSMutableArrayAbstract {.objc: "new".}

proc newMutableArray*[T](): NSMutableArray[T] {.inline.} =
    cast[NSMutableArray[T]](newMutableArrayAbstract(NSMutableArrayAbstract))

proc mutableArrayWithCapacity*[T](capacity: int): NSMutableArray[T] {.inline.} =
    cast[NSMutableArray[T]](withCapacity(NSMutableArrayAbstract, capacity))

proc mutableArrayWithObjects*[T](objs: varargs[T]): NSMutableArray[T] {.inline.} =
    cast[NSMutableArray[T]](NSMutableArrayAbstract.withObjectsAndCount(unsafeAddr objs[0], objs.len))

proc addObject*(a: NSMutableArrayAbstract, o: NSObject) {.objc: "addObject:".}

proc add*[T](a: NSMutableArray[T], o: T) {.inline.} =
    addObject(cast[NSMutableArrayAbstract](a), o)

proc count*(a: NSArrayAbstract): int {.objc: "count".}
proc len*(a: NSArrayAbstract): int {.inline.} = a.count

proc setObject(a: NSMutableArrayAbstract, v: NSObject, idx: int) {.objc: "setObject:atIndexedSubscript:".}

proc `[]`*[T](a: NSArray[T], idx: int): T {.inline.} = cast[T](objectAtIndex(a, idx))
proc `[]=`*[T](a: NSMutableArray[T], idx: int, v: T) {.inline.} =
    setObject(cast[NSMutableArrayAbstract](a), v, idx)

iterator items*[T](a: NSArray[T]): T =
    let ln = a.len
    for i in 0 ..< ln: yield a[i]

proc enumerateObjectsUsingBlockAbstract(a: NSArrayAbstract, blk: Block[proc(o: NSObject, idx: uint, stop: var bool)]) {.objc: "enumerateObjectsUsingBlock:".}

proc enumerateObjectsUsingBlock*[T](a: NSArray[T], b: Block[proc(o: T, idx: uint, stop: var bool)]) {.inline.} =
  a.enumerateObjectsUsingBlockAbstract(cast[Block[proc(o: NSObject, idx: uint, stop: var bool)]](b))

proc enumerateObjectsUsingBlock*[T](a: NSArray[T], b: proc(o: T, idx: uint, stop: var bool)) =
  let b = toBlock(b)
  a.enumerateObjectsUsingBlock(b)
  b.release()
