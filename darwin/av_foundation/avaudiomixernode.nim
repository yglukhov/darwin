## AVAudioMixerNode - audio mixing node

import ../objc/runtime
import ./avaudionode
import ./avaudioformat

type
  AVAudioMixerNode* = ptr object of AVAudioNode

# Output volume
proc outputVolume*(self: AVAudioMixerNode): float32 {.objc.}
proc setOutputVolume*(self: AVAudioMixerNode, volume: float32) {.objc: "setOutputVolume:".}

# Next available input bus
proc nextAvailableInputBus*(self: AVAudioMixerNode): AVAudioNodeBus {.objc.}
