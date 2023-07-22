
import ../objc/runtime
import ../foundation/nsstring
import ../foundation/nsurl

type
  NSImage* = ptr object of NSObject
  NSBitmapImageFileType* = enum
    NSBitmapImageFileTypeTIFF
    NSBitmapImageFileTypeBMP
    NSBitmapImageFileTypeGIF
    NSBitmapImageFileTypeJPEG
    NSBitmapImageFileTypePNG
    NSBitmapImageFileTypeJPEG2000
  NSBitmapImageRep* = ptr object of NSObject
  NSImageRep* = ptr object of NSObject
  NSImageName* = NSString

proc initWithContentsOfURL*(self: NSImage, url: NSURL): NSImage {.objc: "initWithContentsOfURL:".}
proc imageNamed*(s: typedesc[NSImage]; name: NSString): NSImage {.objc: "imageNamed:".}

var
  NSImageNameQuickLookTemplate* {.importc.} : NSString
  NSImageNameUser* {.importc.} : NSString
  NSImageNameUserGroup* {.importc.} : NSString
  NSImageNameEveryone* {.importc.} : NSString
  NSImageNameUserAccounts* {.importc.} : NSString
  NSImageNameLockLockedTemplate* {.importc.} : NSString
  NSImageNameLockUnlockedTemplate* {.importc.} : NSString
  NSImageNameGoLeftTemplate* {.importc.} : NSString
  NSImageNameGoRightTemplate* {.importc.} : NSString
  NSImageNameAddTemplate* {.importc.} : NSString
  NSImageNameRemoveTemplate* {.importc.} : NSString
  NSImageNameActionTemplate* {.importc.} : NSString
  NSImageNameSmartBadgeTemplate* {.importc.} : NSString
  NSImageNameIconViewTemplate* {.importc.} : NSString
  NSImageNameListViewTemplate* {.importc.} : NSString
  NSImageNameColumnViewTemplate* {.importc.} : NSString
  NSImageNameFlowViewTemplate* {.importc.} : NSString
  NSImageNamePathTemplate* {.importc.} : NSString
  NSImageNameInvalidDataFreestandingTemplate* {.importc.} : NSString
  NSImageNameLockLocked* {.importc.} : NSString
  NSImageNameLockUnlocked* {.importc.} : NSString
  NSImageNameStopProgressTemplate* {.importc.} : NSString
  NSImageNameStopProgressFreestandingTemplate* {.importc.} : NSString
  NSImageNameRefreshTemplate* {.importc.} : NSString
  NSImageNameRefreshFreestandingTemplate* {.importc.} : NSString
  NSImageNameBonjour* {.importc.} : NSString
  NSImageNameComputer* {.importc.} : NSString
  NSImageNameFolderBurnable* {.importc.} : NSString
  NSImageNameFolderSmart* {.importc.} : NSString
  NSImageNameFolder* {.importc.} : NSString
  NSImageNameNetwork* {.importc.} : NSString
  NSImageNameMobileMe* {.importc.} : NSString
  NSImageNameMultipleDocuments* {.importc.} : NSString
  NSImageNamePreferencesGeneral* {.importc.} : NSString
  NSImageNameAdvanced* {.importc.} : NSString
  NSImageNameInfo* {.importc.} : NSString
  NSImageNameFontPanel* {.importc.} : NSString
  NSImageNameColorPanel* {.importc.} : NSString
  NSImageNameUserGuest* {.importc.} : NSString
  NSImageNameMenuOnStateTemplate* {.importc.} : NSString
  NSImageNameMenuMixedStateTemplate* {.importc.} : NSString
  NSImageNameApplicationIcon* {.importc.} : NSString
  NSImageNameTrashEmpty* {.importc.} : NSString
  NSImageNameTrashFull* {.importc.} : NSString
  NSImageNameHomeTemplate* {.importc.} : NSString
  NSImageNameBookmarksTemplate* {.importc.} : NSString
  NSImageNameCaution* {.importc.} : NSString
  NSImageNameStatusAvailable* {.importc.} : NSString
  NSImageNameStatusPartiallyAvailable* {.importc.} : NSString
  NSImageNameStatusUnavailable* {.importc.} : NSString
  NSImageNameStatusNone* {.importc.} : NSString
  NSImageNameShareTemplate* {.importc.} : NSString
  NSImageNamePathArrow* {.importc.} : NSString
