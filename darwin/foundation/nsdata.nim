import ../objc/runtime

type NSData* = ptr object of NSObject

proc length*(p: NSData): int {.objc: "length".}
proc getBytes*(self: NSData, buffer: pointer, length: int) {.objc: "getBytes:length:".}
proc withBytes(n: typedesc[NSData], bytes: pointer, length: int): NSData {.objc: "dataWithBytes:length:".}

proc dataWithBytes*(bytes: cstring, length: int): NSData {.inline.} =
  NSData.withBytes(bytes, length)

proc emptyData*(n: typedesc[NSData]): NSData {.objc: "data".}

proc withBytes*(T: typedesc[NSData], bytes: openarray[byte]): T {.inline.} =
  if bytes.len == 0:
    T.emptyData()
  else:
    T.withBytes(unsafeAddr bytes[0], bytes.len)

proc len*(p: NSData): int {.inline.} = p.length
