{.passL: "-framework CoreGraphics".}
{.passL: "-framework CoreFoundation".}

type
  CGEventRef = pointer
  CGEventFlags* = uint64

  ModifierKey* = enum
    shift
    control
    alt
    system

proc CGEventCreate(source: pointer): CGEventRef {.
  importc, header: "<CoreGraphics/CoreGraphics.h>".}
proc CGEventGetFlags(event: CGEventRef): CGEventFlags {.
  importc, header: "<CoreGraphics/CoreGraphics.h>".}
proc CFRelease(cf: pointer) {.importc, header: "<CoreFoundation/CoreFoundation.h>".}

const
  CgShiftMask = 0x00020000'u64
  CgCtrlMask = 0x00040000'u64
  CgAltMask = 0x00080000'u64
  CgCmdMask = 0x00100000'u64

proc modifierStateFromCgFlags*(flags: CGEventFlags): set[ModifierKey] =
  ## helper method to get active modifier key's
  ## without this NSApplications will can miss changes in the
  ## modifier key state which results in "sticky" modifier keys.
  if (flags and CgCtrlMask) != 0:
    result.incl ModifierKey.control
  if (flags and CgShiftMask) != 0:
    result.incl ModifierKey.shift
  if (flags and CgAltMask) != 0:
    result.incl ModifierKey.alt
  if (flags and CgCmdMask) != 0:
    result.incl ModifierKey.system

proc tryCurrentModifierState*(state: var set[ModifierKey]): bool =
  let ev = CGEventCreate(nil)
  if ev == nil:
    return false
  let flags = CGEventGetFlags(ev)
  CFRelease(ev)
  state = modifierStateFromCgFlags(flags)
  true
