import ../objc/runtime
import ./wkuserscript

type
  WKUserContentController* = ptr object of NSObject

proc addUserScript*(self: WKUserContentController, userScript: WKUserScript): void {.objc: "addUserScript:".}
