import ./nsresponder
import ./nsmenu
import ../objc/runtime
import ./nsevent
import ./nseventmask
import ./nswindow
import ./nsimage
import ../foundation/[nsdate, nsrunloop]

type 
  NSApplication* = ptr object of NSResponder
  NSApplicationActivationPolicy* {.size: sizeof(uint).} = enum
    NSApplicationActivationPolicyRegular
    NSApplicationActivationPolicyAccessory
    NSApplicationActivationPolicyProhibited
  NSModalSession* = ptr object of NSObject
  NSApplicationPresentationOptions* = uint

const
  NSApplicationPresentationDefault* = 0.NSApplicationPresentationOptions

var NSApp* {.importc.}: NSApplication

proc sharedApplication*(self: typedesc[NSApplication]): NSApplication {.objc.}
proc setApplicationIconImage*(self: typedesc[NSApplication], image: NSImage) {.objc: "setApplicationIconImage:".}

proc setMainMenu*(self: NSApplication, menu: NSMenu) {.objc: "setMainMenu:".}
proc mainMenu*(self: NSApplication): NSMenu {.objc.}

proc setServicesMenu*(self: NSApplication, menu: NSMenu) {.objc: "setServicesMenu:".}
proc servicesMenu*(self: NSApplication): NSMenu {.objc.}

proc setWindowsMenu*(self: NSApplication, menu: NSMenu) {.objc: "setWindowsMenu:".}
proc windowsMenu*(self: NSApplication): NSMenu {.objc.}


proc setActivationPolicy*(self: NSApplication, policy: NSApplicationActivationPolicy): BOOL {.objc: "setActivationPolicy:", discardable.}

proc activateIgnoringOtherApps*(self: NSApplication, ignoreOtherApps: BOOL) {.objc: "activateIgnoringOtherApps:", deprecated.}
proc setPresentationOptions*(self: NSApplication, options: NSApplicationPresentationOptions) {.objc: "setPresentationOptions:".}

proc activate*(self: NSApplication) {.objc.}

proc deactivate*(self: NSApplication) {.objc.}

proc run*(self: NSApplication) {.objc.}

proc running*(self: NSApplication): BOOL {.objc.}

proc finishLaunching*(self: NSApplication) {.objc.}

proc stop*(self: NSApplication, sender: ID) {.objc: "stop:".}

proc terminate*(self: NSApplication, sender: ID) {.objc: "terminate:".}

proc postEvent*(self: NSApplication, event: NSEvent, atStart: BOOL) {.objc: "postEvent:atStart:".}
proc sendEvent*(self: NSApplication, event: NSEvent) {.objc: "sendEvent:".}
proc nextEventMatchingMask*(
  self: NSApplication,
  mask: NSEventMask,
  untilDate: NSDate,
  inMode: NSRunLoopMode,
  dequeue: BOOL
): NSEvent {.objc: "nextEventMatchingMask:untilDate:inMode:dequeue:".}

# Stop the modal with a specific code
proc stopModalWithCode*(self: NSApplication, code: int) {.objc: "stopModalWithCode:".}

# Run modal for a specific window
proc runModalForWindow*(self: NSApplication, window: NSWindow): int {.objc: "runModalForWindow:".}

# End the modal session with a specific return code
proc endModalSession*(self: NSApplication, session: NSModalSession) {.objc: "endModalSession:".}

# Begin a new modal session for a specific window
proc beginModalSessionForWindow*(self: NSApplication, window: NSWindow): NSModalSession {.objc: "beginModalSessionForWindow:".}

# Run the modal session
proc runModalSession*(self: NSApplication, session: NSModalSession): int {.objc: "runModalSession:".}

# Stop a modal session and exit with a return code
proc stopModal*(self: NSApplication) {.objc: "stopModal".}

# Abort a specific modal session
proc abortModal*(self: NSApplication) {.objc: "abortModal".}

proc setDelegate*(s: NSApplication, d: NSObject) {.objc: "setDelegate:".}

proc sendAction*(s: NSApplication, a: SEL, to: ID, `from`: ID): BOOL {.objc: "sendAction:to:from:".}
