type 
  NSDragOperation* {.size: sizeof(uint).} = enum
    NSDragOperationEvery = uint.high
    NSDragOperationNone = 0
    NSDragOperationCopy = 1
    NSDragOperationLink = 2
    NSDragOperationGeneric = 4
    NSDragOperationPrivate = 8
    NSDragOperationAll_Obsolete = 15
    NSDragOperationMove = 16
    NSDragOperationDelete = 32