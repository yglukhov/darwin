import ../objc/runtime

type
  WKUserScript* = ptr object of NSObject
  WKUserScriptInjectionTime* {.size: sizeof(uint32).} = enum
    AtDocumentStart = 0
    AtDocumentEnd = 1

proc initWithSource*(self: WKUserScript, source: NSString, injectionTime: WKUserScriptInjectionTime, forMainFrameOnly: BOOL): WKUserScript {.objc: "initWithSource:injectionTime:forMainFrameOnly:", discardable.}
