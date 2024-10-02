import ../objc/runtime

type
    NSMenu* = ptr object of NSObject
    NSMenuItem* = ptr object of NSObject

proc initWithTitle*(self: NSMenu, str: NSString): NSMenu {.objc: "initWithTitle:", discardable.}

proc initWithTitle*(self: NSMenuItem, str: NSString, action: SEL, key: NSString): NSMenuItem {.objc: "initWithTitle:action:keyEquivalent:", discardable.}

proc setSubmenu*(self: NSMenuItem, menu: NSMenu)  {.objc: "setSubmenu:".}

proc addItem*(self: NSMenu, item: NSMenuItem)  {.objc: "addItem:".}
