import std / [unittest, strutils]

import darwin / core_services / fsstream

test "fstream enums":

  check cast[FSEventStreamEventFlags]({FSEventStreamEventFlag.MustScanSubDirs}).uint32.toHex() ==   "00000001"
  check cast[FSEventStreamEventFlags]({MustScanSubDirs}).uint32.toHex() ==     "00000001"
  check cast[FSEventStreamEventFlags]({ItemIsFile}).uint32.toHex() ==          "00010000"
  check cast[FSEventStreamEventFlags]({ItemIsDir}).uint32.toHex() ==           "00020000"
  check cast[FSEventStreamEventFlags]({ItemFinderInfoMod}).uint32.toHex() ==   "00002000"
  check cast[FSEventStreamEventFlags]({ItemIsSymlink}).uint32.toHex() ==       "00040000"
