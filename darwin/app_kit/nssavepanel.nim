import ../objc/[runtime, blocks]
import ./nspanel
import ../foundation/[nsurl]
import ./nswindow

type
  NSSavePanel* = ptr object of NSPanel

proc savePanel*(self: typedesc[NSSavePanel]): NSSavePanel {.objc.}
proc beginWithCompletionHandler*(self: NSSavePanel, handler: Block[proc (r: int)]) {.objc: "beginWithCompletionHandler:".}
proc setCanCreateDirectories*(self: NSSavePanel, b: BOOL) {.objc: "setCanCreateDirectories:".}
proc setCanSelectHiddenExtension*(self: NSSavePanel, b: BOOL) {.objc: "setCanSelectHiddenExtension:".}
proc setShowsHiddenFiles*(self: NSSavePanel, b: BOOL) {.objc: "setShowsHiddenFiles:".}
proc setExtensionHidden*(self: NSSavePanel, b: BOOL) {.objc: "setExtensionHidden:".}
proc setExpanded*(self: NSSavePanel, b: BOOL) {.objc: "setExpanded:".}
proc isExpanded*(self: NSSavePanel, b: BOOL) {.objc.}
proc isExtensionHidden*(self: NSSavePanel, b: BOOL) {.objc.}
proc setNameFieldLabel*(self: NSSavePanel, b: NSString) {.objc: "setNameFieldLabel:".}
proc setNameFieldStringValue*(self: NSSavePanel, b: NSString) {.objc: "setNameFieldStringValue:".}
proc URL*(self: NSSavePanel): NSURL {.objc.}
proc beginSheetModalForWindow*(self: NSSavePanel, window: NSWindow, handler: Block[proc (r: int)]) {.objc: "beginSheetModalForWindow:completionHandler:".}
proc setTreatsFilePackagesAsDirectories*(self: NSSavePanel, b: BOOL) {.objc: "setTreatsFilePackagesAsDirectories:".}
