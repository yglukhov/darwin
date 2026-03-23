import darwin/objc/runtime
import darwin/foundation/[nsstring, nsarray, nsgeometry, nsattributedstring, nsdate, nsnumber]
import darwin/core_graphics/[cggeometry, cgcontext]
import pdfdocument
import pdfpage

type
  PDFAnnotationObj* = ptr object of NSObject
  PDFBorder* = ptr object of NSObject
  PDFAction* = ptr object of NSObject

  PDFLineStyle* {.size: sizeof(uint).} = enum
    kPDFLineStyleNone = 0
    kPDFLineStyleSquare = 1
    kPDFLineStyleCircle = 2
    kPDFLineStyleDiamond = 3
    kPDFLineStyleOpenArrow = 4
    kPDFLineStyleClosedArrow = 5

  PDFTextAlignment* {.size: sizeof(uint).} = enum
    kPDFTextAlignmentLeft = 0
    kPDFTextAlignmentCenter = 1
    kPDFTextAlignmentRight = 2

  PDFAnnotationSubtype* = NSString

  PDFAnnotationWidgetSubtype* = NSString

# Creation
proc initWithBounds*(self: PDFAnnotationObj, bounds: NSRect): PDFAnnotationObj {.objc: "initWithBounds:".}

# Properties
proc page*(self: PDFAnnotationObj): PDFPage {.objc.}
proc setPage*(self: PDFAnnotationObj, page: PDFPage) {.objc: "setPage:".}

type
  PDFAnnotationType* = NSString

proc annotationType*(self: PDFAnnotationObj): PDFAnnotationType {.objc.}

# Bounds
proc bounds*(self: PDFAnnotationObj): NSRect {.objc.}
proc setBounds*(self: PDFAnnotationObj, bounds: NSRect) {.objc: "setBounds:".}

# Modification tracking
proc modificationDate*(self: PDFAnnotationObj): NSDate {.objc.}
proc setModificationDate*(self: PDFAnnotationObj, date: NSDate) {.objc: "setModificationDate:".}

# Appearance
proc contents*(self: PDFAnnotationObj): NSString {.objc.}
proc setContents*(self: PDFAnnotationObj, contents: NSString) {.objc: "setContents:".}
proc shouldDisplay*(self: PDFAnnotationObj): bool {.objc.}
proc setShouldDisplay*(self: PDFAnnotationObj, shouldDisplay: bool) {.objc: "setShouldDisplay:".}
proc shouldPrint*(self: PDFAnnotationObj): bool {.objc.}
proc setShouldPrint*(self: PDFAnnotationObj, shouldPrint: bool) {.objc: "setShouldPrint:".}

# Border
proc border*(self: PDFAnnotationObj): PDFBorder {.objc.}
proc setBorder*(self: PDFAnnotationObj, border: PDFBorder) {.objc: "setBorder:".}

# Color
proc color*(self: PDFAnnotationObj): NSObject {.objc.}
proc setColor*(self: PDFAnnotationObj, color: NSObject) {.objc: "setColor:".}
proc backgroundColor*(self: PDFAnnotationObj): NSObject {.objc.}
proc setBackgroundColor*(self: PDFAnnotationObj, color: NSObject) {.objc: "setBackgroundColor:".}
proc interiorColor*(self: PDFAnnotationObj): NSObject {.objc.}
proc setInteriorColor*(self: PDFAnnotationObj, color: NSObject) {.objc: "setInteriorColor:".}
proc fontColor*(self: PDFAnnotationObj): NSObject {.objc.}
proc setFontColor*(self: PDFAnnotationObj, color: NSObject) {.objc: "setFontColor:".}

# Font
proc font*(self: PDFAnnotationObj): NSObject {.objc.}
proc setFont*(self: PDFAnnotationObj, font: NSObject) {.objc: "setFont:".}
proc fontName*(self: PDFAnnotationObj): NSString {.objc.}
proc setFontName*(self: PDFAnnotationObj, name: NSString) {.objc: "setFontName:".}
proc fontSize*(self: PDFAnnotationObj): CGFloat {.objc.}
proc setFontSize*(self: PDFAnnotationObj, size: CGFloat) {.objc: "setFontSize:".}

# Alignment
proc alignment*(self: PDFAnnotationObj): PDFTextAlignment {.objc.}
proc setAlignment*(self: PDFAnnotationObj, alignment: PDFTextAlignment) {.objc: "setAlignment:".}

# Icon
proc iconType*(self: PDFAnnotationObj): NSInteger {.objc.}
proc setIconType*(self: PDFAnnotationObj, iconType: NSInteger) {.objc: "setIconType:".}

# Action
proc action*(self: PDFAnnotationObj): PDFAction {.objc.}
proc setAction*(self: PDFAnnotationObj, action: PDFAction) {.objc: "setAction:".}

