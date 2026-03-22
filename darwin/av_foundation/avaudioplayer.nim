import ../objc/runtime
import ../foundation/[nsurl, nsdata, nsstring, nserror, nsnumber, nsdate, nsdictionary]
import ./avaudioformat

type
  AVAudioPlayer* = ptr object of NSObject

type
  AVAudioPlayerDelegate* = ptr object of NSObject

# Class methods

# Initialization
proc initWithContentsOfURL*(self: AVAudioPlayer, url: NSURL, error: ptr NSError = nil): AVAudioPlayer {.objc: "initWithContentsOfURL:error:", discardable.}
proc initWithData*(self: AVAudioPlayer, data: NSData, error: ptr NSError = nil): AVAudioPlayer {.objc: "initWithData:error:", discardable.}

# Playing
proc play*(self: AVAudioPlayer): BOOL {.objc.}
proc playAtTime*(self: AVAudioPlayer, time: NSTimeInterval): BOOL {.objc: "playAtTime:".}
proc pause*(self: AVAudioPlayer) {.objc.}
proc stop*(self: AVAudioPlayer) {.objc.}
proc prepareToPlay*(self: AVAudioPlayer): BOOL {.objc.}

# State properties
proc isPlaying*(self: AVAudioPlayer): BOOL {.objc.}
proc isMeteringEnabled*(self: AVAudioPlayer): BOOL {.objc.}
proc setMeteringEnabled*(self: AVAudioPlayer, enabled: BOOL) {.objc: "setMeteringEnabled:".}

# Audio properties
proc numberOfChannels*(self: AVAudioPlayer): NSInteger {.objc.}
proc duration*(self: AVAudioPlayer): NSTimeInterval {.objc.}
proc currentTime*(self: AVAudioPlayer): NSTimeInterval {.objc.}
proc setCurrentTime*(self: AVAudioPlayer, time: NSTimeInterval) {.objc: "setCurrentTime:".}
proc deviceCurrentTime*(self: AVAudioPlayer): NSTimeInterval {.objc.}

# Volume and pan
proc volume*(self: AVAudioPlayer): float32 {.objc.}
proc setVolume*(self: AVAudioPlayer, volume: float32) {.objc: "setVolume:".}
proc pan*(self: AVAudioPlayer): float32 {.objc.}
proc setPan*(self: AVAudioPlayer, pan: float32) {.objc: "setPan:".}

# Rate (for iOS 5.0+, macOS 10.8+)
proc rate*(self: AVAudioPlayer): float32 {.objc.}
proc setRate*(self: AVAudioPlayer, rate: float32) {.objc: "setRate:".}
proc enableRate*(self: AVAudioPlayer): BOOL {.objc.}
proc setEnableRate*(self: AVAudioPlayer, enable: BOOL) {.objc: "setEnableRate:".}

# Looping
proc numberOfLoops*(self: AVAudioPlayer): NSInteger {.objc.}
proc setNumberOfLoops*(self: AVAudioPlayer, loops: NSInteger) {.objc: "setNumberOfLoops:".}

# Settings and format
proc settings*(self: AVAudioPlayer): NSDictionary {.objc.}
proc format*(self: AVAudioPlayer): AVAudioFormat {.objc.}

# URL and data source
proc url*(self: AVAudioPlayer): NSURL {.objc.}
proc data*(self: AVAudioPlayer): NSData {.objc.}

# Delegate
proc delegate*(self: AVAudioPlayer): AVAudioPlayerDelegate {.objc.}
proc setDelegate*(self: AVAudioPlayer, delegate: AVAudioPlayerDelegate) {.objc: "setDelegate:".}

# Metering
proc updateMeters*(self: AVAudioPlayer) {.objc.}
proc peakPowerForChannel*(self: AVAudioPlayer, channelNumber: NSInteger): float32 {.objc: "peakPowerForChannel:".}
proc averagePowerForChannel*(self: AVAudioPlayer, channelNumber: NSInteger): float32 {.objc: "averagePowerForChannel:".}

# Type
proc newAVAudioPlayer*(): AVAudioPlayer =
  ## Convenience constructor for AVAudioPlayer
  AVAudioPlayer.alloc().init()
