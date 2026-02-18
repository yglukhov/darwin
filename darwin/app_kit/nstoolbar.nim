import ../objc/runtime
import ../foundation/nsstring
import ../foundation/nsarray
import nsimage

type
  NSToolbar* = ptr object of NSObject
  NSToolbarItem* = ptr object of NSObject

# NSToolbarDisplayMode enum
const
  NSToolbarDisplayModeDefault* = 0.NSInteger
  NSToolbarDisplayModeIconAndLabel* = 1.NSInteger
  NSToolbarDisplayModeIconOnly* = 2.NSInteger
  NSToolbarDisplayModeLabelOnly* = 3.NSInteger

# NSToolbarSizeMode enum
const
  NSToolbarSizeModeDefault* = 0.NSInteger
  NSToolbarSizeModeRegular* = 1.NSInteger
  NSToolbarSizeModeSmall* = 2.NSInteger

# NSToolbar class methods
proc initWithIdentifier*(self: NSToolbar, identifier: NSString): NSToolbar {.objc: "initWithIdentifier:".}

# Display and size modes
proc displayMode*(self: NSToolbar): NSInteger {.objc: "displayMode".}
proc setDisplayMode*(self: NSToolbar, mode: NSInteger) {.objc: "setDisplayMode:".}
proc sizeMode*(self: NSToolbar): NSInteger {.objc: "sizeMode".}
proc setSizeMode*(self: NSToolbar, mode: NSInteger) {.objc: "setSizeMode:".}

# Delegate
proc delegate*(self: NSToolbar): NSObject {.objc: "delegate".}
proc setDelegate*(self: NSToolbar, delegate: NSObject) {.objc: "setDelegate:".}

# Items management
proc items*(self: NSToolbar): NSArray {.objc: "items".}
proc visibleItems*(self: NSToolbar): NSArray {.objc: "visibleItems".}
proc insertItemWithItemIdentifier*(self: NSToolbar, itemIdentifier: NSString, index: NSInteger) {.objc: "insertItemWithItemIdentifier:atIndex:".}
proc removeItemAtIndex*(self: NSToolbar, index: NSInteger) {.objc: "removeItemAtIndex:".}

# User customization
proc allowsUserCustomization*(self: NSToolbar): BOOL {.objc: "allowsUserCustomization".}
proc setAllowsUserCustomization*(self: NSToolbar, flag: BOOL) {.objc: "setAllowsUserCustomization:".}
proc autosavesConfiguration*(self: NSToolbar): BOOL {.objc: "autosavesConfiguration".}
proc setAutosavesConfiguration*(self: NSToolbar, flag: BOOL) {.objc: "setAutosavesConfiguration:".}
proc runCustomizationPalette*(self: NSToolbar, sender: NSObject) {.objc: "runCustomizationPalette:".}

# Selected item (for selectable mode)
proc selectedItemIdentifier*(self: NSToolbar): NSString {.objc: "selectedItemIdentifier".}
proc setSelectedItemIdentifier*(self: NSToolbar, identifier: NSString) {.objc: "setSelectedItemIdentifier:".}

# Validation
proc validateVisibleItems*(self: NSToolbar) {.objc: "validateVisibleItems".}

# NSToolbarItem class methods
proc initWithItemIdentifier*(self: NSToolbarItem, identifier: NSString): NSToolbarItem {.objc: "initWithItemIdentifier:".}

# Item identifier
proc itemIdentifier*(self: NSToolbarItem): NSString {.objc: "itemIdentifier".}

# Image
proc image*(self: NSToolbarItem): NSImage {.objc: "image".}
proc setImage*(self: NSToolbarItem, image: NSImage) {.objc: "setImage:".}

# Target/Action
proc target*(self: NSToolbarItem): NSObject {.objc: "target".}
proc setTarget*(self: NSToolbarItem, target: NSObject) {.objc: "setTarget:".}
proc action*(self: NSToolbarItem): SEL {.objc: "action".}
proc setAction*(self: NSToolbarItem, action: SEL) {.objc: "setAction:".}

# Labels
proc label*(self: NSToolbarItem): NSString {.objc: "label".}
proc setLabel*(self: NSToolbarItem, label: NSString) {.objc: "setLabel:".}
proc paletteLabel*(self: NSToolbarItem): NSString {.objc: "paletteLabel".}
proc setPaletteLabel*(self: NSToolbarItem, label: NSString) {.objc: "setPaletteLabel:".}

# Tooltip
proc toolTip*(self: NSToolbarItem): NSString {.objc: "toolTip".}
proc setToolTip*(self: NSToolbarItem, toolTip: NSString) {.objc: "setToolTip:".}

# Enabled state
proc isEnabled*(self: NSToolbarItem): BOOL {.objc: "isEnabled".}
proc setEnabled*(self: NSToolbarItem, enabled: BOOL) {.objc: "setEnabled:".}

