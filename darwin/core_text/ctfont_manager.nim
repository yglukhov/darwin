import darwin / core_foundation / [ cfurl, cferror ]

type
    CTFontManagerScope* {.size: sizeof(uint32).} = enum
        kCTFontManagerScopeNone         = 0,
        kCTFontManagerScopeProcess      = 1,
        kCTFontManagerScopeUser         = 2, # not supported in iOS
        kCTFontManagerScopeSession      = 3  # not supported in iOS

proc CTFontManagerRegisterFontsForURL*(fontURL: CFURL, scope: CTFontManagerScope, error: ptr CFError): bool {.importc.}
