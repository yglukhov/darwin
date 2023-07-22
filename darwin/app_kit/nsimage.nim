
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
  NSImageNameQuickLookTemplate* = @"NSQuickLookTemplate"
  NSImageNameUser* = @"NSUser"
  NSImageNameUserGroup* = @"NSUserGroup"
  NSImageNameEveryone* = @"NSEveryone"
  NSImageNameUserAccounts* = @"NSUserAccounts"
  NSImageNameLockLockedTemplate* = @"NSLockLockedTemplate"
  NSImageNameLockUnlockedTemplate* = @"NSLockUnlockedTemplate"
  NSImageNameGoLeftTemplate* = @"NSGoLeftTemplate"
  NSImageNameGoRightTemplate* = @"NSGoRightTemplate"
  NSImageNameAddTemplate* = @"NSAddTemplate"
  NSImageNameRemoveTemplate* = @"NSRemoveTemplate"
  NSImageNameActionTemplate* = @"NSActionTemplate"
  NSImageNameSmartBadgeTemplate* = @"NSSmartBadgeTemplate"
  NSImageNameIconViewTemplate* = @"NSIconViewTemplate"
  NSImageNameListViewTemplate* = @"NSListViewTemplate"
  NSImageNameColumnViewTemplate* = @"NSColumnViewTemplate"
  NSImageNameFlowViewTemplate* = @"NSFlowViewTemplate"
  NSImageNamePathTemplate* = @"NSPathTemplate"
  NSImageNameInvalidDataFreestandingTemplate* = @"NSInvalidDataFreestandingTemplate"
  NSImageNameLockLocked* = @"NSLockLocked"
  NSImageNameLockUnlocked* = @"NSLockUnlocked"
  NSImageNameStopProgressTemplate* = @"NSStopProgressTemplate"
  NSImageNameStopProgressFreestandingTemplate* = @"NSStopProgressFreestandingTemplate"
  NSImageNameRefreshTemplate* = @"NSRefreshTemplate"
  NSImageNameRefreshFreestandingTemplate* = @"NSRefreshFreestandingTemplate"
  NSImageNameBonjour* = @"NSBonjour"
  NSImageNameComputer* = @"NSComputer"
  NSImageNameFolderBurnable* = @"NSFolderBurnable"
  NSImageNameFolderSmart* = @"NSFolderSmart"
  NSImageNameFolder* = @"NSFolder"
  NSImageNameNetwork* = @"NSNetwork"
  NSImageNameMobileMe* = @"NSMobileMe"
  NSImageNameMultipleDocuments* = @"NSMultipleDocuments"
  NSImageNamePreferencesGeneral* = @"NSPreferencesGeneral"
  NSImageNameAdvanced* = @"NSAdvanced"
  NSImageNameInfo* = @"NSInfo"
  NSImageNameFontPanel* = @"NSFontPanel"
  NSImageNameColorPanel* = @"NSColorPanel"
  NSImageNameUserGuest* = @"NSUserGuest"
  NSImageNameMenuOnStateTemplate* = @"NSMenuOnStateTemplate"
  NSImageNameMenuMixedStateTemplate* = @"NSMenuMixedStateTemplate"
  NSImageNameApplicationIcon* = @"NSApplicationIcon"
  NSImageNameTrashEmpty* = @"NSTrashEmpty"
  NSImageNameTrashFull* = @"NSTrashFull"
  NSImageNameHomeTemplate* = @"NSHomeTemplate"
  NSImageNameBookmarksTemplate* = @"NSBookmarksTemplate"
  NSImageNameCaution* = @"NSCaution"
  NSImageNameStatusAvailable* = @"NSStatusAvailable"
  NSImageNameStatusPartiallyAvailable* = @"NSStatusPartiallyAvailable"
  NSImageNameStatusUnavailable* = @"NSStatusUnavailable"
  NSImageNameStatusNone* = @"NSStatusNone"
  NSImageNameShareTemplate* = @"NSShareTemplate"
  NSImageNamePathArrow* = @"NSPathArrow"
