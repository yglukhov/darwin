import ../objc/runtime
import ../foundation/nsstring
import ../objc/blocks

type
  NSAppearance* = ptr object of NSObject
  NSAppearanceName* = NSString

# Appearance names
var
  NSAppearanceNameAqua*: NSAppearanceName
  NSAppearanceNameDarkAqua*: NSAppearanceName
  NSAppearanceNameVibrantLight*: NSAppearanceName
  NSAppearanceNameVibrantDark*: NSAppearanceName
  NSAppearanceNameAccessibilityHighContrastAqua*: NSAppearanceName
  NSAppearanceNameAccessibilityHighContrastDarkAqua*: NSAppearanceName
  NSAppearanceNameAccessibilityHighContrastVibrantLight*: NSAppearanceName
  NSAppearanceNameAccessibilityHighContrastVibrantDark*: NSAppearanceName

# Block type for appearance-based drawing
type
  NSAppearanceDrawingBlock* = proc() {.closure.}

# Class methods
proc appearanceNamed*(self: typedesc[NSAppearance], name: NSAppearanceName): NSAppearance {.objc: "appearanceNamed:".}
proc currentAppearance*(self: typedesc[NSAppearance]): NSAppearance {.objc: "currentAppearance".}

# Instance methods
proc name*(self: NSAppearance): NSAppearanceName {.objc.}
proc allowsVibrancy*(self: NSAppearance): BOOL {.objc.}

# Setting the current appearance
proc setCurrentAppearance*(self: typedesc[NSAppearance], appearance: NSAppearance) {.objc: "setCurrentAppearance:".}

# Appearance-based drawing - takes a Block
proc performAsCurrentDrawingAppearance*(self: NSAppearance, drawingBlock: Block[NSAppearanceDrawingBlock]) {.objc: "performAsCurrentDrawingAppearance:".}
proc currentDrawingAppearance*(self: typedesc[NSAppearance]): NSAppearance {.objc: "currentDrawingAppearance".}

# Appearance compatibility
proc isEqualToAppearance*(self: NSAppearance, other: NSAppearance): BOOL {.objc: "isEqualToAppearance:".}

# Convenience template for performing drawing with appearance
template performDrawing*(self: NSAppearance, body: untyped) =
  let blk = toBlock() do():
    body
  self.performAsCurrentDrawingAppearance(blk)

# Appearance for a specific name (convenience)
proc aqua*(self: typedesc[NSAppearance]): NSAppearance {.inline.} =
  self.appearanceNamed(NSAppearanceNameAqua)

proc darkAqua*(self: typedesc[NSAppearance]): NSAppearance {.inline.} =
  self.appearanceNamed(NSAppearanceNameDarkAqua)

proc vibrantLight*(self: typedesc[NSAppearance]): NSAppearance {.inline.} =
  self.appearanceNamed(NSAppearanceNameVibrantLight)

proc vibrantDark*(self: typedesc[NSAppearance]): NSAppearance {.inline.} =
  self.appearanceNamed(NSAppearanceNameVibrantDark)
