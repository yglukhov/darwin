import ../objc/runtime

type
  SKStoreReviewController* = ptr object of NSObject

proc requestReview*(t: typedesc[SKStoreReviewController]) {.objc: "requestReview".}
