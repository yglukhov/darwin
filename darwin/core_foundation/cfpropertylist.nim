import cfbase, cfstream, cferror

export CFPropertyList

type
    CFPropertyListMutabilityOptions* {.size: sizeof(uint).} = enum
        kCFPropertyListImmutable = 0
        kCFPropertyListMutableContainers = 1
        kCFPropertyListMutableContainersAndLeaves = 2

    CFPropertyListFormat* {.size: sizeof(uint).} = enum
        kCFPropertyListOpenStepFormat = 1
        kCFPropertyListXMLFormat_v1_0 = 100
        kCFPropertyListBinaryFormat_v1_0 = 200

proc CFPropertyListCreateWithStream*(alloc: CFAllocator, stream: CFReadStream, streamLength: CFIndex, options: CFPropertyListMutabilityOptions, format: ptr CFPropertyListFormat, error: ptr CFError): CFPropertyList {.importc.}

