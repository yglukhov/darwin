import ../objc/runtime
import ../core_graphics/[cgcontext, cggeometry]
import ../foundation/[nsarray, nsstring]

type
  CALayer* = ptr object of NSObject
  CAAnimation* = ptr object of NSObject

  CALayerContentsGravity* = NSString
  CALayerContentsFormat* = NSString
  CALayerContentsFilter* = NSString
  CALayerCornerCurve* = NSString

  CAAutoresizingMask* {.size: sizeof(cuint).} = enum
    NotSizable = 0
    MinXMargin = 1 shl 0
    WidthSizable = 1 shl 1
    MaxXMargin = 1 shl 2
    MinYMargin = 1 shl 3
    HeightSizable = 1 shl 4
    MaxYMargin = 1 shl 5

  CAEdgeAntialiasingMask* {.size: sizeof(cuint).} = enum
    LeftEdge = 1 shl 0
    RightEdge = 1 shl 1
    BottomEdge = 1 shl 2
    TopEdge = 1 shl 3

  CACornerMask* {.size: sizeof(cuint).} = enum
    MinXMinYCorner = 1 shl 0
    MaxXMinYCorner = 1 shl 1
    MinXMaxYCorner = 1 shl 2
    MaxXMaxYCorner = 1 shl 3

# Layer creation
proc layer*(t: typedesc[CALayer]): CALayer {.objc: "layer".}

# Geometry
proc bounds*(layer: CALayer): CGRect {.objc.}
proc `bounds=`*(layer: CALayer, bounds: CGRect) {.objc: "setBounds:".}
proc position*(layer: CALayer): CGPoint {.objc.}
proc `position=`*(layer: CALayer, position: CGPoint) {.objc: "setPosition:".}
proc zPosition*(layer: CALayer): CGFloat {.objc.}
proc `zPosition=`*(layer: CALayer, z: CGFloat) {.objc: "setZPosition:".}
proc anchorPoint*(layer: CALayer): CGPoint {.objc.}
proc `anchorPoint=`*(layer: CALayer, point: CGPoint) {.objc: "setAnchorPoint:".}
proc frame*(layer: CALayer): CGRect {.objc.}
proc `frame=`*(layer: CALayer, frame: CGRect) {.objc: "setFrame:".}

# Visibility
proc isHidden*(layer: CALayer): BOOL {.objc.}
proc `isHidden=`*(layer: CALayer, hidden: BOOL) {.objc: "setHidden:".}
proc isOpaque*(layer: CALayer): BOOL {.objc.}
proc `isOpaque=`*(layer: CALayer, opaque: BOOL) {.objc: "setOpaque:".}
proc opacity*(layer: CALayer): cfloat {.objc.}
proc `opacity=`*(layer: CALayer, opacity: cfloat) {.objc: "setOpacity:".}

# Appearance
proc cornerRadius*(layer: CALayer): CGFloat {.objc.}
proc `cornerRadius=`*(layer: CALayer, radius: CGFloat) {.objc: "setCornerRadius:".}
proc borderWidth*(layer: CALayer): CGFloat {.objc.}
proc `borderWidth=`*(layer: CALayer, width: CGFloat) {.objc: "setBorderWidth:".}
proc masksToBounds*(layer: CALayer): BOOL {.objc.}
proc `masksToBounds=`*(layer: CALayer, masks: BOOL) {.objc: "setMasksToBounds:".}

# Shadow
proc shadowRadius*(layer: CALayer): CGFloat {.objc.}
proc `shadowRadius=`*(layer: CALayer, radius: CGFloat) {.objc: "setShadowRadius:".}
proc shadowOpacity*(layer: CALayer): cfloat {.objc.}
proc `shadowOpacity=`*(layer: CALayer, opacity: cfloat) {.objc: "setShadowOpacity:".}
proc shadowOffset*(layer: CALayer): CGSize {.objc.}
proc `shadowOffset=`*(layer: CALayer, offset: CGSize) {.objc: "setShadowOffset:".}

# Contents
proc contents*(layer: CALayer): ID {.objc.}
proc `contents=`*(layer: CALayer, contents: ID) {.objc: "setContents:".}
proc contentsGravity*(layer: CALayer): CALayerContentsGravity {.objc.}
proc `contentsGravity=`*(layer: CALayer, gravity: CALayerContentsGravity) {.objc: "setContentsGravity:".}
proc contentsScale*(layer: CALayer): CGFloat {.objc.}
proc `contentsScale=`*(layer: CALayer, scale: CGFloat) {.objc: "setContentsScale:".}
proc contentsRect*(layer: CALayer): CGRect {.objc.}
proc `contentsRect=`*(layer: CALayer, rect: CGRect) {.objc: "setContentsRect:".}

# Layer hierarchy
proc superlayer*(layer: CALayer): CALayer {.objc.}
proc sublayers*(layer: CALayer): NSArray[CALayer] {.objc.}
proc `sublayers=`*(layer: CALayer, sublayers: NSArray[CALayer]) {.objc: "setSublayers:".}
proc addSublayer*(layer: CALayer, sublayer: CALayer) {.objc: "addSublayer:".}
proc insertSublayerAtIndex*(layer: CALayer, sublayer: CALayer, idx: cuint) {.objc: "insertSublayer:atIndex:".}
proc removeFromSuperlayer*(layer: CALayer) {.objc.}

# Display
proc setNeedsDisplay*(layer: CALayer) {.objc.}
proc setNeedsDisplayInRect*(layer: CALayer, rect: CGRect) {.objc: "setNeedsDisplayInRect:".}
proc renderInContext*(layer: CALayer, ctx: CGContext) {.objc: "renderInContext:".}

# Animation
proc addAnimationForKey*(layer: CALayer, anim: CAAnimation, key: NSString) {.objc: "addAnimation:forKey:".}
proc removeAllAnimations*(layer: CALayer) {.objc.}
proc removeAnimationForKey*(layer: CALayer, key: NSString) {.objc: "removeAnimationForKey:".}

# Contents gravity constants
var kCAGravityCenter* {.importc.}: CALayerContentsGravity
var kCAGravityTop* {.importc.}: CALayerContentsGravity
var kCAGravityBottom* {.importc.}: CALayerContentsGravity
var kCAGravityLeft* {.importc.}: CALayerContentsGravity
var kCAGravityRight* {.importc.}: CALayerContentsGravity
var kCAGravityTopLeft* {.importc.}: CALayerContentsGravity
var kCAGravityTopRight* {.importc.}: CALayerContentsGravity
var kCAGravityBottomLeft* {.importc.}: CALayerContentsGravity
var kCAGravityBottomRight* {.importc.}: CALayerContentsGravity
var kCAGravityResize* {.importc.}: CALayerContentsGravity
var kCAGravityResizeAspect* {.importc.}: CALayerContentsGravity
var kCAGravityResizeAspectFill* {.importc.}: CALayerContentsGravity
