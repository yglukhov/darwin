import cfbase, cfstring, cfurl, cfdata, cfarray, cfdictionary, cferror

export cfdata

type
    CFURLBookmarkCreationOptions* = distinct culong
    CFURLBookmarkResolutionOptions* = distinct culong
    CFURLBookmarkFileCreationOptions* = distinct culong

const
    kCFURLBookmarkCreationMinimalBookmarkMask* = CFURLBookmarkCreationOptions(1'u shl 9)
    kCFURLBookmarkCreationSuitableForBookmarkFile* = CFURLBookmarkCreationOptions(1'u shl 10)
    kCFURLBookmarkCreationWithSecurityScope* = CFURLBookmarkCreationOptions(1'u shl 11)
    kCFURLBookmarkCreationSecurityScopeAllowOnlyReadAccess* = CFURLBookmarkCreationOptions(1'u shl 12)
    kCFURLBookmarkCreationWithoutImplicitSecurityScope* = CFURLBookmarkCreationOptions(1'u shl 29)

const
    kCFURLBookmarkResolutionWithoutUIMask* = CFURLBookmarkResolutionOptions(1'u shl 8)
    kCFURLBookmarkResolutionWithoutMountingMask* = CFURLBookmarkResolutionOptions(1'u shl 9)
    kCFURLBookmarkResolutionWithSecurityScope* = CFURLBookmarkResolutionOptions(1'u shl 10)
    kCFURLBookmarkResolutionWithoutImplicitStartAccessing* = CFURLBookmarkResolutionOptions(1'u shl 15)

proc CFURLCreateBookmarkData*(allocator: CFAllocator, url: CFURL, options: CFURLBookmarkCreationOptions, resourcePropertiesToInclude: CFArray, relativeToURL: CFURL, error: ptr CFError): CFData {.importc.}

proc CFURLCreateByResolvingBookmarkData*(allocator: CFAllocator, bookmark: CFData, options: CFURLBookmarkResolutionOptions, relativeToURL: CFURL, resourcePropertiesToInclude: CFArray, isStale: ptr Boolean, error: ptr CFError): CFURL {.importc.}

proc CFURLCreateResourcePropertiesForKeysFromBookmarkData*(allocator: CFAllocator, resourcePropertiesToReturn: CFArray, bookmark: CFData): CFDictionary {.importc.}

proc CFURLCreateResourcePropertyForKeyFromBookmarkData*(allocator: CFAllocator, resourcePropertyKey: CFString, bookmark: CFData): CFObject {.importc.}

proc CFURLCreateBookmarkDataFromFile*(allocator: CFAllocator, fileURL: CFURL, error: ptr CFError): CFData {.importc.}

proc CFURLWriteBookmarkDataToFile*(bookmark: CFData, fileURL: CFURL, options: CFURLBookmarkFileCreationOptions, error: ptr CFError): Boolean {.importc.}

proc startAccessingSecurityScopedResource*(url: CFURL): Boolean {.importc: "CFURLStartAccessingSecurityScopedResource".}

proc stopAccessingSecurityScopedResource*(url: CFURL) {.importc: "CFURLStopAccessingSecurityScopedResource".}
