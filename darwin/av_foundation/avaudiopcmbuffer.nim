## AVAudioPCMBuffer - PCM audio buffer

import ../objc/runtime
import ./avaudioformat

# Type aliases
type
  AVAudioFrameCount* = uint32
  AVAudioChannelCount* = uint32

type
  AVAudioPCMBuffer* = ptr object of NSObject
  AVAudioFile* = ptr object of NSObject  # Forward declaration
  AVAudioChannelLayout* = ptr object of NSObject

# Initialization
proc initWithPCMFormatFrameCapacity*(self: AVAudioPCMBuffer, format: AVAudioFormat,
    frameCapacity: AVAudioFrameCount): AVAudioPCMBuffer {.objc: "initWithPCMFormat:frameCapacity:".}

# Properties
proc frameCapacity*(self: AVAudioPCMBuffer): AVAudioFrameCount {.objc.}
proc frameLength*(self: AVAudioPCMBuffer): AVAudioFrameCount {.objc.}
proc setFrameLength*(self: AVAudioPCMBuffer, length: AVAudioFrameCount) {.objc: "setFrameLength:".}

proc format*(self: AVAudioPCMBuffer): AVAudioFormat {.objc.}

# Audio data access - int16 format
proc int16ChannelData*(self: AVAudioPCMBuffer): ptr ptr int16 {.objc.}

# Float format (alternative)
proc floatChannelData*(self: AVAudioPCMBuffer): ptr ptr cfloat {.objc.}
