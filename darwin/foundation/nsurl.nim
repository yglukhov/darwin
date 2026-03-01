import ../objc/runtime
import ./nsnumber

type NSURL* = ptr object of NSObject

# Class methods - creation
proc URLWithString*(self: typedesc[NSURL], str: NSString): NSURL {.objc: "URLWithString:".}
proc fileURLWithPath*(self: typedesc[NSURL], path: NSString): NSURL {.objc: "fileURLWithPath:".}
proc fileURLWithPath*(self: typedesc[NSURL], path: NSString, isDirectory: BOOL): NSURL {.objc: "fileURLWithPath:isDirectory:".}

# Initialization
proc initWithString*(self: NSURL, str: NSString): NSURL {.objc: "initWithString:", discardable.}
proc initFileURLWithPath*(self: NSURL, path: NSString): NSURL {.objc: "initFileURLWithPath:", discardable.}
proc initFileURLWithPath*(self: NSURL, path: NSString, isDirectory: BOOL): NSURL {.objc: "initFileURLWithPath:isDirectory:", discardable.}

# URL components
proc absoluteString*(self: NSURL): NSString {.objc.}
proc relativeString*(self: NSURL): NSString {.objc.}
proc baseURL*(self: NSURL): NSURL {.objc.}
proc absoluteURL*(self: NSURL): NSURL {.objc.}
proc scheme*(self: NSURL): NSString {.objc.}
proc host*(self: NSURL): NSString {.objc.}
proc port*(self: NSURL): NSNumber {.objc.}
proc user*(self: NSURL): NSString {.objc.}
proc password*(self: NSURL): NSString {.objc.}
proc path*(self: NSURL): NSString {.objc.}
proc fragment*(self: NSURL): NSString {.objc.}
proc query*(self: NSURL): NSString {.objc.}
proc relativePath*(self: NSURL): NSString {.objc.}

# File system
proc fileSystemRepresentation*(self: NSURL): cstring {.objc.}
proc getFileSystemRepresentation*(self: NSURL, buffer: cstring, maxBufferLength: NSUInteger): BOOL {.objc: "getFileSystemRepresentation:maxLength:".}
proc isFileURL*(self: NSURL): BOOL {.objc.}
proc hasDirectoryPath*(self: NSURL): BOOL {.objc.}
proc standardizedURL*(self: NSURL): NSURL {.objc.}
proc fileReferenceURL*(self: NSURL): NSURL {.objc.}
proc filePathURL*(self: NSURL): NSURL {.objc.}
