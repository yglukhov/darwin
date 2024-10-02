import ./nsresponder
import ./nsmenu
import ../objc/runtime
import ./nsevent

type 
  NSApplication* = ptr object of NSResponder
  NSApplicationActivationPolicy* {.size: sizeof(uint).} = enum
    NSApplicationActivationPolicyRegular
    NSApplicationActivationPolicyAccessory
    NSApplicationActivationPolicyProhibited

var NSApp* {.importc.}: pointer

proc sharedApplication*(self: typedesc[NSApplication]): NSApplication {.objc.}

proc setMainMenu*(self: NSApplication, menu: NSMenu) {.objc: "setMainMenu:".}

proc setActivationPolicy*(self: NSApplication, policy: NSApplicationActivationPolicy): BOOL {.objc: "setActivationPolicy:", discardable.}

proc activateIgnoringOtherApps*(self: NSApplication, ignoreOtherApps: BOOL) {.objc: "activateIgnoringOtherApps:", deprecated.}

proc activate*(self: NSApplication) {.objc.}

proc deactivate*(self: NSApplication) {.objc.}

proc run*(self: NSApplication) {.objc.}

proc running*(self: NSApplication): BOOL {.objc.}

proc finishLaunching*(self: NSApplication) {.objc.}

proc stop*(self: NSApplication, sender: ID) {.objc: "stop:".}

proc terminate*(self: NSApplication, sender: ID) {.objc: "terminate:".}

proc postEvent*(self: NSApplication, event: NSEvent, atStart: BOOL) {.objc: "postEvent:atStart:".}
