import ../objc/runtime

const 
  NSModalResponseOK*          = 1
  NSModalResponseCancel*      = 0
  NSModalResponseContinue*    = -1002
  NSModalResponseStop*        = -1000
  NSModalResponseAbort*       = -1001
  NSAlertFirstButtonReturn*   = 1000
  NSAlertSecondButtonReturn*  = 1001
  NSAlertThirdButtonReturn*   = 1002

type 
  NSAlert* = ptr object of NSObject
  NSAlertStyle* {.size: sizeof(uint).} = enum
    NSAlertStyleWarning = 0
    NSAlertStyleInformational = 1
    NSAlertStyleCritical = 2