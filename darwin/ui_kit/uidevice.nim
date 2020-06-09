import ../objc/runtime

type UIDevice* = ptr object of NSObject

proc currentDevice*(n: typedesc[UIDevice]): UIDevice {.objc: "currentDevice".}
proc name*(d: UIDevice): NSString {.objc: "name".}
proc model*(d: UIDevice): NSString {.objc: "model".}
proc localizedModel*(d: UIDevice): NSString {.objc: "localizedModel".}
proc systemName*(d: UIDevice): NSString {.objc: "systemName".}
proc systemVersion*(d: UIDevice): NSString {.objc: "systemVersion".}
