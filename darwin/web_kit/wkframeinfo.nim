import ../objc/[runtime]
import ./wksecurityorigin

type
  WKFrameInfo* = ptr object of NSObject

# Check if the frame is the main frame
proc isMainFrame*(self: WKFrameInfo): BOOL {.objc: "isMainFrame".}

# Get the security origin of the frame
proc securityOrigin*(self: WKFrameInfo): WKSecurityOrigin {.objc: "securityOrigin".}
