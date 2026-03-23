## AVAudioPlayerNode - playback node for audio buffers

import ../objc/runtime
import ./avaudionode
import ./avaudiopcmbuffer

# Type aliases
type
  AVAudioPlayerNodeBufferOptions* = NSUInteger
  AVAudioTime* = pointer  # Opaque for now
  NSTimeInterval* = float64

type
  AVAudioPlayerNode* = ptr object of AVAudioNode

# Playing
proc play*(self: AVAudioPlayerNode) {.objc.}
proc pause*(self: AVAudioPlayerNode) {.objc.}
proc stop*(self: AVAudioPlayerNode) {.objc.}

# Scheduling buffers
# Note: scheduleBuffer: doesn't exist, use scheduleBuffer:completionHandler: with nil
proc scheduleBuffer*(self: AVAudioPlayerNode, buffer: AVAudioPCMBuffer, completionHandler: pointer = nil) {.objc: "scheduleBuffer:completionHandler:".}

proc scheduleBufferAtTimeCompletionHandler*(self: AVAudioPlayerNode, buffer: AVAudioPCMBuffer,
    atTime: AVAudioTime, options: AVAudioPlayerNodeBufferOptions, 
    completionHandler: pointer = nil) {.objc: "scheduleBuffer:atTime:options:completionHandler:".}

# Scheduling files
proc scheduleFileAtTimeCompletionHandler*(self: AVAudioPlayerNode, file: AVAudioFile,
    atTime: AVAudioTime, completionHandler: pointer = nil) {.objc: "scheduleFile:atTime:completionHandler:".}

# State
proc isPlaying*(self: AVAudioPlayerNode): BOOL {.objc.}
proc nodeTimeForPlayerTime*(self: AVAudioPlayerNode, playerTime: AVAudioTime): AVAudioTime {.objc: "nodeTimeForPlayerTime:".}
proc playerTimeForNodeTime*(self: AVAudioPlayerNode, nodeTime: AVAudioTime): AVAudioTime {.objc: "playerTimeForNodeTime:".}

const
  AVAudioPlayerNodeBufferLoops* = 0x01
  AVAudioPlayerNodeBufferInterrupts* = 0x02
  AVAudioPlayerNodeBufferInterruptsAtLoop* = 0x04
