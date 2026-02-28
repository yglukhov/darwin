import ../objc/runtime
import ./nstextfield
import ./nsmenu
import ../foundation/nsarray
import ../foundation/nsstring
import ../foundation/nsgeometry

type
  NSSearchField* = ptr object of NSTextField
  NSSearchFieldRecentsAutosaveName* = NSString

# Search field bounds
proc searchTextBounds*(self: NSSearchField): NSRect {.objc: "searchTextBounds".}
proc searchButtonBounds*(self: NSSearchField): NSRect {.objc: "searchButtonBounds".}
proc cancelButtonBounds*(self: NSSearchField): NSRect {.objc: "cancelButtonBounds".}

# Recent searches
proc recentSearches*(self: NSSearchField): NSArray {.objc: "recentSearches".}
proc setRecentSearches*(self: NSSearchField, searches: NSArray) {.objc: "setRecentSearches:".}

# Autosave name
proc recentsAutosaveName*(self: NSSearchField): NSSearchFieldRecentsAutosaveName {.objc: "recentsAutosaveName".}
proc setRecentsAutosaveName*(self: NSSearchField, name: NSSearchFieldRecentsAutosaveName) {.objc: "setRecentsAutosaveName:".}

# Search menu template
proc searchMenuTemplate*(self: NSSearchField): NSMenu {.objc: "searchMenuTemplate".}
proc setSearchMenuTemplate*(self: NSSearchField, menu: NSMenu) {.objc: "setSearchMenuTemplate:".}

# Sends whole search string
proc sendsWholeSearchString*(self: NSSearchField): BOOL {.objc: "sendsWholeSearchString".}
proc setSendsWholeSearchString*(self: NSSearchField, flag: BOOL) {.objc: "setSendsWholeSearchString:".}

# Maximum recents
proc maximumRecents*(self: NSSearchField): NSInteger {.objc: "maximumRecents".}
proc setMaximumRecents*(self: NSSearchField, max: NSInteger) {.objc: "setMaximumRecents:".}

# Sends search string immediately
proc sendsSearchStringImmediately*(self: NSSearchField): BOOL {.objc: "sendsSearchStringImmediately".}
proc setSendsSearchStringImmediately*(self: NSSearchField, flag: BOOL) {.objc: "setSendsSearchStringImmediately:".}
