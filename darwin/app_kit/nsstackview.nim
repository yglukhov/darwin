## NSStackView bindings for macOS AppKit
## Based on https://developer.apple.com/documentation/appkit/nsstackview

import darwin/objc/runtime
import darwin/foundation/[nsarray, nsgeometry]
import darwin/core_graphics/[cggeometry]
import darwin/app_kit/nsview

type
  NSStackView* = ptr object of NSView

  NSUserInterfaceLayoutOrientation* {.size: sizeof(uint).} = enum
    NSUserInterfaceLayoutOrientationHorizontal = 0
    NSUserInterfaceLayoutOrientationVertical = 1

  NSStackViewGravity* {.size: sizeof(uint).} = enum
    NSStackViewGravityLeading = 1
    NSStackViewGravityCenter = 2
    NSStackViewGravityTrailing = 3

  NSStackViewDistribution* {.size: sizeof(uint).} = enum
    NSStackViewDistributionFill = 0
    NSStackViewDistributionFillEqually = 1
    NSStackViewDistributionFillProportionally = 2
    NSStackViewDistributionEqualSpacing = 3
    NSStackViewDistributionEqualCentering = 4

# NSLayoutAttribute constants
const
  NSLayoutAttributeLeft* = 1.NSInteger
  NSLayoutAttributeRight* = 2.NSInteger
  NSLayoutAttributeTop* = 3.NSInteger
  NSLayoutAttributeBottom* = 4.NSInteger
  NSLayoutAttributeLeading* = 5.NSInteger
  NSLayoutAttributeTrailing* = 6.NSInteger
  NSLayoutAttributeWidth* = 7.NSInteger
  NSLayoutAttributeHeight* = 8.NSInteger
  NSLayoutAttributeCenterX* = 9.NSInteger
  NSLayoutAttributeCenterY* = 10.NSInteger
  NSLayoutAttributeLastBaseline* = 11.NSInteger
  NSLayoutAttributeFirstBaseline* = 12.NSInteger

# NSStackViewVisibilityPriority constants
const
  NSStackViewVisibilityPriorityMustHold*: CGFloat = 1000.0
  NSStackViewVisibilityPriorityCanHold*: CGFloat = 900.0
  NSStackViewVisibilityPriorityNotVisible*: CGFloat = 0.0
  NSStackViewSpacingUseDefault*: CGFloat = -1.0

# Factory method
proc stackViewWithViews*(class: typedesc[NSStackView], views: NSArray[NSView]): NSStackView {.objc: "stackViewWithViews:".}

# Initializer
proc initWithFrame*(self: NSStackView, frame: NSRect): NSStackView {.objc: "initWithFrame:".}

# Orientation
proc orientation*(self: NSStackView): NSUserInterfaceLayoutOrientation {.objc: "orientation".}
proc setOrientation*(self: NSStackView, orientation: NSUserInterfaceLayoutOrientation) {.objc: "setOrientation:".}

# Spacing
proc spacing*(self: NSStackView): CGFloat {.objc: "spacing".}
proc setSpacing*(self: NSStackView, spacing: CGFloat) {.objc: "setSpacing:".}

# Distribution
proc distribution*(self: NSStackView): NSStackViewDistribution {.objc: "distribution".}
proc setDistribution*(self: NSStackView, distribution: NSStackViewDistribution) {.objc: "setDistribution:".}

# Alignment
proc alignment*(self: NSStackView): NSInteger {.objc: "alignment".}
proc setAlignment*(self: NSStackView, alignment: NSInteger) {.objc: "setAlignment:".}

# Views management
proc views*(self: NSStackView): NSArray[NSView] {.objc: "views".}
proc addView*(self: NSStackView, view: NSView, gravity: NSStackViewGravity) {.objc: "addView:inGravity:".}
proc insertView*(self: NSStackView, view: NSView, index: NSInteger, gravity: NSStackViewGravity) {.objc: "insertView:atIndex:inGravity:".}
proc removeView*(self: NSStackView, view: NSView) {.objc: "removeView:".}

# Edge insets
proc edgeInsets*(self: NSStackView): NSEdgeInsets {.objc: "edgeInsets".}
proc setEdgeInsets*(self: NSStackView, edgeInsets: NSEdgeInsets) {.objc: "setEdgeInsets:".}

# Arranged subviews (modern API - macOS 10.11+)
proc arrangedSubviews*(self: NSStackView): NSArray[NSView] {.objc: "arrangedSubviews".}
proc addArrangedSubview*(self: NSStackView, view: NSView) {.objc: "addArrangedSubview:".}
proc insertArrangedSubview*(self: NSStackView, view: NSView, index: NSInteger) {.objc: "insertArrangedSubview:atIndex:".}
proc removeArrangedSubview*(self: NSStackView, view: NSView) {.objc: "removeArrangedSubview:".}

# Detached views
proc detachedViews*(self: NSStackView): NSArray[NSView] {.objc: "detachedViews".}

# Custom spacing
proc setCustomSpacing*(self: NSStackView, spacing: CGFloat, afterView: NSView) {.objc: "setCustomSpacing:afterView:".}
proc customSpacingAfterView*(self: NSStackView, view: NSView): CGFloat {.objc: "customSpacingAfterView:".}

# Visibility priority
proc setVisibilityPriority*(self: NSStackView, priority: CGFloat, forView: NSView) {.objc: "setVisibilityPriority:forView:".}
proc visibilityPriorityForView*(self: NSStackView, view: NSView): CGFloat {.objc: "visibilityPriorityForView:".}

# Clipping resistance priority
proc clippingResistancePriorityForOrientation*(self: NSStackView, orientation: NSUserInterfaceLayoutOrientation): CGFloat {.objc: "clippingResistancePriorityForOrientation:".}
proc setClippingResistancePriority*(self: NSStackView, priority: CGFloat, forOrientation: NSUserInterfaceLayoutOrientation) {.objc: "setClippingResistancePriority:forOrientation:".}

# Detachment behavior
proc detachesHiddenViews*(self: NSStackView): BOOL {.objc: "detachesHiddenViews".}
proc setDetachesHiddenViews*(self: NSStackView, detaches: BOOL) {.objc: "setDetachesHiddenViews:".}
