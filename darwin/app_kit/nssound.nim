import ../objc/runtime
import ../foundation/[nsstring, nsurl, nsdata, nsarray, nsdate]
import ./nspasteboard

type
  NSSound* = ptr object of NSObject
  NSSoundName* = NSString
  NSSoundPlaybackDeviceIdentifier* = NSString

# Class methods
proc soundNamed*(self: typedesc[NSSound], name: NSSoundName): NSSound {.objc: "soundNamed:".}
proc canInitWithPasteboard*(self: typedesc[NSSound], pasteboard: NSPasteboard): BOOL {.objc: "canInitWithPasteboard:".}

# Initializers
proc initWithContentsOfURL*(self: NSSound, url: NSURL, byReference: BOOL): NSSound {.objc: "initWithContentsOfURL:byReference:".}
proc initWithContentsOfFile*(self: NSSound, path: NSString, byReference: BOOL): NSSound {.objc: "initWithContentsOfFile:byReference:".}
proc initWithData*(self: NSSound, data: NSData): NSSound {.objc: "initWithData:".}
proc initWithPasteboard*(self: NSSound, pasteboard: NSPasteboard): NSSound {.objc: "initWithPasteboard:".}

# Name property
proc setName*(self: NSSound, name: NSSoundName): BOOL {.objc: "setName:".}
proc name*(self: NSSound): NSSoundName {.objc.}

# Pasteboard support
proc soundUnfilteredTypes*(self: typedesc[NSSound]): NSArray[NSString] {.objc.}
proc writeToPasteboard*(self: NSSound, pasteboard: NSPasteboard) {.objc: "writeToPasteboard:".}

# Sound operations
proc play*(self: NSSound): BOOL {.objc.}
proc pause*(self: NSSound): BOOL {.objc.}
proc resume*(self: NSSound): BOOL {.objc.}
proc stop*(self: NSSound): BOOL {.objc.}
proc isPlaying*(self: NSSound): BOOL {.objc.}

# Properties
proc duration*(self: NSSound): NSTimeInterval {.objc.}
proc volume*(self: NSSound): float32 {.objc.}
proc setVolume*(self: NSSound, volume: float32) {.objc: "setVolume:".}
proc currentTime*(self: NSSound): NSTimeInterval {.objc.}
proc setCurrentTime*(self: NSSound, time: NSTimeInterval) {.objc: "setCurrentTime:".}
proc loops*(self: NSSound): BOOL {.objc.}
proc setLoops*(self: NSSound, loops: BOOL) {.objc: "setLoops:".}
proc playbackDeviceIdentifier*(self: NSSound): NSSoundPlaybackDeviceIdentifier {.objc.}
proc setPlaybackDeviceIdentifier*(self: NSSound, identifier: NSSoundPlaybackDeviceIdentifier) {.objc: "setPlaybackDeviceIdentifier:".}

# Note: NSSoundPboardType is deprecated, use NSPasteboardTypeSound from nspasteboard instead
# var NSSoundPboardType* {.importc.}: NSString
