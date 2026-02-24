import ../objc/runtime
import ../foundation/[nsstring, nsurl, nsarray, nsdictionary, nsdate]
import ./nsimage
import ./nsrunningapplication

type
  NSWorkspace* = ptr object of NSObject
  NSWorkspaceOpenConfiguration* = ptr object of NSObject

# Shared workspace
proc sharedWorkspace*(self: typedesc[NSWorkspace]): NSWorkspace {.objc.}

# Notification center
proc notificationCenter*(self: NSWorkspace): NSObject {.objc.}

# Opening URLs and files
proc openURL*(self: NSWorkspace, url: NSURL): BOOL {.objc: "openURL:".}
proc selectFile*(self: NSWorkspace, fullPath: NSString, inFileViewerRootedAtPath: NSString): BOOL {.objc: "selectFile:inFileViewerRootedAtPath:".}
proc activateFileViewerSelectingURLs*(self: NSWorkspace, fileURLs: NSArray[NSURL]) {.objc: "activateFileViewerSelectingURLs:".}
proc showSearchResultsForQueryString*(self: NSWorkspace, queryString: NSString): BOOL {.objc: "showSearchResultsForQueryString:".}

# File system
proc noteFileSystemChanged*(self: NSWorkspace, path: NSString) {.objc: "noteFileSystemChanged:".}
proc isFilePackageAtPath*(self: NSWorkspace, fullPath: NSString): BOOL {.objc: "isFilePackageAtPath:".}

# Icons
proc iconForFile*(self: NSWorkspace, fullPath: NSString): NSImage {.objc: "iconForFile:".}
proc iconForFiles*(self: NSWorkspace, fullPaths: NSArray[NSString]): NSImage {.objc: "iconForFiles:".}
proc setIcon*(self: NSWorkspace, image: NSImage, forFile: NSString, options: NSUInteger): BOOL {.objc: "setIcon:forFile:options:".}

# File labels
proc fileLabels*(self: NSWorkspace): NSArray[NSString] {.objc.}
proc fileLabelColors*(self: NSWorkspace): NSArray[NSObject] {.objc.}

# Application management
proc URLForApplicationWithBundleIdentifier*(self: NSWorkspace, bundleIdentifier: NSString): NSURL {.objc: "URLForApplicationWithBundleIdentifier:".}
proc URLsForApplicationsWithBundleIdentifier*(self: NSWorkspace, bundleIdentifier: NSString): NSArray[NSURL] {.objc: "URLsForApplicationsWithBundleIdentifier:".}
proc URLForApplicationToOpenURL*(self: NSWorkspace, url: NSURL): NSURL {.objc: "URLForApplicationToOpenURL:".}
proc URLsForApplicationsToOpenURL*(self: NSWorkspace, url: NSURL): NSArray[NSURL] {.objc: "URLsForApplicationsToOpenURL:".}

# Running applications
proc frontmostApplication*(self: NSWorkspace): NSRunningApplication {.objc.}
proc menuBarOwningApplication*(self: NSWorkspace): NSRunningApplication {.objc.}
proc runningApplications*(self: NSWorkspace): NSArray[NSRunningApplication] {.objc.}

# Hide other applications
proc hideOtherApplications*(self: NSWorkspace) {.objc.}

# Power off extension (currently not implemented by Apple)
proc extendPowerOffBy*(self: NSWorkspace, requested: NSInteger): NSInteger {.objc: "extendPowerOffBy:".}

# Workspace open configuration (macOS 10.15+)
proc configuration*(self: typedesc[NSWorkspaceOpenConfiguration]): NSWorkspaceOpenConfiguration {.objc.}
proc promptsUserIfNeeded*(self: NSWorkspaceOpenConfiguration): BOOL {.objc.}
proc setPromptsUserIfNeeded*(self: NSWorkspaceOpenConfiguration, value: BOOL) {.objc: "setPromptsUserIfNeeded:".}
proc addsToRecentItems*(self: NSWorkspaceOpenConfiguration): BOOL {.objc.}
proc setAddsToRecentItems*(self: NSWorkspaceOpenConfiguration, value: BOOL) {.objc: "setAddsToRecentItems:".}
proc activates*(self: NSWorkspaceOpenConfiguration): BOOL {.objc.}
proc setActivates*(self: NSWorkspaceOpenConfiguration, value: BOOL) {.objc: "setActivates:".}
proc hides*(self: NSWorkspaceOpenConfiguration): BOOL {.objc.}
proc setHides*(self: NSWorkspaceOpenConfiguration, value: BOOL) {.objc: "setHides:".}
proc hidesOthers*(self: NSWorkspaceOpenConfiguration): BOOL {.objc.}
proc setHidesOthers*(self: NSWorkspaceOpenConfiguration, value: BOOL) {.objc: "setHidesOthers:".}
proc forPrinting*(self: NSWorkspaceOpenConfiguration): BOOL {.objc.}
proc setForPrinting*(self: NSWorkspaceOpenConfiguration, value: BOOL) {.objc: "setForPrinting:".}
proc createsNewApplicationInstance*(self: NSWorkspaceOpenConfiguration): BOOL {.objc.}
proc setCreatesNewApplicationInstance*(self: NSWorkspaceOpenConfiguration, value: BOOL) {.objc: "setCreatesNewApplicationInstance:".}
proc allowsRunningApplicationSubstitution*(self: NSWorkspaceOpenConfiguration): BOOL {.objc.}
proc setAllowsRunningApplicationSubstitution*(self: NSWorkspaceOpenConfiguration, value: BOOL) {.objc: "setAllowsRunningApplicationSubstitution:".}
proc requiresUniversalLinks*(self: NSWorkspaceOpenConfiguration): BOOL {.objc.}
proc setRequiresUniversalLinks*(self: NSWorkspaceOpenConfiguration, value: BOOL) {.objc: "setRequiresUniversalLinks:".}

# Notifications
# Note: These are NSNotificationName (typedef for NSString) in Objective-C
var NSWorkspaceDidLaunchApplicationNotification* {.importc.}: NSString
var NSWorkspaceDidTerminateApplicationNotification* {.importc.}: NSString
var NSWorkspaceDidHideApplicationNotification* {.importc.}: NSString
var NSWorkspaceDidUnhideApplicationNotification* {.importc.}: NSString
var NSWorkspaceDidActivateApplicationNotification* {.importc.}: NSString
var NSWorkspaceDidDeactivateApplicationNotification* {.importc.}: NSString
var NSWorkspaceDidChangeFileLabelsNotification* {.importc.}: NSString
var NSWorkspaceActiveSpaceDidChangeNotification* {.importc.}: NSString
var NSWorkspaceWillPowerOffNotification* {.importc.}: NSString
var NSWorkspaceWillSleepNotification* {.importc.}: NSString
var NSWorkspaceDidWakeNotification* {.importc.}: NSString
var NSWorkspaceScreensDidSleepNotification* {.importc.}: NSString
var NSWorkspaceScreensDidWakeNotification* {.importc.}: NSString
var NSWorkspaceSessionDidBecomeActiveNotification* {.importc.}: NSString
var NSWorkspaceSessionDidResignActiveNotification* {.importc.}: NSString
