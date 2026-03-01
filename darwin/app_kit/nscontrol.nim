import ../objc/runtime
import ./nsview
import ./nscell
import ./nsfont
import ./nsevent
import ./nseventmask
import ../foundation/nsstring
import ../foundation/nsattributedstring
import ../foundation/nsgeometry

type
  NSControl* = ptr object of NSView

  NSControlSize* {.size: sizeof(uint).} = enum
    NSControlSizeRegular
    NSControlSizeSmall
    NSControlSizeMini

  NSLineBreakMode* {.size: sizeof(uint).} = enum
    NSLineBreakByWordWrapping
    NSLineBreakByCharWrapping
    NSLineBreakByClipping
    NSLineBreakByTruncatingHead
    NSLineBreakByTruncatingTail
    NSLineBreakByTruncatingMiddle

  NSTextAlignment* {.size: sizeof(uint).} = enum
    NSTextAlignmentLeft
    NSTextAlignmentCenter
    NSTextAlignmentRight
    NSTextAlignmentJustified
    NSTextAlignmentNatural

  NSWritingDirection* {.size: sizeof(int).} = enum
    NSWritingDirectionNatural = -1
    NSWritingDirectionLeftToRight
    NSWritingDirectionRightToLeft

# Target and action
proc target*(self: NSControl): Id {.objc: "target".}
proc setTarget*(self: NSControl, target: Id) {.objc: "setTarget:".}

proc action*(self: NSControl): SEL {.objc: "action".}
proc setAction*(self: NSControl, action: SEL) {.objc: "setAction:".}

# Tag
proc tag*(self: NSControl): NSInteger {.objc: "tag".}
proc setTag*(self: NSControl, tag: NSInteger) {.objc: "setTag:".}

# Behavior properties
proc ignoresMultiClick*(self: NSControl): BOOL {.objc: "ignoresMultiClick".}
proc setIgnoresMultiClick*(self: NSControl, flag: BOOL) {.objc: "setIgnoresMultiClick:".}

proc isContinuous*(self: NSControl): BOOL {.objc: "isContinuous".}
proc setContinuous*(self: NSControl, flag: BOOL) {.objc: "setContinuous:".}

proc isEnabled*(self: NSControl): BOOL {.objc: "isEnabled".}
proc setEnabled*(self: NSControl, flag: BOOL) {.objc: "setEnabled:".}

proc refusesFirstResponder*(self: NSControl): BOOL {.objc: "refusesFirstResponder".}
proc setRefusesFirstResponder*(self: NSControl, flag: BOOL) {.objc: "setRefusesFirstResponder:".}

proc isHighlighted*(self: NSControl): BOOL {.objc: "isHighlighted".}
proc setHighlighted*(self: NSControl, flag: BOOL) {.objc: "setHighlighted:".}

# Control size
proc controlSize*(self: NSControl): NSControlSize {.objc: "controlSize".}
proc setControlSize*(self: NSControl, size: NSControlSize) {.objc: "setControlSize:".}

# Formatter
proc formatter*(self: NSControl): Id {.objc: "formatter".}
proc setFormatter*(self: NSControl, formatter: Id) {.objc: "setFormatter:".}

# Value properties
proc objectValue*(self: NSControl): Id {.objc: "objectValue".}
proc setObjectValue*(self: NSControl, value: Id) {.objc: "setObjectValue:".}

proc stringValue*(self: NSControl): NSString {.objc: "stringValue".}
proc setStringValue*(self: NSControl, value: NSString) {.objc: "setStringValue:".}

proc attributedStringValue*(self: NSControl): NSAttributedString {.objc: "attributedStringValue".}
proc setAttributedStringValue*(self: NSControl, value: NSAttributedString) {.objc: "setAttributedStringValue:".}

proc intValue*(self: NSControl): cint {.objc: "intValue".}
proc setIntValue*(self: NSControl, value: cint) {.objc: "setIntValue:".}

