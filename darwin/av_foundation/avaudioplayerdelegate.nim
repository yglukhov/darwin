import ../objc/runtime
import ../foundation/[nsstring, nserror]
import ./avaudioplayer

# AVAudioPlayerDelegate protocol methods
# Note: These are delegate callback methods that should be implemented by classes
# that conform to the AVAudioPlayerDelegate protocol.

proc audioPlayerDidFinishPlayingSuccessfully*(self: AVAudioPlayerDelegate, player: AVAudioPlayer, successfully: BOOL) {.objc: "audioPlayerDidFinishPlaying:successfully:".}
proc audioPlayerDecodeErrorDidOccur*(self: AVAudioPlayerDelegate, player: AVAudioPlayer, error: NSError) {.objc: "audioPlayerDecodeErrorDidOccur:error:".}

# iOS only, but included for completeness
proc audioPlayerBeginInterruption*(self: AVAudioPlayerDelegate, player: AVAudioPlayer) {.objc.}
proc audioPlayerEndInterruption*(self: AVAudioPlayerDelegate, player: AVAudioPlayer, flags: NSUInteger) {.objc: "audioPlayerEndInterruption:withFlags:".}
proc audioPlayerEndInterruptionWithOptions*(self: AVAudioPlayerDelegate, player: AVAudioPlayer, flags: NSUInteger) {.objc: "audioPlayerEndInterruption:withOptions:".}

# Interruption handling (newer APIs)
proc audioPlayerInterruptionBegan*(self: AVAudioPlayerDelegate, player: AVAudioPlayer) {.objc.}
proc audioPlayerInterruptionEnded*(self: AVAudioPlayerDelegate, player: AVAudioPlayer, options: NSUInteger) {.objc: "audioPlayerInterruptionEnded:withOptions:".}
