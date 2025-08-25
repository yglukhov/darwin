import ./runtime

export NSObject

proc performSelectorOnMainThread*(self: NSObject, s: SEL, o: NSObject, wait: bool) {.objc: "performSelectorOnMainThread:withObject:waitUntilDone:".}
