import ../objc/runtime
import ../foundation

type
  NSPasteboard* = ptr object of NSObject
  NSPasteboardItem* = ptr object of NSObject
  NSPasteboardType* = NSString
  NSPasteboardName* = NSString
  NSPasteboardReadingOptionKey* = NSString

# NSPasteboardContentsOptions - for prepareForNewContentsWithOptions
type
  NSPasteboardContentsOptions* {.size: sizeof(NSUInteger).} = enum
    NSPasteboardContentsCurrentHostOnly = 1 shl 0

# NSPasteboardWritingOptions
type
  NSPasteboardWritingOptions* {.size: sizeof(NSUInteger).} = enum
    NSPasteboardWritingPromised = 1 shl 9

# NSPasteboardReadingOptions
type
  NSPasteboardReadingOptions* {.size: sizeof(NSUInteger).} = enum
    NSPasteboardReadingAsData = 0
    NSPasteboardReadingAsString = 1 shl 0
    NSPasteboardReadingAsPropertyList = 1 shl 1
    NSPasteboardReadingAsKeyedArchive = 1 shl 2

# ============================================================================
# Standard Pasteboard Types
# ============================================================================

var NSPasteboardTypeString* {.importc.}: NSString
var NSPasteboardTypePDF* {.importc.}: NSString
var NSPasteboardTypeTIFF* {.importc.}: NSString
var NSPasteboardTypePNG* {.importc.}: NSString
var NSPasteboardTypeRTF* {.importc.}: NSString
var NSPasteboardTypeRTFD* {.importc.}: NSString
var NSPasteboardTypeHTML* {.importc.}: NSString
var NSPasteboardTypeTabularText* {.importc.}: NSString
var NSPasteboardTypeFont* {.importc.}: NSString
var NSPasteboardTypeRuler* {.importc.}: NSString
var NSPasteboardTypeColor* {.importc.}: NSString
var NSPasteboardTypeSound* {.importc.}: NSString
var NSPasteboardTypeMultipleTextSelection* {.importc.}: NSString
var NSPasteboardTypeTextFinderOptions* {.importc.}: NSString  # Replaces NSPasteboardTypeFindPanelSearchOptions (10.7+)
var NSPasteboardTypeURL* {.importc.}: NSString  # 10.13+
var NSPasteboardTypeFileURL* {.importc.}: NSString  # 10.13+

# ============================================================================
# Standard Pasteboard Names
# ============================================================================

var NSPasteboardNameGeneral* {.importc.}: NSString
var NSPasteboardNameFont* {.importc.}: NSString
var NSPasteboardNameRuler* {.importc.}: NSString
var NSPasteboardNameFind* {.importc.}: NSString
var NSPasteboardNameDrag* {.importc.}: NSString

# ============================================================================
# Pasteboard Reading Option Keys
# ============================================================================

var NSPasteboardURLReadingFileURLsOnlyKey* {.importc.}: NSString
var NSPasteboardURLReadingContentsConformToTypesKey* {.importc.}: NSString

# ============================================================================
# Deprecated Pasteboard Names
# ============================================================================

var NSGeneralPboard* {.importc.}: NSString
var NSFontPboard* {.importc.}: NSString
var NSRulerPboard* {.importc.}: NSString
var NSFindPboard* {.importc.}: NSString
var NSDragPboard* {.importc.}: NSString

# ============================================================================
# Deprecated Pasteboard Types
# ============================================================================

var NSPasteboardTypeFindPanelSearchOptions* {.importc.}: NSString  # Deprecated in 10.14

# ============================================================================
# Class Methods
# ============================================================================

proc generalPasteboard*(self: typedesc[NSPasteboard]): NSPasteboard {.objc: "generalPasteboard".}
proc pasteboardWithName*(self: typedesc[NSPasteboard], name: NSPasteboardName): NSPasteboard {.objc: "pasteboardWithName:".}
proc pasteboardWithUniqueName*(self: typedesc[NSPasteboard]): NSPasteboard {.objc: "pasteboardWithUniqueName".}

# ============================================================================
# Properties
# ============================================================================

proc name*(self: NSPasteboard): NSPasteboardName {.objc.}
proc changeCount*(self: NSPasteboard): NSInteger {.objc.}
proc types*(self: NSPasteboard): NSArray[NSPasteboardType] {.objc.}
proc pasteboardItems*(self: NSPasteboard): NSArray[NSPasteboardItem] {.objc.}

# ============================================================================
# Managing Contents
# ============================================================================

proc prepareForNewContentsWithOptions*(self: NSPasteboard, options: NSPasteboardContentsOptions): NSInteger {.objc: "prepareForNewContentsWithOptions:".}
proc clearContents*(self: NSPasteboard): NSInteger {.objc.}
proc releaseGlobally*(self: NSPasteboard) {.objc.}

# ============================================================================
# Writing Data
# ============================================================================

