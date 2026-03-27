import ../objc/runtime
import ./nstextfieldcell
import ./nsmenu
import ../foundation/nsarray
import ../foundation/nsstring
import ../foundation/nsgeometry

type
  NSSearchFieldCell* = ptr object of NSTextFieldCell

# Menu item tags for search menu template
const
  NSSearchFieldRecentsTitleMenuItemTag* = 1000
  NSSearchFieldRecentsMenuItemTag* = 1001
  NSSearchFieldClearRecentsMenuItemTag* = 1002
  NSSearchFieldNoRecentsMenuItemTag* = 1003

# Button cells
proc searchButtonCell*(self: NSSearchFieldCell): Id {.objc: "searchButtonCell".}
proc setSearchButtonCell*(self: NSSearchFieldCell, cell: Id) {.objc: "setSearchButtonCell:".}

proc cancelButtonCell*(self: NSSearchFieldCell): Id {.objc: "cancelButtonCell".}
proc setCancelButtonCell*(self: NSSearchFieldCell, cell: Id) {.objc: "setCancelButtonCell:".}

# Reset button cells
proc resetSearchButtonCell*(self: NSSearchFieldCell) {.objc: "resetSearchButtonCell".}
proc resetCancelButtonCell*(self: NSSearchFieldCell) {.objc: "resetCancelButtonCell".}

# Rect calculations for custom layout
proc searchTextRectForBounds*(self: NSSearchFieldCell, rect: NSRect): NSRect {.objc: "searchTextRectForBounds:".}
proc searchButtonRectForBounds*(self: NSSearchFieldCell, rect: NSRect): NSRect {.objc: "searchButtonRectForBounds:".}
proc cancelButtonRectForBounds*(self: NSSearchFieldCell, rect: NSRect): NSRect {.objc: "cancelButtonRectForBounds:".}

# Search menu template
proc searchMenuTemplate*(self: NSSearchFieldCell): NSMenu {.objc: "searchMenuTemplate".}
proc setSearchMenuTemplate*(self: NSSearchFieldCell, menu: NSMenu) {.objc: "setSearchMenuTemplate:".}

# Sends whole search string
proc sendsWholeSearchString*(self: NSSearchFieldCell): BOOL {.objc: "sendsWholeSearchString".}
proc setSendsWholeSearchString*(self: NSSearchFieldCell, flag: BOOL) {.objc: "setSendsWholeSearchString:".}

# Maximum recents
proc maximumRecents*(self: NSSearchFieldCell): NSInteger {.objc: "maximumRecents".}
proc setMaximumRecents*(self: NSSearchFieldCell, max: NSInteger) {.objc: "setMaximumRecents:".}

# Recent searches
proc recentSearches*(self: NSSearchFieldCell): NSArray {.objc: "recentSearches".}
proc setRecentSearches*(self: NSSearchFieldCell, searches: NSArray) {.objc: "setRecentSearches:".}

# Autosave name
proc recentsAutosaveName*(self: NSSearchFieldCell): NSString {.objc: "recentsAutosaveName".}
proc setRecentsAutosaveName*(self: NSSearchFieldCell, name: NSString) {.objc: "setRecentsAutosaveName:".}

# Sends search string immediately
proc sendsSearchStringImmediately*(self: NSSearchFieldCell): BOOL {.objc: "sendsSearchStringImmediately".}
proc setSendsSearchStringImmediately*(self: NSSearchFieldCell, flag: BOOL) {.objc: "setSendsSearchStringImmediately:".}
