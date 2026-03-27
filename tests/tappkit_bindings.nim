import darwin/[app_kit, foundation]

let s = NSString.withUTF8String("ab")
doAssert(s.length == 2)

block:
  var
    codepoint: uint32
    usedLength: uint
    range = NSMakeRange(0, s.length)
  discard s.getBytes(
    codepoint.addr,
    sizeof(codepoint).uint,
    usedLength.addr,
    NSUTF32StringEncoding,
    0.NSStringEncodingConversionOptions,
    range,
    range.addr
  )
  doAssert(codepoint == 'a'.uint32)

block:
  let styleMask = NSWindowStyleMaskTitled or NSWindowStyleMaskClosable
  doAssert((cast[uint](styleMask) and cast[uint](NSWindowStyleMaskClosable)) != 0)

block:
  let trackingOpts = NSTrackingMouseMoved or NSTrackingCursorUpdate
  doAssert((cast[uint](trackingOpts) and cast[uint](NSTrackingCursorUpdate)) != 0)

discard NSApplication.sharedApplication()
let event = NSApp.nextEventMatchingMask(NSEventMaskAny, NSDate.distantPast, NSDefaultRunLoopMode, false)
doAssert(event == nil)
