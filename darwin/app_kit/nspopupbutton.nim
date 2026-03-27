import ../objc/[runtime]
import ../foundation/[nsstring, nsarray, nsgeometry]
import ./nscontrol

type
  NSPopUpButton* = ptr object of NSControl

# Initialization
proc initWithFrame*(self: NSPopUpButton, frame: NSRect, pullsDown: BOOL): NSPopUpButton {.objc: "initWithFrame:pullsDown:".}

# Menu management
proc removeAllItems*(self: NSPopUpButton) {.objc: "removeAllItems".}
proc addItemWithTitle*(self: NSPopUpButton, title: NSString) {.objc: "addItemWithTitle:".}
proc insertItemWithTitle*(self: NSPopUpButton, title: NSString, atIndex: NSInteger) {.objc: "insertItemWithTitle:atIndex:".}

# Item access
proc itemTitles*(self: NSPopUpButton): NSArray {.objc: "itemTitles".}
proc numberOfItems*(self: NSPopUpButton): NSInteger {.objc: "numberOfItems".}

# Selection
proc indexOfSelectedItem*(self: NSPopUpButton): NSInteger {.objc: "indexOfSelectedItem".}
proc selectItemAtIndex*(self: NSPopUpButton, index: NSInteger) {.objc: "selectItemAtIndex:".}
proc selectedItem*(self: NSPopUpButton): NSObject {.objc: "selectedItem".}

# Title
proc titleOfSelectedItem*(self: NSPopUpButton): NSString {.objc: "titleOfSelectedItem".}

# Pulls down mode (NO = normal popup, YES = pull-down menu)
proc pullsDown*(self: NSPopUpButton): BOOL {.objc: "pullsDown".}
proc setPullsDown*(self: NSPopUpButton, pullsDown: BOOL) {.objc: "setPullsDown:".}
