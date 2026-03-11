import ../objc/runtime
import ./[nsnumber, nsdata, nsarray, nsdictionary, nserror]

type
    NSURL* = ptr object of NSObject
    NSURLBookmarkCreationOptions* = distinct NSUInteger
    NSURLBookmarkResolutionOptions* = distinct NSUInteger
    NSURLBookmarkFileCreationOptions* = distinct NSUInteger

const
    NSURLBookmarkCreationMinimalBookmark* = NSURLBookmarkCreationOptions(1'u shl 9)
    NSURLBookmarkCreationSuitableForBookmarkFile* = NSURLBookmarkCreationOptions(1'u shl 10)
    NSURLBookmarkCreationWithSecurityScope* = NSURLBookmarkCreationOptions(1'u shl 11)
    NSURLBookmarkCreationSecurityScopeAllowOnlyReadAccess* = NSURLBookmarkCreationOptions(1'u shl 12)
    NSURLBookmarkCreationWithoutImplicitSecurityScope* = NSURLBookmarkCreationOptions(1'u shl 29)

const
    NSURLBookmarkResolutionWithoutUI* = NSURLBookmarkResolutionOptions(1'u shl 8)
    NSURLBookmarkResolutionWithoutMounting* = NSURLBookmarkResolutionOptions(1'u shl 9)
    NSURLBookmarkResolutionWithSecurityScope* = NSURLBookmarkResolutionOptions(1'u shl 10)
    NSURLBookmarkResolutionWithoutImplicitStartAccessing* = NSURLBookmarkResolutionOptions(1'u shl 15)

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

# Bookmark API
proc bookmarkDataWithOptions*(self: NSURL, options: NSURLBookmarkCreationOptions, keys: NSArray, relativeURL: NSURL, error: ptr NSError): NSData {.objc: "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:".}

proc initByResolvingBookmarkData*(self: NSURL, bookmarkData: NSData, options: NSURLBookmarkResolutionOptions, relativeURL: NSURL, isStale: ptr BOOL, error: ptr NSError): NSURL {.objc: "initByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", discardable.}

proc URLByResolvingBookmarkData*(self: typedesc[NSURL], bookmarkData: NSData, options: NSURLBookmarkResolutionOptions, relativeURL: NSURL, isStale: ptr BOOL, error: ptr NSError): NSURL {.objc: "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:".}

proc resourceValuesForKeys*(self: typedesc[NSURL], keys: NSArray, bookmarkData: NSData): NSDictionary {.objc: "resourceValuesForKeys:fromBookmarkData:".}

proc writeBookmarkData*(self: typedesc[NSURL], bookmarkData: NSData, toURL: NSURL, options: NSURLBookmarkFileCreationOptions, error: ptr NSError): BOOL {.objc: "writeBookmarkData:toURL:options:error:".}

proc bookmarkDataWithContentsOfURL*(self: typedesc[NSURL], fileURL: NSURL, error: ptr NSError): NSData {.objc: "bookmarkDataWithContentsOfURL:error:".}

proc URLByResolvingAliasFileAtURL*(self: typedesc[NSURL], url: NSURL, options: NSURLBookmarkResolutionOptions, error: ptr NSError): NSURL {.objc: "URLByResolvingAliasFileAtURL:options:error:".}

proc startAccessingSecurityScopedResource*(self: NSURL): BOOL {.objc.}

proc stopAccessingSecurityScopedResource*(self: NSURL) {.objc.}
