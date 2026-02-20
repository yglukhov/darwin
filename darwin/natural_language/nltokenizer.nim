import ../objc/runtime
import ../objc/blocks
import ../foundation/nsstring
import ../foundation/nsrange
import ../foundation/nsarray
import ../foundation/nsvalue

export NSString, NSRange, Block, NSArray, NSValue

type
  NLTokenizerUnit* {.size: sizeof(uint).} = enum
    nlTokenizerUnitWord = 0
    nlTokenizerUnitSentence = 1
    nlTokenizerUnitParagraph = 2
    nlTokenizerUnitDocument = 3

  NLTokenizerAttributes* = uint

  NLTokenizer* = ptr object of NSObject

proc initWithUnit*(self: NLTokenizer, unit: NLTokenizerUnit): NLTokenizer {.objc: "initWithUnit:".}
proc setString*(self: NLTokenizer, string: NSString) {.objc: "setString:".}
proc setLanguage*(self: NLTokenizer, language: NSString) {.objc: "setLanguage:".}
proc tokenRangeForRange*(self: NLTokenizer, range: NSRange): NSRange {.objc: "tokenRangeForRange:".}
proc tokensForRange*(self: NLTokenizer, range: NSRange): NSArray[NSValue] {.objc: "tokensForRange:".}

# Block-based enumeration
proc enumerateTokensInRange*(self: NLTokenizer, range: NSRange, blk: Block[proc(tokenRange: NSRange, flags: NLTokenizerAttributes, stop: var bool)]) {.objc: "enumerateTokensInRange:usingBlock:".}
