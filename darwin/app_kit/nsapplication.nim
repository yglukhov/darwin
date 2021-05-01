import ./nsresponder
type 
  NSApplication* = ptr object of NSResponder
  NSApplicationActivationPolicy* {.size: sizeof(uint).} = enum
    NSApplicationActivationPolicyRegular
    NSApplicationActivationPolicyAccessory
    NSApplicationActivationPolicyProhibited