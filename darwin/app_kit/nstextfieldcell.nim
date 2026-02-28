import ../objc/runtime
import ./nsactioncell
import ./nscolor
import ../foundation/nsattributedstring
import ../foundation/nsstring
import ../foundation/nsarray

type
  NSTextFieldCell* = ptr object of NSActionCell

  NSTextFieldBezelStyle* {.size: sizeof(uint).} = enum
    NSTextFieldSquareBezel = 0
    NSTextFieldRoundedBezel = 1

proc backgroundColor*(self: NSTextFieldCell): NSColor {.objc: "backgroundColor".}
proc setBackgroundColor*(self: NSTextFieldCell, color: NSColor) {.objc: "setBackgroundColor:".}

proc drawsBackground*(self: NSTextFieldCell): BOOL {.objc: "drawsBackground".}
proc setDrawsBackground*(self: NSTextFieldCell, flag: BOOL) {.objc: "setDrawsBackground:".}

proc textColor*(self: NSTextFieldCell): NSColor {.objc: "textColor".}
proc setTextColor*(self: NSTextFieldCell, color: NSColor) {.objc: "setTextColor:".}

proc bezelStyle*(self: NSTextFieldCell): NSTextFieldBezelStyle {.objc: "bezelStyle".}
proc setBezelStyle*(self: NSTextFieldCell, style: NSTextFieldBezelStyle) {.objc: "setBezelStyle:".}

proc placeholderString*(self: NSTextFieldCell): NSString {.objc: "placeholderString".}
proc setPlaceholderString*(self: NSTextFieldCell, str: NSString) {.objc: "setPlaceholderString:".}

proc placeholderAttributedString*(self: NSTextFieldCell): NSAttributedString {.objc: "placeholderAttributedString".}
proc setPlaceholderAttributedString*(self: NSTextFieldCell, str: NSAttributedString) {.objc: "setPlaceholderAttributedString:".}

proc allowedInputSourceLocales*(self: NSTextFieldCell): NSArray {.objc: "allowedInputSourceLocales".}
proc setAllowedInputSourceLocales*(self: NSTextFieldCell, locales: NSArray) {.objc: "setAllowedInputSourceLocales:".}
