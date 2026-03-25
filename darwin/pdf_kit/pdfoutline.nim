import darwin/objc/runtime
import darwin/foundation/nsstring
import pdfdocument

type
  PDFOutline* = ptr object of NSObject
  PDFDestination* = ptr object of NSObject
  PDFAction* = ptr object of NSObject

# Document
proc document*(self: PDFOutline): PDFDocument {.objc.}

# Label
proc label*(self: PDFOutline): NSString {.objc.}
proc setLabel*(self: PDFOutline, label: NSString) {.objc: "setLabel:".}

# Destination
proc destination*(self: PDFOutline): PDFDestination {.objc.}
proc setDestination*(self: PDFOutline, destination: PDFDestination) {.objc: "setDestination:".}

# Action
proc action*(self: PDFOutline): PDFAction {.objc.}
proc setAction*(self: PDFOutline, action: PDFAction) {.objc: "setAction:".}

# Hierarchy
proc parent*(self: PDFOutline): PDFOutline {.objc.}
proc numberOfChildren*(self: PDFOutline): NSUInteger {.objc.}
proc childAtIndex*(self: PDFOutline, index: NSUInteger): PDFOutline {.objc: "childAtIndex:".}
proc insertChildAtIndex*(self: PDFOutline, child: PDFOutline, index: NSUInteger) {.objc: "insertChild:atIndex:".}
proc removeFromParent*(self: PDFOutline) {.objc.}
proc index*(self: PDFOutline): NSUInteger {.objc.}

# Open state
proc isOpen*(self: PDFOutline): bool {.objc.}
proc setIsOpen*(self: PDFOutline, isOpen: bool) {.objc: "setIsOpen:".}