proc writeObjects*(self: NSPasteboard, objects: NSArray): BOOL {.objc: "writeObjects:".}
proc declareTypes*(self: NSPasteboard, newTypes: NSArray[NSPasteboardType], owner: NSObject): NSInteger {.objc: "declareTypes:owner:".}
proc addTypes*(self: NSPasteboard, newTypes: NSArray[NSPasteboardType], owner: NSObject): NSInteger {.objc: "addTypes:owner:".}

proc setData*(self: NSPasteboard, data: NSData, forType: NSPasteboardType): BOOL {.objc: "setData:forType:".}
proc setPropertyList*(self: NSPasteboard, plist: NSObject, forType: NSPasteboardType): BOOL {.objc: "setPropertyList:forType:".}
proc setString*(self: NSPasteboard, string: NSString, forType: NSPasteboardType): BOOL {.objc: "setString:forType:".}

# ============================================================================
# Reading Data
# ============================================================================

proc readObjectsForClasses*(self: NSPasteboard, classArray: NSArray, options: NSDictionary): NSArray {.objc: "readObjectsForClasses:options:".}
proc indexOfPasteboardItem*(self: NSPasteboard, pasteboardItem: NSPasteboardItem): NSUInteger {.objc: "indexOfPasteboardItem:".}
proc canReadItemWithDataConformingToTypes*(self: NSPasteboard, types: NSArray[NSString]): BOOL {.objc: "canReadItemWithDataConformingToTypes:".}
proc canReadObjectForClasses*(self: NSPasteboard, classArray: NSArray, options: NSDictionary): BOOL {.objc: "canReadObjectForClasses:options:".}

proc availableTypeFromArray*(self: NSPasteboard, types: NSArray[NSPasteboardType]): NSPasteboardType {.objc: "availableTypeFromArray:".}

proc dataForType*(self: NSPasteboard, dataType: NSPasteboardType): NSData {.objc: "dataForType:".}
proc propertyListForType*(self: NSPasteboard, dataType: NSPasteboardType): NSObject {.objc: "propertyListForType:".}
proc stringForType*(self: NSPasteboard, dataType: NSPasteboardType): NSString {.objc: "stringForType:".}

# ============================================================================
# NSPasteboardItem Methods
# ============================================================================

proc types*(self: NSPasteboardItem): NSArray[NSPasteboardType] {.objc.}
proc availableTypeFromArray*(self: NSPasteboardItem, types: NSArray[NSPasteboardType]): NSPasteboardType {.objc: "availableTypeFromArray:".}

proc setDataProvider*(self: NSPasteboardItem, dataProvider: NSObject, forTypes: NSArray[NSPasteboardType]): BOOL {.objc: "setDataProvider:forTypes:".}

proc setData*(self: NSPasteboardItem, data: NSData, forType: NSPasteboardType): BOOL {.objc: "setData:forType:".}
proc setString*(self: NSPasteboardItem, string: NSString, forType: NSPasteboardType): BOOL {.objc: "setString:forType:".}
proc setPropertyList*(self: NSPasteboardItem, propertyList: NSObject, forType: NSPasteboardType): BOOL {.objc: "setPropertyList:forType:".}

proc dataForType*(self: NSPasteboardItem, `type`: NSPasteboardType): NSData {.objc: "dataForType:".}
proc stringForType*(self: NSPasteboardItem, `type`: NSPasteboardType): NSString {.objc: "stringForType:".}
proc propertyListForType*(self: NSPasteboardItem, `type`: NSPasteboardType): NSObject {.objc: "propertyListForType:".}

# ============================================================================
# Filter Services (Class Methods)
# ============================================================================

proc typesFilterableTo*(self: typedesc[NSPasteboard], `type`: NSPasteboardType): NSArray[NSPasteboardType] {.objc: "typesFilterableTo:".}
proc pasteboardByFilteringFile*(self: typedesc[NSPasteboard], filename: NSString): NSPasteboard {.objc: "pasteboardByFilteringFile:".}
proc pasteboardByFilteringData*(self: typedesc[NSPasteboard], data: NSData, ofType: NSPasteboardType): NSPasteboard {.objc: "pasteboardByFilteringData:ofType:".}
proc pasteboardByFilteringTypesInPasteboard*(self: typedesc[NSPasteboard], pboard: NSPasteboard): NSPasteboard {.objc: "pasteboardByFilteringTypesInPasteboard:".}

# ============================================================================
# File Contents
# ============================================================================

proc writeFileContents*(self: NSPasteboard, filename: NSString): BOOL {.objc: "writeFileContents:".}
proc readFileContentsType*(self: NSPasteboard, `type`: NSPasteboardType, toFile: NSString): NSString {.objc: "readFileContentsType:toFile:".}

proc writeFileWrapper*(self: NSPasteboard, wrapper: NSObject): BOOL {.objc: "writeFileWrapper:".}
proc readFileWrapper*(self: NSPasteboard): NSObject {.objc.}
