
import ../objc/runtime

type NSLocale* = ptr object of NSObject

proc currencySymbol*(l: NSLocale): NSString {.objc.}
