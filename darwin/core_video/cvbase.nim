type
  CVSMPTETime* = object
    subframes*: int16
    subframeDivisor*: int16
    counter*: uint32
    typ*: uint32
    flags*: uint32
    hours*: int16
    minutes*: int16
    seconds*: int16
    frames*: int16

  CVTimeStamp* = object
    version*: uint32
    videoTimeScale*: uint32
    videoTime*: int64
    hostTime*: uint64
    rateScalar*: cdouble
    videoRefreshPeriod*: int64
    smpteTime*: CVSMPTETime
    flags*: uint64
    reserved: uint64

  CVOptionFlags* = uint64
