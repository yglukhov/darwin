import ../objc/[runtime]

type
  WKOpenPanelParameters* = ptr object of NSObject

# Check if the panel allows selecting multiple files
proc allowsMultipleSelection*(self: WKOpenPanelParameters): BOOL {.objc: "allowsMultipleSelection".}

# Check if the panel allows selecting directories
proc allowsDirectories*(self: WKOpenPanelParameters): BOOL {.objc: "allowsDirectories".}
