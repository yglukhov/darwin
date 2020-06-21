import ../objc/runtime
import ../core_graphics/cgcontext

type CALayer* = ptr object of NSObject

proc render*(l: CALayer, c: CGContext) {.objc: "renderInContext:".}
