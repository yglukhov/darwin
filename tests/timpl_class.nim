# import darwin/objc/class_impl
import darwin/objc/runtime
import darwin/foundation

# objcClass MyDelegate of NSObject:
#   proc handleEvent(self: MyDelegate, s: NSStream, ev: NSStreamEvent) {.objc: "stream:handleEvent:".}

var handleCalled = false

# Declare a class
type
  MyDelegate = ptr object of NSObject

# Implement a method
proc handleEvent(self: MyDelegate, cmd: SEL, s: NSStream, ev: NSStreamEvent) {.cdecl.} =
  handleCalled = true

# Register class implementation
let dClass = allocateClassPair(getClass("NSObject"), "MyDelegate", 0)
doAssert(dClass != nil)
discard addMethod(dClass, sel_registerName("stream:handleEvent:"), handleEvent)
registerClassPair(dClass)

# Instantiate
let d = cast[MyDelegate](createInstance(dClass, 0))

# Test
let s = NSinputStream.withData(NSData.withBytes([1.byte, 2, 3, 4]))
s.setDelegate(d)
s.scheduleInRunLoop(NSRunLoop.current(), NSDefaultRunLoopMode)
s.open()
NSRunLoop.current().runUntilDate(NSDate.withTimeIntervalSinceNow(0.1))
doAssert(handleCalled)
