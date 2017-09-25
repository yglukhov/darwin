import ../objc/runtime

export NSString

proc UTF8String*(s: NSString): cstring {.objc: "UTF8String".}

proc isEqualToString*(s1, s2: NSString): bool {.objc: "isEqualToString:".}

template `==`*(s1, s2: NSString): bool = s1.isEqualToString(s2)

proc withUTF8String*(n: typedesc[NSString], s: cstring): NSString {.objc: "stringWithUTF8String:".}
proc stringWithNSString*(n: NSString): string = $n.UTF8String

converter toNSString*(s: string): NSString = NSString.withUTF8String(s)
converter nsstringtostring*(s: NSString): string = stringWithNSString(s)
template `$`*(s: NSString): string = nsstringtostring(s)
