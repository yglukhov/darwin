import darwin/objc/runtime
import darwin/foundation/nsstring
import pdftypes

export pdftypes.PDFAction, pdftypes.PDFActionGoTo, pdftypes.PDFActionURL, pdftypes.PDFActionNamed, pdftypes.PDFActionResetForm, pdftypes.PDFActionJavaScript

type
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
proc actionType*(self: PDFAction): NSString {.objc.}

# PDFActionGoTo
proc destination*(self: PDFActionGoTo): NSObject {.objc.}
proc setDestination*(self: PDFActionGoTo, destination: NSObject) {.objc: "setDestination:".}

# PDFActionURL  
proc url*(self: PDFActionURL): NSObject {.objc.}
proc setUrl*(self: PDFActionURL, url: NSObject) {.objc: "setURL:".}

# PDFActionNamed
proc name*(self: PDFActionNamed): PDFActionNamedName {.objc.}
proc setName*(self: PDFActionNamed, name: PDFActionNamedName) {.objc: "setName:".}

# PDFActionResetForm
proc fieldsIncludedAreCleared*(self: PDFActionResetForm): bool {.objc.}
proc setFieldsIncludedAreCleared*(self: PDFActionResetForm, flag: bool) {.objc: "setFieldsIncludedAreCleared:".}

# PDFActionJavaScript
proc script*(self: PDFActionJavaScript): NSString {.objc.}
proc setScript*(self: PDFActionJavaScript, script: NSString) {.objc: "setScript:".}
