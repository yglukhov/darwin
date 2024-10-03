import ../objc/[runtime, blocks]
import ../foundation/[nsstring, nsdictionary, nsarray]
import ../app_kit/[nsimage, nsview, nswindow]
import ./nsbutton

const 
  NSModalResponseOK*          = 1
  NSModalResponseCancel*      = 0
  NSModalResponseContinue*    = -1002
  NSModalResponseStop*        = -1000
  NSModalResponseAbort*       = -1001
  NSAlertFirstButtonReturn*   = 1000
  NSAlertSecondButtonReturn*  = 1001
  NSAlertThirdButtonReturn*   = 1002

type 
  NSAlert* = ptr object of NSObject
  NSAlertStyle* {.size: sizeof(uint).} = enum
    NSAlertStyleWarning = 0
    NSAlertStyleInformational = 1
    NSAlertStyleCritical = 2

# Properties
proc messageText*(self: NSAlert): NSString {.objc: "messageText".}
proc setMessageText*(self: NSAlert, text: NSString) {.objc: "setMessageText:".}
proc informativeText*(self: NSAlert): NSString {.objc: "informativeText".}
proc setInformativeText*(self: NSAlert, text: NSString) {.objc: "setInformativeText:".}
proc alertStyle*(self: NSAlert): NSAlertStyle {.objc: "alertStyle".}
proc setAlertStyle*(self: NSAlert, style: NSAlertStyle) {.objc: "setAlertStyle:".}
proc showsHelp*(self: NSAlert): BOOL {.objc: "showsHelp".}
proc setShowsHelp*(self: NSAlert, show: BOOL) {.objc: "setShowsHelp:".}
proc helpAnchor*(self: NSAlert): NSString {.objc: "helpAnchor".}
proc setHelpAnchor*(self: NSAlert, anchor: NSString) {.objc: "setHelpAnchor:".}

# Buttons
proc addButtonWithTitle*(self: NSAlert, title: NSString) {.objc: "addButtonWithTitle:".}
proc buttons*(self: NSAlert): NSArray[NSButton] {.objc: "buttons".}

# Optional icon
proc setIcon*(self: NSAlert, icon: NSImage) {.objc: "setIcon:".}
proc icon*(self: NSAlert): NSImage {.objc: "icon".}

# Optional accessory view
proc setAccessoryView*(self: NSAlert, view: NSView) {.objc: "setAccessoryView:".}
proc accessoryView*(self: NSAlert): NSView {.objc: "accessoryView".}

# Suppression button
proc showsSuppressionButton*(self: NSAlert): BOOL {.objc: "showsSuppressionButton".}
proc setShowsSuppressionButton*(self: NSAlert, show: BOOL) {.objc: "setShowsSuppressionButton:".}
proc suppressionButton*(self: NSAlert): NSButton {.objc: "suppressionButton".}

# Modal presentation
proc runModal*(self: NSAlert): NSInteger {.objc: "runModal", discardable.}
proc beginSheetModalForWindow*(self: NSAlert, window: NSWindow, handler: Block[proc (r: NSInteger)]) {.objc: "beginSheetModalForWindow:completionHandler:".}

# Access user dictionary
proc userInfo*(self: NSAlert): NSDictionary {.objc: "userInfo".}

# Handling custom help actions
proc setHelpHandler*(self: NSAlert, handler: Block[proc]): void {.objc: "setHelpHandler:".}
