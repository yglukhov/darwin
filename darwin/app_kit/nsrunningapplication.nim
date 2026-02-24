import ../objc/runtime
import ../foundation/[nsstring, nsurl, nsarray, nsdate]
import ./nsimage
import ./nsapplication

type
  NSRunningApplication* = ptr object of NSObject

  NSApplicationActivationOptions* {.size: sizeof(uint).} = enum
    NSApplicationActivateAllWindows = 1 shl 0
    NSApplicationActivateIgnoringOtherApps = 1 shl 1

# Class methods
proc runningApplicationsWithBundleIdentifier*(self: typedesc[NSRunningApplication], bundleIdentifier: NSString): NSArray[NSRunningApplication] {.objc: "runningApplicationsWithBundleIdentifier:".}
proc runningApplicationWithProcessIdentifier*(self: typedesc[NSRunningApplication], pid: cint): NSRunningApplication {.objc: "runningApplicationWithProcessIdentifier:".}
proc currentApplication*(self: typedesc[NSRunningApplication]): NSRunningApplication {.objc.}
proc terminateAutomaticallyTerminableApplications*(self: typedesc[NSRunningApplication]) {.objc.}

# Properties
proc isTerminated*(self: NSRunningApplication): BOOL {.objc.}
proc isFinishedLaunching*(self: NSRunningApplication): BOOL {.objc.}
proc isHidden*(self: NSRunningApplication): BOOL {.objc.}
proc isActive*(self: NSRunningApplication): BOOL {.objc.}
proc ownsMenuBar*(self: NSRunningApplication): BOOL {.objc.}
proc activationPolicy*(self: NSRunningApplication): NSApplicationActivationPolicy {.objc.}
proc localizedName*(self: NSRunningApplication): NSString {.objc.}
proc bundleIdentifier*(self: NSRunningApplication): NSString {.objc.}
proc bundleURL*(self: NSRunningApplication): NSURL {.objc.}
proc executableURL*(self: NSRunningApplication): NSURL {.objc.}
proc processIdentifier*(self: NSRunningApplication): cint {.objc.}
proc launchDate*(self: NSRunningApplication): NSDate {.objc.}
proc icon*(self: NSRunningApplication): NSImage {.objc.}
proc executableArchitecture*(self: NSRunningApplication): NSInteger {.objc.}

# Methods
proc hide*(self: NSRunningApplication): BOOL {.objc.}
proc unhide*(self: NSRunningApplication): BOOL {.objc.}
proc activateWithOptions*(self: NSRunningApplication, options: NSApplicationActivationOptions): BOOL {.objc: "activateWithOptions:".}
proc terminate*(self: NSRunningApplication): BOOL {.objc.}
proc forceTerminate*(self: NSRunningApplication): BOOL {.objc.}
