## NSImageSymbolConfiguration bindings for macOS AppKit
## Based on https://developer.apple.com/documentation/appkit/nsimage/symbolconfiguration-swift.class

import ../objc/runtime
import ../foundation/[nsarray, nsstring]
import ../core_graphics/cggeometry
import nsimage
import nscolor

type
  NSImageSymbolScale* {.size: sizeof(uint).} = enum
    NSImageSymbolScaleSmall = 1
    NSImageSymbolScaleMedium = 2
    NSImageSymbolScaleLarge = 3

  NSImageSymbolWeight* = CGFloat

const
  NSImageSymbolWeightUnspecified*: NSImageSymbolWeight = 0.0
  NSImageSymbolWeightUltraLight*: NSImageSymbolWeight = -0.8
  NSImageSymbolWeightThin*: NSImageSymbolWeight = -0.6
  NSImageSymbolWeightLight*: NSImageSymbolWeight = -0.4
  NSImageSymbolWeightRegular*: NSImageSymbolWeight = 0.0
  NSImageSymbolWeightMedium*: NSImageSymbolWeight = 0.23
  NSImageSymbolWeightSemibold*: NSImageSymbolWeight = 0.3
  NSImageSymbolWeightBold*: NSImageSymbolWeight = 0.4
  NSImageSymbolWeightHeavy*: NSImageSymbolWeight = 0.56
  NSImageSymbolWeightBlack*: NSImageSymbolWeight = 0.62

# ConfigurationWithPointSize
proc configurationWithPointSize*(class: typedesc[NSImageSymbolConfiguration], pointSize: CGFloat): NSImageSymbolConfiguration {.objc: "configurationWithPointSize:".}

# ConfigurationWithPointSizeAndWeight
proc configurationWithPointSize*(class: typedesc[NSImageSymbolConfiguration], pointSize: CGFloat, weight: NSImageSymbolWeight): NSImageSymbolConfiguration {.objc: "configurationWithPointSize:weight:".}

# ConfigurationWithPointSizeWeightScale
proc configurationWithPointSize*(class: typedesc[NSImageSymbolConfiguration], pointSize: CGFloat, weight: NSImageSymbolWeight, scale: NSImageSymbolScale): NSImageSymbolConfiguration {.objc: "configurationWithPointSize:weight:scale:".}

# ConfigurationWithTextStyle
proc configurationWithTextStyle*(class: typedesc[NSImageSymbolConfiguration], style: NSString): NSImageSymbolConfiguration {.objc: "configurationWithTextStyle:".}

# ConfigurationWithTextStyleAndScale
proc configurationWithTextStyle*(class: typedesc[NSImageSymbolConfiguration], style: NSString, scale: NSImageSymbolScale): NSImageSymbolConfiguration {.objc: "configurationWithTextStyle:scale:".}

# ConfigurationWithScale
proc configurationWithScale*(class: typedesc[NSImageSymbolConfiguration], scale: NSImageSymbolScale): NSImageSymbolConfiguration {.objc: "configurationWithScale:".}

# ConfigurationPreferringMonochrome
proc configurationPreferringMonochrome*(class: typedesc[NSImageSymbolConfiguration]): NSImageSymbolConfiguration {.objc: "configurationPreferringMonochrome".}

# ConfigurationPreferringHierarchical
proc configurationPreferringHierarchical*(class: typedesc[NSImageSymbolConfiguration]): NSImageSymbolConfiguration {.objc: "configurationPreferringHierarchical".}

# ConfigurationWithHierarchicalColor
proc configurationWithHierarchicalColor*(class: typedesc[NSImageSymbolConfiguration], color: NSColor): NSImageSymbolConfiguration {.objc: "configurationWithHierarchicalColor:".}

# ConfigurationWithPaletteColors
proc configurationWithPaletteColors*(class: typedesc[NSImageSymbolConfiguration], colors: NSArray[NSColor]): NSImageSymbolConfiguration {.objc: "configurationWithPaletteColors:".}

# ConfigurationPreferringMulticolor
proc configurationPreferringMulticolor*(class: typedesc[NSImageSymbolConfiguration]): NSImageSymbolConfiguration {.objc: "configurationPreferringMulticolor".}

# ApplyingConfiguration
proc configurationByApplyingConfiguration*(self: NSImageSymbolConfiguration, other: NSImageSymbolConfiguration): NSImageSymbolConfiguration {.objc: "configurationByApplyingConfiguration:".}

# NSImage extension for symbol configuration
proc withSymbolConfiguration*(self: NSImage, configuration: NSImageSymbolConfiguration): NSImage {.objc: "imageWithSymbolConfiguration:".}
