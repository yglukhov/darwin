import darwin/objc/runtime
import darwin/foundation/nsstring
import pdfdocument

type
  PDFOutlineObj* = ptr object of NSObject
  PDFDestination* = ptr object of NSObject
  PDFAction* = ptr object of NSObject

# Document
proc document*(self: PDFOutlineObj): PDFDocument {.objc.}

# Label
proc label*(self: PDFOutlineObj): NSString {.objc.}
proc setLabel*(self: PDFOutlineObj, label: NSString) {.objc: "setLabel:".}

# Destination
proc destination*(self: PDFOutlineObj): PDFDestination {.objc.}
proc setDestination*(self: PDFOutlineObj, destination: PDFDestination) {.objc: "setDestination:".}

# Action
proc action*(self: PDFOutlineObj): PDFAction {.objc.}
proc setAction*(self: PDFOutlineObj, action: PDFAction) {.objc: "setAction:".}

# Hierarchy
proc parent*(self: PDFOutlineObj): PDFOutlineObj {.objc.}
proc numberOfChildren*(self: PDFOutlineObj): NSUInteger {.objc.}
proc childAtIndex*(self: PDFOutlineObj, index: NSUInteger): PDFOutlineObj {.objc: "childAtIndex:".}
proc insertChildAtIndex*(self: PDFOutlineObj, child: PDFOutlineObj, index: NSUInteger) {.objc: "insertChild:atIndex:".}
proc removeFromParent*(self: PDFOutlineObj) {.objc.}
proc index*(self: PDFOutlineObj): NSUInteger {.objc.}

# Open state
proc isOpen*(self: PDFOutlineObj): bool {.objc.}
proc setIsOpen*(self: PDFOutlineObj, isOpen: bool) {.objc: "setIsOpen:".}

# Type alias for easier use
type PDFOutline* = PDFOutlineObj
