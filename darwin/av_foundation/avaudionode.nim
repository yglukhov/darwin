## AVAudioNode - base class for audio nodes

import ../objc/runtime

type
  AVAudioNode* = ptr object of NSObject
  AVAudioNodeBus* = NSUInteger
  AVAudioInputNode* = ptr object of AVAudioNode
  AVAudioOutputNode* = ptr object of AVAudioNode

# Common node methods would go here if needed
