
import darwin / core_foundation / [cfbase, cfarray, cfrunloop]

type
  FSEventStream* = distinct pointer
  FSEventStreamEventId* = distinct culonglong

  FSEventStreamCreateFlags* = distinct cuint
  FSEventStreamCreateFlag* {.pure, size: sizeof(cuint).} = enum
    UseCFTypes
    NoDefer
    WatchRoot
    IgnoreSelf
    FileEvents
    MarkSelf
    FullHistory
    UseExtendedData
    WithDocID

  FSEventStreamEventFlags* = distinct cuint
  FSEventStreamEventFlag* {.pure, size: sizeof(cuint).} = enum
    MustScanSubDirs = 0      # 0x00000001 (1 << 0)
    UserDropped = 1          # 0x00000002 (1 << 1)
    KernelDropped = 2        # 0x00000004 (1 << 2)
    EventIdsWrapped = 3      # 0x00000008 (1 << 3)
    HistoryDone = 4          # 0x00000010 (1 << 4)
    RootChanged = 5          # 0x00000020 (1 << 5)
    Mount = 6                # 0x00000040 (1 << 6)
    Unmount = 7              # 0x00000080 (1 << 7)
    ItemCreated = 8          # 0x00000100 (1 << 8)
    ItemRemoved = 9          # 0x00000200 (1 << 9)
    ItemInodeMetaMod = 10    # 0x00000400 (1 << 10)
    ItemRenamed = 11         # 0x00000800 (1 << 11)
    ItemModified = 12        # 0x00001000 (1 << 12)
    ItemFinderInfoMod = 13   # 0x00002000 (1 << 13)
    ItemChangeOwner = 14     # 0x00004000 (1 << 14)
    ItemXattrMod = 15        # 0x00008000 (1 << 15)
    ItemIsFile = 16          # 0x00010000 (1 << 16)
    ItemIsDir = 17           # 0x00020000 (1 << 17)
    ItemIsSymlink = 18       # 0x00040000 (1 << 18)
    OwnEvent = 19            # 0x00080000 (1 << 19)
    ItemIsHardlink = 20      # 0x00100000 (1 << 20)
    ItemIsLastHardlink = 21  # 0x00200000 (1 << 21)
    ItemCloned = 22          # 0x00400000 (1 << 22)

  FSEventStreamContext* {.bycopy, final.} = object
    version*: CFIndex
    info*: pointer
    retain*: pointer
    release*: pointer
    copyDescription*: pointer

const
  kFSEventStreamEventIdSinceNow* = 0xFFFFFFFFFFFFFFFF'u64

  kFSEventStreamCreateFlagNone*: set[FSEventStreamCreateFlag] = {}
  kFSEventStreamEventFlagNone*: set[FSEventStreamEventFlag] = {}

# FSEvents Functions
proc FSEventStreamCreate*(
  allocator: CFAllocator, 
  callback: proc (
    streamRef: FSEventStream,
    clientCallBackInfo: pointer,
    numEvents: csize_t,
    eventPaths: pointer,
    eventFlags: ptr FSEventStreamEventFlags,
    eventIds: ptr FSEventStreamEventId,
  ) {.cdecl.},
  context: ptr FSEventStreamContext,
  pathsToWatch: CFArray,
  sinceWhen: FSEventStreamEventId,
  latency: CFTimeInterval,
  flags: FSEventStreamCreateFlags
): FSEventStream {.importc.}

proc FSEventStreamScheduleWithRunLoop*(
  streamRef: FSEventStream,
  runLoop: CFRunLoop,
  runLoopMode: CFRunLoopMode
) {.importc.}

proc FSEventStreamStart*(streamRef: FSEventStream): bool {.importc.}
proc FSEventStreamStop*(streamRef: FSEventStream) {.importc.}
proc FSEventStreamInvalidate*(streamRef: FSEventStream) {.importc.}
proc FSEventStreamRelease*(streamRef: FSEventStream) {.importc.}

proc createBasicDefaultCFAllocator*(): CFAllocator =
  ## creates a simple alloctor using Nim's standard allocators
  proc dmonCfMalloc(allocSize: CFIndex, hint: CFOptionFlags, info: pointer): pointer {.cdecl.} =
    result = allocShared0(allocSize.csize_t)

  proc dmonCfFree(pt: pointer, info: pointer) {.cdecl.} =
    if pt != nil:
      deallocShared(pt)

  proc dmonCfRealloc(pt: pointer, newsize: CFIndex, hint: CFOptionFlags, 
                    info: pointer): pointer {.cdecl.} =
    result = reallocShared(pt, newsize.csize_t)

  var ctx = CFAllocatorContext(
    version: 0,
    info: nil,
    retain: nil,
    release: nil,
    copyDescription: nil,
    allocate: dmonCfMalloc,
    reallocate: dmonCfRealloc,
    deallocate: dmonCfFree,
    preferredSize: nil
  )
  
  result = CFAllocatorCreate(nil.CFAllocator, ctx)