# Widget properties
proc widgetFieldType*(self: PDFAnnotationObj): NSString {.objc.}
proc setWidgetFieldType*(self: PDFAnnotationObj, fieldType: NSString) {.objc: "setWidgetFieldType:".}
proc widgetControlType*(self: PDFAnnotationObj): NSInteger {.objc.}
proc setWidgetControlType*(self: PDFAnnotationObj, controlType: NSInteger) {.objc: "setWidgetControlType:".}
proc buttonWidgetState*(self: PDFAnnotationObj): NSInteger {.objc.}
proc setButtonWidgetState*(self: PDFAnnotationObj, state: NSInteger) {.objc: "setButtonWidgetState:".}
proc fieldName*(self: PDFAnnotationObj): NSString {.objc.}
proc setFieldName*(self: PDFAnnotationObj, name: NSString) {.objc: "setFieldName:".}
proc caption*(self: PDFAnnotationObj): NSString {.objc.}
proc setCaption*(self: PDFAnnotationObj, caption: NSString) {.objc: "setCaption:".}

# Text widget properties
proc widgetStringValue*(self: PDFAnnotationObj): NSString {.objc.}
proc setWidgetStringValue*(self: PDFAnnotationObj, value: NSString) {.objc: "setWidgetStringValue:".}
proc attributedWidgetStringValue*(self: PDFAnnotationObj): NSAttributedString {.objc.}
proc setAttributedWidgetStringValue*(self: PDFAnnotationObj, value: NSAttributedString) {.objc: "setAttributedWidgetStringValue:".}

# Choice widget properties
proc choices*(self: PDFAnnotationObj): NSArray[NSString] {.objc.}
proc setChoices*(self: PDFAnnotationObj, choices: NSArray[NSString]) {.objc: "setChoices:".}

# Line properties
proc startPoint*(self: PDFAnnotationObj): NSPoint {.objc.}
proc setStartPoint*(self: PDFAnnotationObj, point: NSPoint) {.objc: "setStartPoint:".}
proc endPoint*(self: PDFAnnotationObj): NSPoint {.objc.}
proc setEndPoint*(self: PDFAnnotationObj, point: NSPoint) {.objc: "setEndPoint:".}
proc startLineStyle*(self: PDFAnnotationObj): PDFLineStyle {.objc.}
proc setStartLineStyle*(self: PDFAnnotationObj, style: PDFLineStyle) {.objc: "setStartLineStyle:".}
proc endLineStyle*(self: PDFAnnotationObj): PDFLineStyle {.objc.}
proc setEndLineStyle*(self: PDFAnnotationObj, style: PDFLineStyle) {.objc: "setEndLineStyle:".}

# Drawing
proc drawWithBox*(self: PDFAnnotationObj, box: PDFDisplayBox) {.objc: "drawWithBox:".}
proc drawWithBoxInContext*(self: PDFAnnotationObj, box: PDFDisplayBox, context: CGContext) {.objc: "drawWithBox:inContext:".}

# Subtype
proc subtype*(self: PDFAnnotationObj): PDFAnnotationSubtype {.objc.}

# Standard annotation subtype constants
var
  PDFAnnotationSubtypeText* {.importc.}: PDFAnnotationSubtype
  PDFAnnotationSubtypeLink* {.importc.}: PDFAnnotationSubtype
  PDFAnnotationSubtypeFreeText* {.importc.}: PDFAnnotationSubtype
  PDFAnnotationSubtypeLine* {.importc.}: PDFAnnotationSubtype
  PDFAnnotationSubtypeSquare* {.importc.}: PDFAnnotationSubtype
  PDFAnnotationSubtypeCircle* {.importc.}: PDFAnnotationSubtype
  PDFAnnotationSubtypeHighlight* {.importc.}: PDFAnnotationSubtype
  PDFAnnotationSubtypeUnderline* {.importc.}: PDFAnnotationSubtype
  PDFAnnotationSubtypeStrikeOut* {.importc.}: PDFAnnotationSubtype
  PDFAnnotationSubtypeInk* {.importc.}: PDFAnnotationSubtype
  PDFAnnotationSubtypeStamp* {.importc.}: PDFAnnotationSubtype
  PDFAnnotationSubtypeCaret* {.importc.}: PDFAnnotationSubtype
  PDFAnnotationSubtypeWidget* {.importc.}: PDFAnnotationSubtype
  PDFAnnotationSubtypePopup* {.importc.}: PDFAnnotationSubtype

# Widget subtype constants
var
  PDFAnnotationWidgetSubtypeButton* {.importc.}: PDFAnnotationWidgetSubtype
  PDFAnnotationWidgetSubtypeChoice* {.importc.}: PDFAnnotationWidgetSubtype
  PDFAnnotationWidgetSubtypeSignature* {.importc.}: PDFAnnotationWidgetSubtype
  PDFAnnotationWidgetSubtypeText* {.importc.}: PDFAnnotationWidgetSubtype

# PDFBorder
proc lineWidth*(self: PDFBorder): CGFloat {.objc.}
proc setLineWidth*(self: PDFBorder, width: CGFloat) {.objc: "setLineWidth:".}
proc dashPattern*(self: PDFBorder): NSArray[NSNumber] {.objc.}
proc setDashPattern*(self: PDFBorder, pattern: NSArray[NSNumber]) {.objc: "setDashPattern:".}
proc style*(self: PDFBorder): NSInteger {.objc.}
proc setStyle*(self: PDFBorder, style: NSInteger) {.objc: "setStyle:".}
proc drawInRect*(self: PDFBorder, rect: NSRect) {.objc: "drawInRect:".}

# Type alias for easier use
type PDFAnnotation* = PDFAnnotationObj
