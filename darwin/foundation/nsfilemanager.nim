import ../objc/runtime
import ../foundation/[nsurl, nsstring, nsarray, nsdictionary, nserror, nspath_utilities, nsdata, nsenumerator]

type NSFileManager* = ptr object of NSObject

proc defaultManager*(cls: typedesc[NSFileManager]): NSFileManager {.objc: "defaultManager".}

proc trashItemAtURL*(self: NSFileManager, url: NSURL, resultingItemURL: pointer = nil, error: pointer = nil): BOOL {.objc: "trashItemAtURL:resultingItemURL:error:".}
proc removeItemAtURL*(self: NSFileManager, url: NSURL, error: pointer = nil): BOOL {.objc: "removeItemAtURL:error:".}
proc copyItemAtURL*(self: NSFileManager, srcURL: NSURL, toURL: NSURL, error: pointer = nil): BOOL {.objc: "copyItemAtURL:toURL:error:".}
proc moveItemAtURL*(self: NSFileManager, srcURL: NSURL, toURL: NSURL, error: pointer = nil): BOOL {.objc: "moveItemAtURL:toURL:error:".}
proc fileExistsAtPath*(self: NSFileManager, path: NSString): BOOL {.objc: "fileExistsAtPath:".}
proc fileExistsAtPath*(self: NSFileManager, path: NSString, isDirectory: ptr BOOL): BOOL {.objc: "fileExistsAtPath:isDirectory:".}
proc isReadableFileAtPath*(self: NSFileManager, path: NSString): BOOL {.objc: "isReadableFileAtPath:".}
proc isWritableFileAtPath*(self: NSFileManager, path: NSString): BOOL {.objc: "isWritableFileAtPath:".}
proc isExecutableFileAtPath*(self: NSFileManager, path: NSString): BOOL {.objc: "isExecutableFileAtPath:".}
proc isDeletableFileAtPath*(self: NSFileManager, path: NSString): BOOL {.objc: "isDeletableFileAtPath:".}
proc contentsOfDirectoryAtURL*(self: NSFileManager, url: NSURL, includingPropertiesForKeys: NSArray, options: NSUInteger, error: pointer = nil): NSArray {.objc: "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:".}
proc contentsOfDirectoryAtPath*(self: NSFileManager, path: NSString, error: pointer = nil): NSArray {.objc: "contentsOfDirectoryAtPath:error:".}
proc createDirectoryAtURL*(self: NSFileManager, url: NSURL, withIntermediateDirectories: BOOL, attributes: NSDictionary = nil, error: pointer = nil): BOOL {.objc: "createDirectoryAtURL:withIntermediateDirectories:attributes:error:".}
proc createDirectoryAtPath*(self: NSFileManager, path: NSString, withIntermediateDirectories: BOOL, attributes: NSDictionary = nil, error: pointer = nil): BOOL {.objc: "createDirectoryAtPath:withIntermediateDirectories:attributes:error:".}
proc removeItemAtPath*(self: NSFileManager, path: NSString, error: pointer = nil): BOOL {.objc: "removeItemAtPath:error:".}
proc copyItemAtPath*(self: NSFileManager, srcPath: NSString, toPath: NSString, error: pointer = nil): BOOL {.objc: "copyItemAtPath:toPath:error:".}
proc moveItemAtPath*(self: NSFileManager, srcPath: NSString, toPath: NSString, error: pointer = nil): BOOL {.objc: "moveItemAtPath:toPath:error:".}
proc attributesOfItemAtPath*(self: NSFileManager, path: NSString, error: pointer = nil): NSDictionary {.objc: "attributesOfItemAtPath:error:".}
proc setAttributes*(self: NSFileManager, attributes: NSDictionary, ofItemAtPath: NSString, error: pointer = nil): BOOL {.objc: "setAttributes:ofItemAtPath:error:".}
proc homeDirectoryForCurrentUser*(self: NSFileManager): NSURL {.objc: "homeDirectoryForCurrentUser".}
proc temporaryDirectory*(self: NSFileManager): NSURL {.objc: "temporaryDirectory".}
proc currentDirectoryPath*(self: NSFileManager): NSString {.objc: "currentDirectoryPath".}
proc changeCurrentDirectoryPath*(self: NSFileManager, path: NSString): BOOL {.objc: "changeCurrentDirectoryPath:".}
proc displayNameAtPath*(self: NSFileManager, path: NSString): NSString {.objc: "displayNameAtPath:".}
proc contentsAtPath*(self: NSFileManager, path: NSString): NSData {.objc: "contentsAtPath:".}
proc createFileAtPath*(self: NSFileManager, path: NSString, contents: NSData = nil, attributes: NSDictionary = nil): BOOL {.objc: "createFileAtPath:contents:attributes:".}
proc subpathsOfDirectoryAtPath*(self: NSFileManager, path: NSString, error: pointer = nil): NSArray {.objc: "subpathsOfDirectoryAtPath:error:".}
proc enumeratorAtPath*(self: NSFileManager, path: NSString): NSEnumerator {.objc: "enumeratorAtPath:".}
proc destinationOfSymbolicLinkAtPath*(self: NSFileManager, path: NSString, error: pointer = nil): NSString {.objc: "destinationOfSymbolicLinkAtPath:error:".}
proc createSymbolicLinkAtURL*(self: NSFileManager, url: NSURL, withDestinationURL: NSURL, error: pointer = nil): BOOL {.objc: "createSymbolicLinkAtURL:withDestinationURL:error:".}
proc createSymbolicLinkAtPath*(self: NSFileManager, path: NSString, withDestinationPath: NSString, error: pointer = nil): BOOL {.objc: "createSymbolicLinkAtPath:withDestinationPath:error:".}
proc linkItemAtURL*(self: NSFileManager, srcURL: NSURL, toURL: NSURL, error: pointer = nil): BOOL {.objc: "linkItemAtURL:toURL:error:".}
proc linkItemAtPath*(self: NSFileManager, srcPath: NSString, toPath: NSString, error: pointer = nil): BOOL {.objc: "linkItemAtPath:toPath:error:".}
proc urlForDirectory*(self: NSFileManager, directory: NSSearchPathDirectory, inDomain: set[NSSearchPathDomain], appropriateForURL: NSURL = nil, create: BOOL, error: pointer = nil): NSURL {.objc: "URLForDirectory:inDomain:appropriateForURL:create:error:".}
proc URLsForDirectory*(self: NSFileManager, directory: NSSearchPathDirectory, inDomains: set[NSSearchPathDomain]): NSArray {.objc: "URLsForDirectory:inDomains:".}
