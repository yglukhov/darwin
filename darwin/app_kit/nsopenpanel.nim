import ../objc/runtime
import ./nssavepanel
import ../foundation/[nsarray, nsurl]

type
  NSOpenPanel* = ptr object of NSSavePanel

proc openPanel*(self: typedesc[NSOpenPanel]): NSOpenPanel {.objc.}
proc setCanChooseFiles*(self: NSOpenPanel, b: BOOL) {.objc: "setCanChooseFiles:".}
proc setCanChooseDirectories*(self: NSOpenPanel, b: BOOL) {.objc: "setCanChooseDirectories:".}
proc setResolvesAliases*(self: NSOpenPanel, b: BOOL) {.objc: "setResolvesAliases:".}
proc setAllowsMultipleSelection*(self: NSOpenPanel, b: BOOL) {.objc: "setAllowsMultipleSelection:".}
proc URLs*(self: NSOpenPanel): NSArray[NSURL] {.objc.}
