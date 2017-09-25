import ../objc/runtime

type NSData* = ptr object of NSObject

proc length*(p: NSData): int {.objc: "length".}
proc getBytes*(self: NSData, buffer: pointer, length: int) {.objc: "getBytes:length:".}
proc withBytes(n: typedesc[NSData], bytes: pointer, length: int) {.objc: "dataWithBytes:length:".}

proc dataWithBytes*(bytes: cstring, length: int): NSData {.inline.} =
    NSData.withBytes(bytes, length)
