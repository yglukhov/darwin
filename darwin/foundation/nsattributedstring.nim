import ../objc/runtime
import ./nsstring
import ./nsdictionary
import ./nsrange

type
  NSAttributedString* = ptr object of NSObject
  NSMutableAttributedString* = ptr object of NSAttributedString

  NSAttributedStringKey* = NSString

type
  NSAttributedStringEnumerationOptions* {.size: sizeof(uint).} = enum
    NSAttributedStringEnumerationReverse = 1 shl 1
    NSAttributedStringEnumerationLongestEffectiveRangeNotRequired = 1 shl 20

proc toNSString*(self: NSAttributedString): NSString {.objc: "string".}
proc length*(self: NSAttributedString): NSUInteger {.objc: "length".}

proc attributesAtIndexEffectiveRange*(self: NSAttributedString; location: NSUInteger; range: NSRangePointer): NSDictionary[NSAttributedStringKey, NSObject] {.objc: "attributesAtIndex:effectiveRange:".}

proc attributeAtIndexEffectiveRange*(self: NSAttributedString; attrName: NSAttributedStringKey; location: NSUInteger; range: NSRangePointer): NSObject {.objc: "attribute:atIndex:effectiveRange:".}

proc attributedSubstringFromRange*(self: NSAttributedString; range: NSRange): NSAttributedString {.objc: "attributedSubstringFromRange:".}

proc isEqualToAttributedString*(self: NSAttributedString; other: NSAttributedString): BOOL {.objc: "isEqualToAttributedString:".}

proc initWithString*(self: NSAttributedString; str: NSString): NSAttributedString {.objc: "initWithString:".}
proc initWithStringAttributes*(self: NSAttributedString; str: NSString; attrs: NSDictionary[NSAttributedStringKey, NSObject]): NSAttributedString {.objc: "initWithString:attributes:".}
proc initWithAttributedString*(self: NSAttributedString; attrStr: NSAttributedString): NSAttributedString {.objc: "initWithAttributedString:".}

proc attributedStringWithString*(cls: typedesc[NSAttributedString]; str: NSString): NSAttributedString {.objc: "attributedStringWithString:".}

proc mutableString*(self: NSMutableAttributedString): NSMutableString {.objc: "mutableString".}

proc replaceCharactersInRangeWithString*(self: NSMutableAttributedString; range: NSRange; str: NSString) {.objc: "replaceCharactersInRange:withString:".}

proc setAttributesRange*(self: NSMutableAttributedString; attrs: NSDictionary[NSAttributedStringKey, NSObject]; range: NSRange) {.objc: "setAttributes:range:".}

proc addAttributeValueRange*(self: NSMutableAttributedString; name: NSAttributedStringKey; value: NSObject; range: NSRange) {.objc: "addAttribute:value:range:".}

proc addAttributesRange*(self: NSMutableAttributedString; attrs: NSDictionary[NSAttributedStringKey, NSObject]; range: NSRange) {.objc: "addAttributes:range:".}

proc removeAttributeRange*(self: NSMutableAttributedString; name: NSAttributedStringKey; range: NSRange) {.objc: "removeAttribute:range:".}

proc replaceCharactersInRangeWithAttributedString*(self: NSMutableAttributedString; range: NSRange; attrString: NSAttributedString) {.objc: "replaceCharactersInRange:withAttributedString:".}

proc insertAttributedStringAtIndex*(self: NSMutableAttributedString; attrString: NSAttributedString; loc: NSUInteger) {.objc: "insertAttributedString:atIndex:".}

proc appendAttributedString*(self: NSMutableAttributedString; attrString: NSAttributedString) {.objc: "appendAttributedString:".}

proc deleteCharactersInRange*(self: NSMutableAttributedString; range: NSRange) {.objc: "deleteCharactersInRange:".}

proc setAttributedString*(self: NSMutableAttributedString; attrString: NSAttributedString) {.objc: "setAttributedString:".}

proc beginEditing*(self: NSMutableAttributedString) {.objc: "beginEditing".}
proc endEditing*(self: NSMutableAttributedString) {.objc: "endEditing".}

proc initWithString*(self: NSMutableAttributedString; str: NSString): NSMutableAttributedString {.objc: "initWithString:".}
proc initWithStringAttributes*(self: NSMutableAttributedString; str: NSString; attrs: NSDictionary[NSAttributedStringKey, NSObject]): NSMutableAttributedString {.objc: "initWithString:attributes:".}
