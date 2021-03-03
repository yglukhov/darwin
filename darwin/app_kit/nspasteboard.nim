import ../objc/runtime
import ../foundation

type
    NSPasteboard* = ptr object of NSObject
    NSPasteboardItem* = ptr object of NSObject

proc clearContents*(p: NSPasteboard) {.objc: "clearContents".}
proc writeObjects*(p: NSPasteboard, o: NSArray[NSPasteboardItem]) {.objc: "writeObjects:".}
proc pasteboardItems*(p: NSPasteboard): NSArray[NSPasteboardItem] {.objc: "pasteboardItems".}
proc dataForType*(pi: NSPasteboard, t: NSString): NSData {.objc: "dataForType:".}

proc types*(pi: NSPasteboardItem): NSArray[NSString] {.objc: "types".}
proc dataForType*(pi: NSPasteboardItem, t: NSString): NSData {.objc: "dataForType:".}
proc setDataForType*(self: NSPasteboardItem, data: NSData, forType: NSString): bool {.objc: "setData:forType:".}

proc withName*(n: typedesc[NSPasteboard], name: NSString): NSPasteboard {.objc: "pasteboardWithName:".}

var NSPasteboardNameGeneral* {.importc.} : NSString
var NSPasteboardNameFont* {.importc.} : NSString
var NSPasteboardNameRuler* {.importc.} : NSString
var NSPasteboardNameFind* {.importc.} : NSString
var NSPasteboardNameDrag* {.importc.} : NSString

var NSPasteboardTypeString* {.importc.} : NSString
var NSPasteboardTypePDF* {.importc.} : NSString
var NSPasteboardTypeTIFF* {.importc.} : NSString
var NSPasteboardTypePNG* {.importc.} : NSString
var NSPasteboardTypeRTF* {.importc.} : NSString
var NSPasteboardTypeRTFD* {.importc.} : NSString
var NSPasteboardTypeHTML* {.importc.} : NSString
var NSPasteboardTypeTabularText* {.importc.} : NSString
var NSPasteboardTypeFont* {.importc.} : NSString
var NSPasteboardTypeRuler* {.importc.} : NSString
var NSPasteboardTypeColor* {.importc.} : NSString
var NSPasteboardTypeSound* {.importc.} : NSString
var NSPasteboardTypeMultipleTextSelection* {.importc.} : NSString
var NSPasteboardTypeFindPanelSearchOptions* {.importc.} : NSString

# Deprecated
var NSGeneralPboard* {.importc.} : NSString
var NSFontPboard* {.importc.} : NSString
var NSRulerPboard* {.importc.} : NSString
var NSFindPboard* {.importc.} : NSString
var NSDragPboard* {.importc.} : NSString
