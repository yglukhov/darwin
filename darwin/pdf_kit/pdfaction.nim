import darwin/objc/runtime
import darwin/foundation/nsstring

type
  PDFActionObj* = ptr object of NSObject
  PDFActionGoToObj* = ptr object of PDFActionObj
  PDFActionURLObj* = ptr object of PDFActionObj
  PDFActionNamedObj* = ptr object of PDFActionObj
  PDFActionResetFormObj* = ptr object of PDFActionObj
  PDFActionJavaScriptObj* = ptr object of PDFActionObj

  PDFActionNamedName* {.size: sizeof(uint).} = enum
    kPDFActionNamedNone = 0
    kPDFActionNamedNextPage = 1
    kPDFActionNamedPreviousPage = 2
    kPDFActionNamedFirstPage = 3
    kPDFActionNamedLastPage = 4
    kPDFActionNamedGoBack = 5
    kPDFActionNamedGoForward = 6
    kPDFActionNamedGoToPage = 7
    kPDFActionNamedFind = 8
    kPDFActionNamedPrint = 9
    kPDFActionNamedZoomIn = 10
    kPDFActionNamedZoomOut = 11
    kPDFActionNamedZoomFitIn = 12
    kPDFActionNamedZoomFitOut = 13

# Type
proc actionType*(self: PDFActionObj): NSString {.objc.}

# PDFActionGoTo
proc destination*(self: PDFActionGoToObj): NSObject {.objc.}
proc setDestination*(self: PDFActionGoToObj, destination: NSObject) {.objc: "setDestination:".}

# PDFActionURL  
proc url*(self: PDFActionURLObj): NSObject {.objc.}
proc setUrl*(self: PDFActionURLObj, url: NSObject) {.objc: "setURL:".}

# PDFActionNamed
proc name*(self: PDFActionNamedObj): PDFActionNamedName {.objc.}
proc setName*(self: PDFActionNamedObj, name: PDFActionNamedName) {.objc: "setName:".}

# PDFActionResetForm
proc fieldsIncludedAreCleared*(self: PDFActionResetFormObj): bool {.objc.}
proc setFieldsIncludedAreCleared*(self: PDFActionResetFormObj, flag: bool) {.objc: "setFieldsIncludedAreCleared:".}

# PDFActionJavaScript
proc script*(self: PDFActionJavaScriptObj): NSString {.objc.}
proc setScript*(self: PDFActionJavaScriptObj, script: NSString) {.objc: "setScript:".}

# Type aliases for easier use
type
  PDFAction* = PDFActionObj
  PDFActionGoTo* = PDFActionGoToObj
  PDFActionURL* = PDFActionURLObj
  PDFActionNamed* = PDFActionNamedObj
  PDFActionResetForm* = PDFActionResetFormObj
  PDFActionJavaScript* = PDFActionJavaScriptObj
