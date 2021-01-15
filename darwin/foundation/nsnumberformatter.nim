import ../objc/runtime
import ../foundation/[nsnumber, nslocale]

const kCFNumberFormatterCurrencyStyle = 2
const NSNumberFormatterBehavior10_4* = 1040

type NSNumberFormatter* = ptr object of NSObject

type NSNumberFormatterStyle* = enum
  NSNumberFormatterCurrencyStyle = kCFNumberFormatterCurrencyStyle

proc stringFromNumber*(f: NSNumberFormatter, p: NSNumber): NSString {.objc: "stringFromNumber:".}

proc setFormatterBehavior*(formatter: NSNumberFormatter): NSString {.objc.}
proc setNumberStyle*(formatter: NSNumberFormatter,
    style: NSNumberFormatterStyle) {.objc:"setNumberStyle:".}
proc setLocale*(formatter: NSNumberFormatter, locale: NSLocale) {.objc:"setLocale:".}
