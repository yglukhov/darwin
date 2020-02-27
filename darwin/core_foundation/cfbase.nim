
{.passL: "-framework CoreFoundation".}

type
    CFTypeID* = distinct uint
    CFOptionFlags* = uint
    CFHashCode* = uint
    CFIndex* = int

    CFRange* = object
        location*: CFIndex
        length*: CFIndex

    CFObject* = ptr object {.pure, inheritable.} # CFTypeRef
    CFPropertyList* = ptr object of CFObject

    CFAllocator* = ptr object of CFObject

    CFString* = ptr object of CFPropertyList
    CFMutableString* = ptr object of CFString


    Boolean* = uint8
    UniChar* = uint16

const kCFNotFound*: CFIndex = -1

proc `==`*(a, b: CFTypeID): bool {.borrow.}

proc CFRangeMake*(location, length: CFIndex): CFRange {.inline.} =
    result.location = location
    result.length = length

var
    allocDefault {.importc: "kCFAllocatorDefault".}: CFAllocator
    allocSystemDefault {.importc: "kCFAllocatorSystemDefault".}: CFAllocator
    allocMalloc {.importc: "kCFAllocatorMalloc".}: CFAllocator
    allocMallocZone {.importc: "kCFAllocatorMallocZone".}: CFAllocator
    allocNull {.importc: "kCFAllocatorNull".}: CFAllocator
    allocUseContext {.importc: "kCFAllocatorUseContext".}: CFAllocator

template kCFAllocatorDefault*: CFAllocator =
    let a = allocDefault; a
template kCFAllocatorSystemDefault*: CFAllocator =
    let a = allocSystemDefault; a
template kCFAllocatorMalloc*: CFAllocator =
    let a = allocMalloc; a
template kCFAllocatorMallocZone*: CFAllocator =
    let a = allocMallocZone; a
template kCFAllocatorNull*: CFAllocator =
    let a = allocNull; a
template kCFAllocatorUseContext*: CFAllocator =
    let a = allocUseContext; a

type
    CFAllocatorRetainCallBack* = proc(info: pointer): pointer {.cdecl.}
    CFAllocatorReleaseCallBack* = proc(info: pointer) {.cdecl.}
    CFAllocatorCopyDescriptionCallBack* = proc(info: pointer): CFString {.cdecl.}
    CFAllocatorAllocateCallBack* = proc(allocSize: CFIndex, hint: CFOptionFlags, info: pointer): pointer {.cdecl.}
    CFAllocatorReallocateCallBack* = proc(buf: pointer, newsize: CFIndex, hint: CFOptionFlags, info: pointer): pointer {.cdecl.}
    CFAllocatorDeallocateCallBack* = proc(buf: pointer, info: pointer) {.cdecl.}
    CFAllocatorPreferredSizeCallBack* = proc(size: CFIndex, hint: CFOptionFlags, info: pointer): CFIndex {.cdecl.}

    CFAllocatorContext* = object
        version*: CFIndex
        info*: pointer
        retain*: CFAllocatorRetainCallBack
        release*: CFAllocatorReleaseCallBack
        copyDescription*: CFAllocatorCopyDescriptionCallBack
        allocate*: CFAllocatorAllocateCallBack
        reallocate*: CFAllocatorReallocateCallBack
        deallocate*: CFAllocatorDeallocateCallBack
        preferredSize*: CFAllocatorPreferredSizeCallBack

proc CFAllocatorGetTypeID*(): CFTypeID {.importc.}
proc CFAllocatorSetDefault*(a: CFAllocator) {.importc.}
proc CFAllocatorGetDefault*(): CFAllocator {.importc.}
proc CFAllocatorCreateAux(allocator: CFAllocator, context: ptr CFAllocatorContext): CFAllocator {.importc: "CFAllocatorCreate".}
proc CFAllocatorCreate*(allocator: CFAllocator, context: CFAllocatorContext): CFAllocator {.inline.} = CFAllocatorCreateAux(allocator, unsafeAddr context)

proc allocate*(allocator: CFAllocator, size: CFIndex, hint: CFOptionFlags): pointer {.importc: "CFAllocatorAllocate".}
proc reallocate*(allocator: CFAllocator, buf: pointer, newsize: CFIndex, hint: CFOptionFlags): pointer {.importc: "CFAllocatorReallocate".}
proc deallocate*(allocator: CFAllocator, buf: pointer) {.importc: "CFAllocatorDeallocate".}

proc getPreferredSizeForSize*(allocator: CFAllocator, size: CFIndex, hint: CFOptionFlags): CFIndex {.importc: "CFAllocatorGetPreferredSizeForSize".}
proc getContext*(allocator: CFAllocator, context: var CFAllocatorContext) {.importc: "CFAllocatorGetContext".}

proc getTypeID*(cf: CFObject): CFTypeID {.importc: "CFGetTypeID".}
proc copyTypeIDDescription*(type_id: CFTypeID): CFString {.importc: "CFCopyTypeIDDescription".}

proc CFRetain(cf: CFObject): CFObject {.importc.}
template retain*[T: CFObject](cf: T): T = cast[T](CFRetain(cf))
proc release*(cf: CFObject) {.importc: "CFRelease".}

template toBool*(b: Boolean): bool = b == 0
template toBoolean*(b: bool): Boolean = Boolean(b)

proc CFEqual(cf1, cf2: CFObject): Boolean {.importc.}
template equal*(cf1, cf2: CFObject): bool = toBool(CFEqual(cf1, cf2))

proc hash*(cf: CFObject): CFHashCode {.importc: "CFHash".}
proc copyDescription*(cf: CFObject): CFString {.importc: "CFCopyDescription".}
proc getAllocator*(cf: CFObject): CFAllocator {.importc: "CFGetAllocator".}
