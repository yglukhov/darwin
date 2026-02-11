import ../objc/runtime

type
  NSRange* {.pure, bycopy.} = object
    location*: NSUInteger
    length*: NSUInteger

  NSRangePointer* = ptr NSRange

const
  NSNotFound* = NSInteger.high
  NSRangeEmpty* = NSRange(location: cast[NSUInteger](NSNotFound), length: 0)

proc NSMakeRange*(loc, len: NSUInteger): NSRange {.inline.} =
  NSRange(location: loc, length: len)
