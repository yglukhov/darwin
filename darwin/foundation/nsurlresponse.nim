import ../objc/[runtime]
import ../foundation/[nsstring, nsurl]

type
  NSURLResponse* = ptr object of NSObject

# Properties

# Get the expected content length of the response
proc expectedContentLength*(self: NSURLResponse): int64 {.objc: "expectedContentLength".}

# Get the MIME type of the response
proc MIMEType*(self: NSURLResponse): NSString {.objc: "MIMEType".}

# Get the suggested filename for the response
proc suggestedFilename*(self: NSURLResponse): NSString {.objc: "suggestedFilename".}

# Get the URL for the response
proc URL*(self: NSURLResponse): NSURL {.objc: "URL".}

# Get the text encoding name of the response
proc textEncodingName*(self: NSURLResponse): NSString {.objc: "textEncodingName".}
