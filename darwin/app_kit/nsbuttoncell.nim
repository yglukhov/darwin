import ../objc/runtime
import ./nsactioncell
import ./nscell
import ./nsimage
import ./nscolor
import ./nsevent
import ./nssound
import ./nsview
import ../foundation/nsstring
import ../foundation/nsattributedstring
import ../foundation/nsgeometry

type
  NSButtonCell* = ptr object of NSActionCell

  NSButtonType* {.size: sizeof(uint).} = enum
    NSButtonTypeMomentaryLight = 0
    NSButtonTypePushOnPushOff = 1
    NSButtonTypeToggle = 2
    NSButtonTypeSwitch = 3
    NSButtonTypeRadio = 4
    NSButtonTypeMomentaryChange = 5
    NSButtonTypeOnOff = 6
    NSButtonTypeMomentaryPushIn = 7
    NSButtonTypeAccelerator = 8
    NSButtonTypeMultiLevelAccelerator = 9

  NSBezelStyle* {.size: sizeof(uint).} = enum
    NSBezelStyleAutomatic = 0
    NSBezelStylePush = 1
    NSBezelStyleFlexiblePush = 2
    NSBezelStyleDisclosure = 5
    NSBezelStyleCircular = 7
    NSBezelStyleHelpButton = 9
    NSBezelStyleSmallSquare = 10
    NSBezelStyleToolbar = 11
    NSBezelStyleAccessoryBarAction = 12
    NSBezelStyleAccessoryBar = 13
    NSBezelStylePushDisclosure = 14
    NSBezelStyleBadge = 15

# Bezel style
proc bezelStyle*(self: NSButtonCell): NSBezelStyle {.objc: "bezelStyle".}
proc setBezelStyle*(self: NSButtonCell, style: NSBezelStyle) {.objc: "setBezelStyle:".}

# Button type
proc setButtonType*(self: NSButtonCell, typ: NSButtonType) {.objc: "setButtonType:".}

# Highlights and shows state
proc highlightsBy*(self: NSButtonCell): NSCellStyleMask {.objc: "highlightsBy".}
proc setHighlightsBy*(self: NSButtonCell, mask: NSCellStyleMask) {.objc: "setHighlightsBy:".}

proc showsStateBy*(self: NSButtonCell): NSCellStyleMask {.objc: "showsStateBy".}
proc setShowsStateBy*(self: NSButtonCell, mask: NSCellStyleMask) {.objc: "setShowsStateBy:".}

# Title
proc title*(self: NSButtonCell): NSString {.objc: "title".}
proc setTitle*(self: NSButtonCell, title: NSString) {.objc: "setTitle:".}

proc attributedTitle*(self: NSButtonCell): NSAttributedString {.objc: "attributedTitle".}
proc setAttributedTitle*(self: NSButtonCell, title: NSAttributedString) {.objc: "setAttributedTitle:".}

# Alternate title
proc alternateTitle*(self: NSButtonCell): NSString {.objc: "alternateTitle".}
proc setAlternateTitle*(self: NSButtonCell, title: NSString) {.objc: "setAlternateTitle:".}

proc attributedAlternateTitle*(self: NSButtonCell): NSAttributedString {.objc: "attributedAlternateTitle".}
proc setAttributedAlternateTitle*(self: NSButtonCell, title: NSAttributedString) {.objc: "setAttributedAlternateTitle:".}

# Image
proc alternateImage*(self: NSButtonCell): NSImage {.objc: "alternateImage".}
proc setAlternateImage*(self: NSButtonCell, image: NSImage) {.objc: "setAlternateImage:".}

# Image position and scaling
proc imagePosition*(self: NSButtonCell): NSCellImagePosition {.objc: "imagePosition".}
proc setImagePosition*(self: NSButtonCell, position: NSCellImagePosition) {.objc: "setImagePosition:".}

proc imageScaling*(self: NSButtonCell): NSImageScaling {.objc: "imageScaling".}
proc setImageScaling*(self: NSButtonCell, scaling: NSImageScaling) {.objc: "setImageScaling:".}

# Key equivalent
proc keyEquivalent*(self: NSButtonCell): NSString {.objc: "keyEquivalent".}
proc setKeyEquivalent*(self: NSButtonCell, key: NSString) {.objc: "setKeyEquivalent:".}

proc keyEquivalentModifierMask*(self: NSButtonCell): NSEventModifierFlags {.objc: "keyEquivalentModifierMask".}
proc setKeyEquivalentModifierMask*(self: NSButtonCell, mask: NSEventModifierFlags) {.objc: "setKeyEquivalentModifierMask:".}

# Properties
proc isTransparent*(self: NSButtonCell): BOOL {.objc: "isTransparent".}
proc setTransparent*(self: NSButtonCell, flag: BOOL) {.objc: "setTransparent:".}

proc imageDimsWhenDisabled*(self: NSButtonCell): BOOL {.objc: "imageDimsWhenDisabled".}
proc setImageDimsWhenDisabled*(self: NSButtonCell, flag: BOOL) {.objc: "setImageDimsWhenDisabled:".}

proc showsBorderOnlyWhileMouseInside*(self: NSButtonCell): BOOL {.objc: "showsBorderOnlyWhileMouseInside".}
proc setShowsBorderOnlyWhileMouseInside*(self: NSButtonCell, flag: BOOL) {.objc: "setShowsBorderOnlyWhileMouseInside:".}

# Sound
proc sound*(self: NSButtonCell): NSSound {.objc: "sound".}
proc setSound*(self: NSButtonCell, sound: NSSound) {.objc: "setSound:".}

# Background color
proc backgroundColor*(self: NSButtonCell): NSColor {.objc: "backgroundColor".}
proc setBackgroundColor*(self: NSButtonCell, color: NSColor) {.objc: "setBackgroundColor:".}

# Periodic delay
proc setPeriodicDelay*(self: NSButtonCell, delay: cfloat, interval: cfloat) {.objc: "setPeriodicDelay:interval:".}
proc getPeriodicDelay*(self: NSButtonCell, delay: ptr cfloat, interval: ptr cfloat) {.objc: "getPeriodicDelay:interval:".}

# Actions
proc performClick*(self: NSButtonCell, sender: Id) {.objc: "performClick:".}
proc mouseEntered*(self: NSButtonCell, event: NSEvent) {.objc: "mouseEntered:".}
proc mouseExited*(self: NSButtonCell, event: NSEvent) {.objc: "mouseExited:".}

# Drawing
proc drawBezelWithFrame*(self: NSButtonCell, frame: NSRect, inView: NSView) {.objc: "drawBezelWithFrame:inView:".}
proc drawImage*(self: NSButtonCell, image: NSImage, withFrame: NSRect, inView: NSView) {.objc: "drawImage:withFrame:inView:".}
proc drawTitle*(self: NSButtonCell, title: NSAttributedString, withFrame: NSRect, inView: NSView): NSRect {.objc: "drawTitle:withFrame:inView:".}
