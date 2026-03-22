import ../objc/runtime
import ../foundation/[nsstring, nsdictionary]

type
  AVAudioFormat* = ptr object of NSObject
  AVAudioCommonFormat* = distinct NSUInteger

# Common format properties
proc sampleRate*(self: AVAudioFormat): float64 {.objc.}
proc channelCount*(self: AVAudioFormat): NSUInteger {.objc.}
proc commonFormat*(self: AVAudioFormat): AVAudioCommonFormat {.objc.}
proc isInterleaved*(self: AVAudioFormat): BOOL {.objc.}
proc isStandard*(self: AVAudioFormat): BOOL {.objc.}
proc settings*(self: AVAudioFormat): NSDictionary {.objc.}

# Format constants
const
  AVAudioOtherFormat* = AVAudioCommonFormat(0)
  AVAudioPCMFormatFloat32* = AVAudioCommonFormat(1)
  AVAudioPCMFormatFloat64* = AVAudioCommonFormat(2)
  AVAudioPCMFormatInt16* = AVAudioCommonFormat(3)
  AVAudioPCMFormatInt32* = AVAudioCommonFormat(4)
