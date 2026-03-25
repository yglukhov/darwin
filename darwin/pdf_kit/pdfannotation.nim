import darwin/objc/runtime
import darwin/foundation/[nsstring, nsarray, nsdictionary, nsgeometry, nsattributedstring, nsdate, nsnumber]
import darwin/core_graphics/[cggeometry, cgcontext]
import pdfdocument

type
  PDFAnnotation* = ptr object of NSObject
  PDFBorder* = ptr object of NSObject
  PDFAction* = ptr object of NSObject

# Register Objective-C class names
proc objcClass(t: typedesc[PDFAnnotation]): auto {.inline.} = objcClass("PDFAnnotation")

type
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
# Note: initWithBounds:forType:withProperties: is the designated initializer
# The old initWithBounds: is deprecated
proc initWithBounds*(self: PDFAnnotation, bounds: NSRect): PDFAnnotation {.objc: "initWithBounds:".}
proc initWithBounds*(self: PDFAnnotation, bounds: NSRect, forType: PDFAnnotationSubtype, withProperties: NSDictionaryAbstract = nil): PDFAnnotation {.objc: "initWithBounds:forType:withProperties:".}

# Properties
proc page*(self: PDFAnnotation): PDFPage {.objc.}
proc setPage*(self: PDFAnnotation, page: PDFPage) {.objc: "setPage:".}

# Type property - the annotation type (called "Subtype" in the PDF specification)
proc type*(self: PDFAnnotation): PDFAnnotationSubtype {.objc.}

# Bounds
proc bounds*(self: PDFAnnotation): NSRect {.objc.}
proc setBounds*(self: PDFAnnotation, bounds: NSRect) {.objc: "setBounds:".}

# Modification tracking
proc modificationDate*(self: PDFAnnotation): NSDate {.objc.}
proc setModificationDate*(self: PDFAnnotation, date: NSDate) {.objc: "setModificationDate:".}

# Appearance
proc contents*(self: PDFAnnotation): NSString {.objc.}
proc setContents*(self: PDFAnnotation, contents: NSString) {.objc: "setContents:".}
proc shouldDisplay*(self: PDFAnnotation): bool {.objc.}
proc setShouldDisplay*(self: PDFAnnotation, shouldDisplay: bool) {.objc: "setShouldDisplay:".}
proc shouldPrint*(self: PDFAnnotation): bool {.objc.}
proc setShouldPrint*(self: PDFAnnotation, shouldPrint: bool) {.objc: "setShouldPrint:".}

# Border
proc border*(self: PDFAnnotation): PDFBorder {.objc.}
proc setBorder*(self: PDFAnnotation, border: PDFBorder) {.objc: "setBorder:".}

# Color
proc color*(self: PDFAnnotation): NSObject {.objc.}
proc setColor*(self: PDFAnnotation, color: NSObject) {.objc: "setColor:".}
proc backgroundColor*(self: PDFAnnotation): NSObject {.objc.}
proc setBackgroundColor*(self: PDFAnnotation, color: NSObject) {.objc: "setBackgroundColor:".}
proc interiorColor*(self: PDFAnnotation): NSObject {.objc.}
proc setInteriorColor*(self: PDFAnnotation, color: NSObject) {.objc: "setInteriorColor:".}
proc fontColor*(self: PDFAnnotation): NSObject {.objc.}
proc setFontColor*(self: PDFAnnotation, color: NSObject) {.objc: "setFontColor:".}

# Font
proc font*(self: PDFAnnotation): NSObject {.objc.}
proc setFont*(self: PDFAnnotation, font: NSObject) {.objc: "setFont:".}
proc fontName*(self: PDFAnnotation): NSString {.objc.}
proc setFontName*(self: PDFAnnotation, name: NSString) {.objc: "setFontName:".}
proc fontSize*(self: PDFAnnotation): CGFloat {.objc.}
proc setFontSize*(self: PDFAnnotation, size: CGFloat) {.objc: "setFontSize:".}

# Alignment
proc alignment*(self: PDFAnnotation): PDFTextAlignment {.objc.}
proc setAlignment*(self: PDFAnnotation, alignment: PDFTextAlignment) {.objc: "setAlignment:".}

# Icon
proc iconType*(self: PDFAnnotation): NSInteger {.objc.}
proc setIconType*(self: PDFAnnotation, iconType: NSInteger) {.objc: "setIconType:".}

# Action
proc action*(self: PDFAnnotation): PDFAction {.objc.}
proc setAction*(self: PDFAnnotation, action: PDFAction) {.objc: "setAction:".}

# Widget properties
proc widgetFieldType*(self: PDFAnnotation): NSString {.objc.}
proc setWidgetFieldType*(self: PDFAnnotation, fieldType: NSString) {.objc: "setWidgetFieldType:".}
proc widgetControlType*(self: PDFAnnotation): NSInteger {.objc.}
proc setWidgetControlType*(self: PDFAnnotation, controlType: NSInteger) {.objc: "setWidgetControlType:".}
proc buttonWidgetState*(self: PDFAnnotation): NSInteger {.objc.}
proc setButtonWidgetState*(self: PDFAnnotation, state: NSInteger) {.objc: "setButtonWidgetState:".}
proc fieldName*(self: PDFAnnotation): NSString {.objc.}
proc setFieldName*(self: PDFAnnotation, name: NSString) {.objc: "setFieldName:".}
proc caption*(self: PDFAnnotation): NSString {.objc.}
proc setCaption*(self: PDFAnnotation, caption: NSString) {.objc: "setCaption:".}

# Text widget properties
proc widgetStringValue*(self: PDFAnnotation): NSString {.objc.}
proc setWidgetStringValue*(self: PDFAnnotation, value: NSString) {.objc: "setWidgetStringValue:".}
proc attributedWidgetStringValue*(self: PDFAnnotation): NSAttributedString {.objc.}
proc setAttributedWidgetStringValue*(self: PDFAnnotation, value: NSAttributedString) {.objc: "setAttributedWidgetStringValue:".}

# Choice widget properties
proc choices*(self: PDFAnnotation): NSArray[NSString] {.objc.}
proc setChoices*(self: PDFAnnotation, choices: NSArray[NSString]) {.objc: "setChoices:".}

# Line properties
proc startPoint*(self: PDFAnnotation): NSPoint {.objc.}
proc setStartPoint*(self: PDFAnnotation, point: NSPoint) {.objc: "setStartPoint:".}
proc endPoint*(self: PDFAnnotation): NSPoint {.objc.}
proc setEndPoint*(self: PDFAnnotation, point: NSPoint) {.objc: "setEndPoint:".}
proc startLineStyle*(self: PDFAnnotation): PDFLineStyle {.objc.}
proc setStartLineStyle*(self: PDFAnnotation, style: PDFLineStyle) {.objc: "setStartLineStyle:".}
proc endLineStyle*(self: PDFAnnotation): PDFLineStyle {.objc.}
proc setEndLineStyle*(self: PDFAnnotation, style: PDFLineStyle) {.objc: "setEndLineStyle:".}

# Drawing
proc drawWithBox*(self: PDFAnnotation, box: PDFDisplayBox) {.objc: "drawWithBox:".}
proc drawWithBoxInContext*(self: PDFAnnotation, box: PDFDisplayBox, context: CGContext) {.objc: "drawWithBox:inContext:".}



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

