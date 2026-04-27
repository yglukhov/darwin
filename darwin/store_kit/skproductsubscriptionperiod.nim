import ../objc/runtime

type
  SKProductPeriodUnit* {.size: sizeof(uint).} = enum
    SKProductPeriodUnitDay = 0,
    SKProductPeriodUnitWeek,
    SKProductPeriodUnitMonth,
    SKProductPeriodUnitYear

  SKProductSubscriptionPeriod* = ptr object of NSObject

proc numberOfUnits*(s: SKProductSubscriptionPeriod): NSUInteger {.objc.}
proc unit*(s: SKProductSubscriptionPeriod): SKProductPeriodUnit {.objc.}
