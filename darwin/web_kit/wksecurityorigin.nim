import ../objc/[runtime]

type
  WKSecurityOrigin* = ptr object of NSObject

# Get the host of the security origin
proc host*(self: WKSecurityOrigin): NSString {.objc: "host".}

# Get the protocol of the security origin
proc protocol*(self: WKSecurityOrigin): NSString {.objc: "protocol".}

# Get the port of the security origin
proc port*(self: WKSecurityOrigin): int {.objc: "port".}
