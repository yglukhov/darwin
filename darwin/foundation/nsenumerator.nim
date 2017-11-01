import ../objc/runtime

type NSEnumeratorAbstract* = ptr object of NSObject
type NSEnumerator*[T] = ptr object of NSEnumeratorAbstract

proc objcClass(t: typedesc[NSEnumeratorAbstract]): auto {.inline.} = objcClass("NSEnumerator")

proc nextObject*(e: NSEnumeratorAbstract): NSObject {.objc.}
proc nextObject*[T](e: NSEnumerator[T]): T = cast[T](nextObject(cast[NSEnumeratorAbstract](e)))