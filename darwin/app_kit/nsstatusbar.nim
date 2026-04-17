import ../objc/runtime
import ./nsmenu
import ./nsimage
import ../core_graphics/cggeometry
import ./nsbutton
import ../foundation/nsgeometry
import ../foundation/nsstring
import ./nseventmask

# NSCellImagePosition (from AppKit)
type
  NSCellImagePosition* {.size: sizeof(uint).} = enum
    NSNoImage = 0
    NSImageOnly = 1
    NSImageLeft = 2
    NSImageRight = 3
    NSImageBelow = 4
    NSImageAbove = 5
    NSImageOverlaps = 6

# NSStatusBar - Menu bar icon management
type
  NSStatusBar* = ptr object of NSObject
  NSStatusItem* = ptr object of NSObject
  NSStatusBarButton* = ptr object of NSButton
  NSStatusItemBehavior* {.size: sizeof(uint).} = enum
    RemovalAllowed = 1 shl 1
    TerminationOnRemoval = 1 shl 2

# NSStatusBar class methods
proc systemStatusBar*(self: typedesc[NSStatusBar]): NSStatusBar {.objc: "systemStatusBar".}

# NSStatusBar instance methods
proc statusItemWithLength*(self: NSStatusBar, length: CGFloat): NSStatusItem {.objc: "statusItemWithLength:".}
proc removeStatusItem*(self: NSStatusBar, item: NSStatusItem) {.objc: "removeStatusItem:".}
proc isVertical*(self: NSStatusBar): BOOL {.objc.}
proc thickness*(self: NSStatusBar): CGFloat {.objc.}

# NSStatusBar length constants
const
  NSVariableStatusItemLength*: CGFloat = -1.0
  NSSquareStatusItemLength*: CGFloat = -2.0

# NSStatusItem properties
proc statusBar*(self: NSStatusItem): NSStatusBar {.objc.}
proc button*(self: NSStatusItem): NSStatusBarButton {.objc.}
proc menu*(self: NSStatusItem): NSMenu {.objc.}
proc `menu=`*(self: NSStatusItem, menu: NSMenu) {.objc: "setMenu:".}
proc visible*(self: NSStatusItem): BOOL {.objc.}
proc `visible=`*(self: NSStatusItem, visible: BOOL) {.objc: "setVisible:".}
proc behavior*(self: NSStatusItem): NSStatusItemBehavior {.objc.}
proc `behavior=`*(self: NSStatusItem, behavior: NSStatusItemBehavior) {.objc: "setBehavior:".}
proc autosaveName*(self: NSStatusItem): NSString {.objc.}
proc `autosaveName=`*(self: NSStatusItem, name: NSString) {.objc: "setAutosaveName:".}

# NSStatusBarButton - Modern API (10.10+)
proc image*(self: NSStatusBarButton): NSImage {.objc.}
proc `image=`*(self: NSStatusBarButton, image: NSImage) {.objc: "setImage:".}
proc title*(self: NSStatusBarButton): NSString {.objc.}
proc `title=`*(self: NSStatusBarButton, title: NSString) {.objc: "setTitle:".}
proc imagePosition*(self: NSStatusBarButton): NSCellImagePosition {.objc.}
proc `imagePosition=`*(self: NSStatusBarButton, position: NSCellImagePosition) {.objc: "setImagePosition:".}
proc appearsDisabled*(self: NSStatusBarButton): BOOL {.objc.}
proc `appearsDisabled=`*(self: NSStatusBarButton, disabled: BOOL) {.objc: "setAppearsDisabled:".}

# Legacy NSStatusItem API (pre-10.10)
proc image*(self: NSStatusItem): NSImage {.objc.}
proc `image=`*(self: NSStatusItem, image: NSImage) {.objc: "setImage:".}
proc title*(self: NSStatusItem): NSString {.objc.}
proc `title=`*(self: NSStatusItem, title: NSString) {.objc: "setTitle:".}
proc toolTip*(self: NSStatusItem): NSString {.objc.}
proc `toolTip=`*(self: NSStatusItem, toolTip: NSString) {.objc: "setToolTip:".}
proc highlighted*(self: NSStatusItem): BOOL {.objc.}
proc `highlighted=`*(self: NSStatusItem, highlighted: BOOL) {.objc: "setHighlighted:".}
proc enabled*(self: NSStatusItem): BOOL {.objc.}
proc `enabled=`*(self: NSStatusItem, enabled: BOOL) {.objc: "setEnabled:".}
proc doubleAction*(self: NSStatusItem): SEL {.objc.}
proc `doubleAction=`*(self: NSStatusItem, action: SEL) {.objc: "setDoubleAction:".}
proc target*(self: NSStatusItem): NSObject {.objc.}
proc `target=`*(self: NSStatusItem, target: NSObject) {.objc: "setTarget:".}
proc sendActionOn*(self: NSStatusItem, mask: NSEventMask): NSInteger {.objc: "sendActionOn:".}
proc popUpStatusItemMenu*(self: NSStatusItem, menu: NSMenu) {.objc: "popUpStatusItemMenu:".}
proc drawStatusBarBackgroundInRect*(self: NSStatusItem, rect: NSRect, highlight: BOOL) {.objc: "drawStatusBarBackgroundInRect:withHighlight:".}
proc length*(self: NSStatusItem): CGFloat {.objc.}
proc `length=`*(self: NSStatusItem, length: CGFloat) {.objc: "setLength:".}
