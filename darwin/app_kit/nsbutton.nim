import ../objc/[runtime]
import ../foundation/[nsstring]
import ./nscontrol
import ../app_kit/[nsimage, nsview]

type
  NSButton* = ptr object of NSControl

# Enum for NSButton type
type
  NSButtonType* {.size: sizeof(uint).} = enum
    NSButtonTypeMomentaryLight = 0,
    NSButtonTypePush = 1,
    NSButtonTypeToggle = 2,
    NSButtonTypeSwitch = 3,
    NSButtonTypeRadio = 4,
    NSButtonTypeMomentaryChange = 5,
    NSButtonTypeOnOff = 6,
    NSButtonTypeAccelerator = 7,
    NSButtonTypeMultiLevelAccelerator = 8

# Enum for NSControlState
type
  NSControlStateValue* {.size: sizeof(int).} = enum
    NSControlStateValueMixed = -1,
    NSControlStateValueOff = 0,
    NSControlStateValueOn = 1

# Button title and image
proc title*(self: NSButton): NSString {.objc: "title".}
proc setTitle*(self: NSButton, title: NSString) {.objc: "setTitle:".}
proc alternateTitle*(self: NSButton): NSString {.objc: "alternateTitle".}
proc setAlternateTitle*(self: NSButton, title: NSString) {.objc: "setAlternateTitle:".}
proc image*(self: NSButton): NSImage {.objc: "image".}
proc setImage*(self: NSButton, image: NSImage) {.objc: "setImage:".}
proc alternateImage*(self: NSButton): NSImage {.objc: "alternateImage".}
proc setAlternateImage*(self: NSButton, image: NSImage) {.objc: "setAlternateImage:".}

# Button state and type
proc state*(self: NSButton): NSControlStateValue {.objc: "state".}
proc setState*(self: NSButton, state: NSControlStateValue) {.objc: "setState:".}
proc buttonType*(self: NSButton): NSButtonType {.objc: "buttonType".}
proc setButtonType*(self: NSButton, buttonType: NSButtonType) {.objc: "setButtonType:".}

# Bezel style
proc bezelStyle*(self: NSButton): NSInteger {.objc: "bezelStyle".}
proc setBezelStyle*(self: NSButton, style: NSInteger) {.objc: "setBezelStyle:".}

# Target-action mechanism
proc setTarget*(self: NSButton, target: NSObject) {.objc: "setTarget:".}
proc setAction*(self: NSButton, action: SEL) {.objc: "setAction:".}

# Button properties
proc setEnabled*(self: NSButton, enabled: BOOL) {.objc: "setEnabled:".}
proc isEnabled*(self: NSButton): BOOL {.objc: "isEnabled".}
