## AVAudioEngine - audio processing graph

import ../objc/runtime
import ../foundation/[nserror, nsstring]
import ./avaudioformat
import ./avaudionode
import ./avaudiomixernode

type
  AVAudioEngine* = ptr object of NSObject

# Managing the audio engine
proc startAndReturnError*(self: AVAudioEngine, error: ptr NSError = nil): BOOL {.objc: "startAndReturnError:".}
proc stop*(self: AVAudioEngine) {.objc.}
proc reset*(self: AVAudioEngine) {.objc.}

# Audio nodes
proc inputNode*(self: AVAudioEngine): AVAudioInputNode {.objc.}
proc outputNode*(self: AVAudioEngine): AVAudioOutputNode {.objc.}
proc mainMixerNode*(self: AVAudioEngine): AVAudioMixerNode {.objc.}

# Managing nodes
proc attachNode*(self: AVAudioEngine, node: AVAudioNode) {.objc: "attachNode:".}
proc detachNode*(self: AVAudioEngine, node: AVAudioNode) {.objc: "detachNode:".}

# Connections
proc connect*(self: AVAudioEngine, node1: AVAudioNode, toNode: AVAudioNode, 
              fromBus: AVAudioNodeBus, toBus: AVAudioNodeBus, format: AVAudioFormat) {.objc: "connect:to:fromBus:toBus:format:".}

proc connect*(self: AVAudioEngine, node1: AVAudioNode, toNode: AVAudioNode, format: AVAudioFormat) {.objc: "connect:to:format:".}

proc disconnectNodeInput*(self: AVAudioEngine, node: AVAudioNode, bus: AVAudioNodeBus) {.objc: "disconnectNodeInput:bus:".}
proc disconnectNodeOutput*(self: AVAudioEngine, node: AVAudioNode, bus: AVAudioNodeBus) {.objc: "disconnectNodeOutput:bus:".}

# State
proc isRunning*(self: AVAudioEngine): BOOL {.objc.}

# Convenience
proc prepare*(self: AVAudioEngine) {.objc.}
