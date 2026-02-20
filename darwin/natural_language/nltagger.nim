import ../objc/runtime
import ../objc/blocks
import ../foundation/nsstring
import ../foundation/nsarray
import ../foundation/nsrange
import ./nltag

export NSString, NSArray, NSRange, NLTag, Block

type
  NLTagger* = ptr object of NSObject
  NLTaggerOptions* = uint
  NLTokenizerUnit* {.size: sizeof(uint).} = enum
    nlTokenizerUnitWord = 0
    nlTokenizerUnitSentence = 1
    nlTokenizerUnitParagraph = 2
    nlTokenizerUnitDocument = 3

# NLTagScheme string constants (corresponding to Natural Language framework values)
proc nLTagSchemeTokenType*(): NSString {.inline.} =
  result = NSString("TokenType")
proc nLTagSchemeLexicalClass*(): NSString {.inline.} =
  result = NSString("LexicalClass")
proc nLTagSchemeNameType*(): NSString {.inline.} =
  result = NSString("NameType")
proc nLTagSchemeNameTypeOrLexicalClass*(): NSString {.inline.} =
  result = NSString("NameTypeOrLexicalClass")
proc nLTagSchemeLemma*(): NSString {.inline.} =
  result = NSString("Lemma")
proc nLTagSchemeLanguage*(): NSString {.inline.} =
  result = NSString("Language")
proc nLTagSchemeScript*(): NSString {.inline.} =
  result = NSString("Script")

# Convenience templates
template NLTagSchemeTokenType*: NSString = nLTagSchemeTokenType()
template NLTagSchemeLexicalClass*: NSString = nLTagSchemeLexicalClass()
template NLTagSchemeNameType*: NSString = nLTagSchemeNameType()
template NLTagSchemeNameTypeOrLexicalClass*: NSString = nLTagSchemeNameTypeOrLexicalClass()
template NLTagSchemeLemma*: NSString = nLTagSchemeLemma()
template NLTagSchemeLanguage*: NSString = nLTagSchemeLanguage()
template NLTagSchemeScript*: NSString = nLTagSchemeScript()

# NLTaggerOptions constants
const
  nlTaggerOmitWords* = 1'u shl 0
  nlTaggerOmitPunctuation* = 1'u shl 1
  nlTaggerOmitWhitespace* = 1'u shl 2
  nlTaggerOmitOther* = 1'u shl 3
  nlTaggerJoinNames* = 1'u shl 4
  nlTaggerJoinContractions* = 1'u shl 5

proc initWithTagSchemes*(self: NLTagger, tagSchemes: NSArray[NSString]): NLTagger {.objc: "initWithTagSchemes:".}
proc setString*(self: NLTagger, string: NSString) {.objc: "setString:".}
proc enumerateTagsInRange*(self: NLTagger, range: NSRange, unit: NLTokenizerUnit, scheme: NSString, options: NLTaggerOptions, blk: Block[proc(tag: NLTag, tokenRange: NSRange, stop: var bool)]) {.objc: "enumerateTagsInRange:unit:scheme:options:usingBlock:".}
