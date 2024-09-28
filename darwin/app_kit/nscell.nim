import ../objc/runtime

type 
  NSCell* = ptr object of NSObject
  NSImageScaling* {.size: sizeof(uint).} = enum
    NSImageScaleProportionallyDown
    NSImageScaleAxesIndependently
    NSImageScaleNone
    NSImageScaleProportionallyUpOrDown