# Tag
proc tag*(self: NSToolbarItem): NSInteger {.objc: "tag".}
proc setTag*(self: NSToolbarItem, tag: NSInteger) {.objc: "setTag:".}

# Visibility
proc isVisible*(self: NSToolbarItem): BOOL {.objc: "isVisible".}

# Toolbar reference
proc toolbar*(self: NSToolbarItem): NSToolbar {.objc: "toolbar".}

# Toolbar delegate support
type
  ToolbarDelegate* = object of NSObject

var ToolbarDelegateClass: ObjcClass = nil
var toolbarDelegateInstance: NSObject = nil

# Forward declarations
proc toolbarAllowedItemIdentifiers*(self: ToolbarDelegate, toolbar: NSToolbar): NSArray {.cdecl.}
proc toolbarDefaultItemIdentifiers*(self: ToolbarDelegate, toolbar: NSToolbar): NSArray {.cdecl.}
proc toolbarItemForIdentifier*(self: ToolbarDelegate, toolbar: NSToolbar, itemForItemIdentifier: NSString, willBeInsertedIntoToolbar: BOOL): NSToolbarItem {.cdecl.}

proc initToolbarDelegateClass*() =
  if ToolbarDelegateClass.isNil:
    ToolbarDelegateClass = allocateClassPair(getClass("NSObject"), "ToolbarDelegate", 0)

    discard addMethod(ToolbarDelegateClass, selector("toolbarAllowedItemIdentifiers:"),
      cast[IMP](toolbarAllowedItemIdentifiers), "@@:@")
    discard addMethod(ToolbarDelegateClass, selector("toolbarDefaultItemIdentifiers:"),
      cast[IMP](toolbarDefaultItemIdentifiers), "@@:@")
    discard addMethod(ToolbarDelegateClass, selector("toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:"),
      cast[IMP](toolbarItemForIdentifier), "@@:@@B")

    registerClassPair(ToolbarDelegateClass)
    toolbarDelegateInstance = cast[NSObject](objc_msgSend(objc_msgSend(ToolbarDelegateClass, selector("alloc")), selector("init")))

proc getToolbarDelegateInstance*(): NSObject =
  if toolbarDelegateInstance.isNil:
    initToolbarDelegateClass()
  result = toolbarDelegateInstance

# Default delegate implementations (can be overridden)
proc toolbarAllowedItemIdentifiers*(self: ToolbarDelegate, toolbar: NSToolbar): NSArray {.cdecl.} =
  let arr = NSMutableArray.mutableArrayWithCapacity(1)
  arr.add(NSString.withUTF8String("ScanButton"))
  result = arr

proc toolbarDefaultItemIdentifiers*(self: ToolbarDelegate, toolbar: NSToolbar): NSArray {.cdecl.} =
  let arr = NSMutableArray.mutableArrayWithCapacity(2)
  arr.add(NSString.withUTF8String("NSToolbarFlexibleSpaceItem"))
  arr.add(NSString.withUTF8String("ScanButton"))
  result = arr

# Global callback for toolbar actions
var toolbarActionCallback*: proc() = nil

# Toolbar action handler - use this as template for custom action handlers
proc toolbarActionHandler*(self: ID, cmd: SEL, sender: ID) {.cdecl.} =
  if toolbarActionCallback != nil:
    toolbarActionCallback()

proc toolbarItemForIdentifier*(self: ToolbarDelegate, toolbar: NSToolbar, itemForItemIdentifier: NSString, willBeInsertedIntoToolbar: BOOL): NSToolbarItem {.cdecl.} =
  let identifier = itemForItemIdentifier.UTF8String
  if identifier == "ScanButton":
    var item = NSToolbarItem.alloc().initWithItemIdentifier(itemForItemIdentifier)

    let image = NSImage.imageWithSystemSymbolName(
      NSString.withUTF8String("arrow.clockwise"),
      NSString.withUTF8String("Scan")
    )
    if not image.isNil:
      image.setTemplate(YES)
      item.setImage(image)

    item.setToolTip(NSString.withUTF8String("Scan All"))
    item.setLabel(NSString.withUTF8String("Scan"))
    item.setPaletteLabel(NSString.withUTF8String("Scan All"))
    item.setTarget(getToolbarDelegateInstance())
    item.setAction(selector("toolbarActionHandler:"))

    result = item
  else:
    result = cast[NSToolbarItem](nil)

# Convenience proc to create a toolbar with a scan button
proc createScanToolbar*(): NSToolbar =
  initToolbarDelegateClass()

  var toolbar = NSToolbar.alloc().initWithIdentifier(NSString.withUTF8String("MainToolbar"))
  toolbar.setDisplayMode(NSToolbarDisplayModeIconOnly)
  toolbar.setSizeMode(NSToolbarSizeModeSmall)
  toolbar.setDelegate(getToolbarDelegateInstance())

  result = toolbar
