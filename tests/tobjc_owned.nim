import std/unittest

import darwin/objc/[runtime, objc_owned]
import darwin/foundation/nsstring

var deallocCount = 0

proc trackedDealloc(self: ID, cmd: SEL) {.cdecl.} =
  inc(deallocCount)
  callSuper(self, cmd)

proc trackedClass(): ObjcClass =
  const className = "NimObjcOwnedTracked"
  result = getClass(className)
  if result.isNil:
    addClass(className, "NSObject", result):
      addMethod("dealloc", trackedDealloc)
  assert(not result.isNil)

proc newTrackedObject(): NSObject =
  cast[NSObject](new(trackedClass()))

proc makeOwnedTracked(): ObjcOwned[NSObject] =
  fromRetained(newTrackedObject())

suite "objc_owned":
  test "withAutoreleasePool":
    withAutoreleasePool:
      let s = NSString.withUTF8String("withAutoreleasePool")
      check $s == "withAutoreleasePool"

  test "autoreleasepool alias":
    autoreleasepool:
      let s = NSString.withUTF8String("autoreleasepool")
      check $s == "autoreleasepool"

  test "fromRetained releases on scope exit":
    let start = deallocCount
    block:
      var o = fromRetained(newTrackedObject())
      check not o.isNil
      check cast[pointer](o.borrow) != nil
    check deallocCount == start + 1

  test "resetBorrowed retains borrowed object":
    let start = deallocCount
    block:
      let p = newTrackedObject()
      var o: ObjcOwned[NSObject]
      o.resetBorrowed(p)
      release(p)
      check deallocCount == start
    check deallocCount == start + 1

  test "resetRetained replaces and clear releases":
    let start = deallocCount
    block:
      var o: ObjcOwned[NSObject]
      o.resetRetained(newTrackedObject())
      o.resetRetained(newTrackedObject())
      check deallocCount == start + 1
      o.clear()
      check deallocCount == start + 2
      check o.isNil
    check deallocCount == start + 2

  test "copy increments retain count":
    let start = deallocCount
    block:
      var a = fromRetained(newTrackedObject())
      block:
        let b = a
        check not b.isNil
        check a.borrow == b.borrow
      check deallocCount == start
    check deallocCount == start + 1

  test "returning ObjcOwned works":
    let start = deallocCount
    block:
      let o = makeOwnedTracked()
      check not o.isNil
    check deallocCount == start + 1
