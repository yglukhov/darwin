import ../objc/runtime
import ./nscontrol
import ./nsview
import ./nsevent
import ../foundation/nsstring

type
  NSProgressIndicator* = ptr object of NSControl

  NSProgressIndicatorStyle* {.size: sizeof(uint).} = enum
    NSProgressIndicatorStyleBar = 0
    NSProgressIndicatorStyleSpinning = 1

# Control size
proc controlSize*(self: NSProgressIndicator): NSControlSize {.objc: "controlSize".}
proc setControlSize*(self: NSProgressIndicator, size: NSControlSize) {.objc: "setControlSize:".}

# Style
proc style*(self: NSProgressIndicator): NSProgressIndicatorStyle {.objc: "style".}
proc setStyle*(self: NSProgressIndicator, style: NSProgressIndicatorStyle) {.objc: "setStyle:".}

# Indeterminate
proc isIndeterminate*(self: NSProgressIndicator): BOOL {.objc: "isIndeterminate".}
proc setIndeterminate*(self: NSProgressIndicator, flag: BOOL) {.objc: "setIndeterminate:".}

# Bezeled
proc isBezeled*(self: NSProgressIndicator): BOOL {.objc: "isBezeled".}
proc setBezeled*(self: NSProgressIndicator, flag: BOOL) {.objc: "setBezeled:".}

# Value range
proc minValue*(self: NSProgressIndicator): cdouble {.objc: "minValue".}
proc setMinValue*(self: NSProgressIndicator, value: cdouble) {.objc: "setMinValue:".}

proc maxValue*(self: NSProgressIndicator): cdouble {.objc: "maxValue".}
proc setMaxValue*(self: NSProgressIndicator, value: cdouble) {.objc: "setMaxValue:".}

proc doubleValue*(self: NSProgressIndicator): cdouble {.objc: "doubleValue".}
proc setDoubleValue*(self: NSProgressIndicator, value: cdouble) {.objc: "setDoubleValue:".}

# Animation
proc startAnimation*(self: NSProgressIndicator, sender: Id) {.objc: "startAnimation:".}
proc stopAnimation*(self: NSProgressIndicator, sender: Id) {.objc: "stopAnimation:".}

# Displayed when stopped (for indeterminate)
proc isDisplayedWhenStopped*(self: NSProgressIndicator): BOOL {.objc: "isDisplayedWhenStopped".}
proc setDisplayedWhenStopped*(self: NSProgressIndicator, flag: BOOL) {.objc: "setDisplayedWhenStopped:".}
