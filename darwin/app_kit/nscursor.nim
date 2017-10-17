import ../objc/runtime

type NSCursor* = ptr object of NSObject

proc arrowCursor(n: typedesc[NSCursor]): NSCursor {.objc: "arrowCursor".}
proc IBeamCursor(n: typedesc[NSCursor]): NSCursor {.objc: "IBeamCursor".}
proc crosshairCursor(n: typedesc[NSCursor]): NSCursor {.objc: "crosshairCursor".}
proc closedHandCursor(n: typedesc[NSCursor]): NSCursor {.objc: "closedHandCursor".}
proc pointingHandCursor(n: typedesc[NSCursor]): NSCursor {.objc: "pointingHandCursor".}
proc resizeLeftCursor(n: typedesc[NSCursor]): NSCursor {.objc: "resizeLeftCursor".}
proc resizeRightCursor(n: typedesc[NSCursor]): NSCursor {.objc: "resizeRightCursor".}
proc resizeLeftRightCursor(n: typedesc[NSCursor]): NSCursor {.objc: "resizeLeftRightCursor".}
proc resizeUpCursor(n: typedesc[NSCursor]): NSCursor {.objc: "resizeUpCursor".}
proc resizeDownCursor(n: typedesc[NSCursor]): NSCursor {.objc: "resizeDownCursor".}
proc resizeUpDownCursor(n: typedesc[NSCursor]): NSCursor {.objc: "resizeUpDownCursor".}
proc disappearingItemCursor(n: typedesc[NSCursor]): NSCursor {.objc: "disappearingItemCursor".}
proc IBeamCursorForVerticalLayout(n: typedesc[NSCursor]): NSCursor {.objc: "IBeamCursorForVerticalLayout".}
proc operationNotAllowedCursor(n: typedesc[NSCursor]): NSCursor {.objc: "operationNotAllowedCursor".}
proc dragLinkCursor(n: typedesc[NSCursor]): NSCursor {.objc: "dragLinkCursor".}
proc dragCopyCursor(n: typedesc[NSCursor]): NSCursor {.objc: "dragCopyCursor".}
proc contextualMenuCursor(n: typedesc[NSCursor]): NSCursor {.objc: "contextualMenuCursor".}

proc arrowCursor*(): NSCursor {.inline.} = NSCursor.arrowCursor()
proc IBeamCursor*(): NSCursor {.inline.} = NSCursor.IBeamCursor()
proc crosshairCursor*(): NSCursor {.inline.} = NSCursor.crosshairCursor()
proc closedHandCursor*(): NSCursor {.inline.} = NSCursor.closedHandCursor()
proc pointingHandCursor*(): NSCursor {.inline.} = NSCursor.pointingHandCursor()
proc resizeLeftCursor*(): NSCursor {.inline.} = NSCursor.resizeLeftCursor()
proc resizeRightCursor*(): NSCursor {.inline.} = NSCursor.resizeRightCursor()
proc resizeLeftRightCursor*(): NSCursor {.inline.} = NSCursor.resizeLeftRightCursor()
proc resizeUpCursor*(): NSCursor {.inline.} = NSCursor.resizeUpCursor()
proc resizeDownCursor*(): NSCursor {.inline.} = NSCursor.resizeDownCursor()
proc resizeUpDownCursor*(): NSCursor {.inline.} = NSCursor.resizeUpDownCursor()
proc disappearingItemCursor*(): NSCursor {.inline.} = NSCursor.disappearingItemCursor()
proc IBeamCursorForVerticalLayout*(): NSCursor {.inline.} = NSCursor.IBeamCursorForVerticalLayout()
proc operationNotAllowedCursor*(): NSCursor {.inline.} = NSCursor.operationNotAllowedCursor()
proc dragLinkCursor*(): NSCursor {.inline.} = NSCursor.dragLinkCursor()
proc dragCopyCursor*(): NSCursor {.inline.} = NSCursor.dragCopyCursor()
proc contextualMenuCursor*(): NSCursor {.inline.} = NSCursor.contextualMenuCursor()

proc setCurrent*(c: NSCursor) {.objc: "set".}
