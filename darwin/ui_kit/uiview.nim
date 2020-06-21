import ../objc/runtime
import ../quartz_core/calayer

type UIView* = ptr object of NSObject

proc layer*(v: UIView): CALayer {.objc: "layer".}
