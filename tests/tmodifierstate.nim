import std/unittest

import darwin/core_graphics/cgeventmodifierstate

suite "modifierstate":
  test "maps individual flags":
    check modifierStateFromCgFlags(0x00020000'u64) == {ModifierKey.shift}
    check modifierStateFromCgFlags(0x00040000'u64) == {ModifierKey.control}
    check modifierStateFromCgFlags(0x00080000'u64) == {ModifierKey.alt}
    check modifierStateFromCgFlags(0x00100000'u64) == {ModifierKey.system}

  test "maps combined flags":
    let flags = 0x00020000'u64 or 0x00040000'u64 or 0x00100000'u64
    check modifierStateFromCgFlags(flags) ==
      {ModifierKey.shift, ModifierKey.control, ModifierKey.system}

  test "tryCurrentModifierState smoke":
    var state: set[ModifierKey]
    let ok = tryCurrentModifierState(state)
    check ok in [true, false]