proc integerValue*(self: NSControl): NSInteger {.objc: "integerValue".}
proc setIntegerValue*(self: NSControl, value: NSInteger) {.objc: "setIntegerValue:".}

proc floatValue*(self: NSControl): cfloat {.objc: "floatValue".}
proc setFloatValue*(self: NSControl, value: cfloat) {.objc: "setFloatValue:".}

proc doubleValue*(self: NSControl): cdouble {.objc: "doubleValue".}
proc setDoubleValue*(self: NSControl, value: cdouble) {.objc: "setDoubleValue:".}

# Sizing
proc sizeThatFits*(self: NSControl, size: NSSize): NSSize {.objc: "sizeThatFits:".}
proc sizeToFit*(self: NSControl) {.objc: "sizeToFit".}

# Action sending
proc sendActionOn*(self: NSControl, mask: NSEventMask): NSInteger {.objc: "sendActionOn:".}
proc sendAction*(self: NSControl, action: SEL, to: Id): BOOL {.objc: "sendAction:to:".}

# Take value from
proc takeIntValueFrom*(self: NSControl, sender: Id) {.objc: "takeIntValueFrom:".}
proc takeFloatValueFrom*(self: NSControl, sender: Id) {.objc: "takeFloatValueFrom:".}
proc takeDoubleValueFrom*(self: NSControl, sender: Id) {.objc: "takeDoubleValueFrom:".}
proc takeStringValueFrom*(self: NSControl, sender: Id) {.objc: "takeStringValueFrom:".}
proc takeObjectValueFrom*(self: NSControl, sender: Id) {.objc: "takeObjectValueFrom:".}
proc takeIntegerValueFrom*(self: NSControl, sender: Id) {.objc: "takeIntegerValueFrom:".}

# Event handling
proc mouseDown*(self: NSControl, event: NSEvent) {.objc: "mouseDown:".}
proc performClick*(self: NSControl, sender: Id) {.objc: "performClick:".}

# Text properties
proc font*(self: NSControl): NSFont {.objc: "font".}
proc setFont*(self: NSControl, font: NSFont) {.objc: "setFont:".}

proc usesSingleLineMode*(self: NSControl): BOOL {.objc: "usesSingleLineMode".}
proc setUsesSingleLineMode*(self: NSControl, flag: BOOL) {.objc: "setUsesSingleLineMode:".}

proc lineBreakMode*(self: NSControl): NSLineBreakMode {.objc: "lineBreakMode".}
proc setLineBreakMode*(self: NSControl, mode: NSLineBreakMode) {.objc: "setLineBreakMode:".}

proc alignment*(self: NSControl): NSTextAlignment {.objc: "alignment".}
proc setAlignment*(self: NSControl, alignment: NSTextAlignment) {.objc: "setAlignment:".}

proc baseWritingDirection*(self: NSControl): NSWritingDirection {.objc: "baseWritingDirection".}
proc setBaseWritingDirection*(self: NSControl, direction: NSWritingDirection) {.objc: "setBaseWritingDirection:".}

# Expansion tool tips
proc allowsExpansionToolTips*(self: NSControl): BOOL {.objc: "allowsExpansionToolTips".}
proc setAllowsExpansionToolTips*(self: NSControl, flag: BOOL) {.objc: "setAllowsExpansionToolTips:".}

proc expansionFrameWithFrame*(self: NSControl, contentFrame: NSRect): NSRect {.objc: "expansionFrameWithFrame:".}
proc drawWithExpansionFrame*(self: NSControl, contentFrame: NSRect, inView: NSView) {.objc: "drawWithExpansionFrame:inView:".}

# Cell related (deprecated but still useful)
proc cell*(self: NSControl): NSCell {.objc: "cell".}
proc setCell*(self: NSControl, cell: NSCell) {.objc: "setCell:".}

proc selectedCell*(self: NSControl): NSCell {.objc: "selectedCell".}
proc selectedTag*(self: NSControl): NSInteger {.objc: "selectedTag".}
