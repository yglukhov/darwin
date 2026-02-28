import ../objc/runtime

type
  NSCell* = ptr object of NSObject

  NSCellImagePosition* {.size: sizeof(uint).} = enum
    NSNoImage = 0
    NSImageOnly = 1
    NSImageLeft = 2
    NSImageRight = 3
    NSImageBelow = 4
    NSImageAbove = 5
    NSImageOverlaps = 6
    NSImageLeading = 7
    NSImageTrailing = 8

  NSImageScaling* {.size: sizeof(uint).} = enum
    NSImageScaleProportionallyDown
    NSImageScaleAxesIndependently
    NSImageScaleNone
    NSImageScaleProportionallyUpOrDown

  NSCellStyleMask* {.size: sizeof(uint).} = enum
    NSNoCellMask = 0
    NSContentsCellMask = 1
    NSPushInCellMask = 2
    NSChangeGrayCellMask = 4
    NSChangeBackgroundCellMask = 8