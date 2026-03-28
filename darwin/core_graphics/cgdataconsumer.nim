import darwin / core_foundation / [cfbase, cfdata, cfurl]

type
    CGDataConsumer* = ptr object of CFObject

    CGDataConsumerPutBytesCallback* = proc(info: pointer, buffer: pointer, count: csize_t): csize_t {.cdecl.}
    CGDataConsumerReleaseInfoCallback* = proc(info: pointer) {.cdecl.}

    CGDataConsumerCallbacks* {.byref.} = object
        putBytes*: CGDataConsumerPutBytesCallback
        releaseConsumer*: CGDataConsumerReleaseInfoCallback

# CGDataConsumer
proc create*(T: typedesc[CGDataConsumer], info: pointer, cbks: ptr CGDataConsumerCallbacks): CGDataConsumer {.importc: "CGDataConsumerCreate".}
proc createWithURL*(T: typedesc[CGDataConsumer], url: CFURL): CGDataConsumer {.importc: "CGDataConsumerCreateWithURL".}
proc createWithCFData*(T: typedesc[CGDataConsumer], data: CFMutableData): CGDataConsumer {.importc: "CGDataConsumerCreateWithCFData".}
proc retain*(consumer: CGDataConsumer): CGDataConsumer {.importc: "CGDataConsumerRetain".}
proc release*(consumer: CGDataConsumer) {.importc: "CGDataConsumerRelease".}
proc getTypeID*(T: typedesc[CGDataConsumer]): CFTypeID {.importc: "CGDataConsumerGetTypeID".}
