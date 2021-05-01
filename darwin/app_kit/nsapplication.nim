import ./nsresponder
type 
  NSApplication* = ptr object of NSResponder
  NSApplicationActivationPolicy* {.size: sizeof(cint).} = enum
    NSApplicationActivationPolicyRegular
    NSApplicationActivationPolicyAccessory
    NSApplicationActivationPolicyProhibited