import ../objc/runtime
import ../foundation/nsstring
import ../foundation/nsdictionary
import ./nllanguage

export NSString, NSDictionary, NLLanguage

type
  NLLanguageRecognizer* = ptr object of NSObject

proc dominantLanguage*(cls: typedesc[NLLanguageRecognizer], string: NSString): NLLanguage {.objc: "dominantLanguageForString:".}
proc dominantLanguage*(self: NLLanguageRecognizer): NLLanguage {.objc.}
proc languageHypothesesWithMaximum*(self: NLLanguageRecognizer, maxHypotheses: NSUInteger): NSDictionary {.objc: "languageHypothesesWithMaximum:".}
proc processString*(self: NLLanguageRecognizer, string: NSString) {.objc: "processString:".}
proc reset*(self: NLLanguageRecognizer) {.objc.}
