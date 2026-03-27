import ../objc/runtime
import ../foundation/nsstring
import ../foundation/nsarray
import ../foundation/nsgeometry
import nsimage
import nsview

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

# Custom view
proc view*(self: NSToolbarItem): NSView {.objc: "view".}
proc setView*(self: NSToolbarItem, view: NSView) {.objc: "setView:".}

# Min/Max size (deprecated in macOS 10.0–12.0)
proc minSize*(self: NSToolbarItem): NSSize {.objc: "minSize", deprecated: "Deprecated in macOS 10.0–12.0. Instead, let the system automatically measure the size of the view using constraints.".}
proc setMinSize*(self: NSToolbarItem, size: NSSize) {.objc: "setMinSize:", deprecated: "Deprecated in macOS 10.0–12.0. Instead, let the system automatically measure the size of the view using constraints.".}
proc maxSize*(self: NSToolbarItem): NSSize {.objc: "maxSize", deprecated: "Deprecated in macOS 10.0–12.0. Instead, let the system automatically measure the size of the view using constraints.".}
proc setMaxSize*(self: NSToolbarItem, size: NSSize) {.objc: "setMaxSize:", deprecated: "Deprecated in macOS 10.0–12.0. Instead, let the system automatically measure the size of the view using constraints.".}
