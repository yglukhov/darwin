import cfbase, cfstring

var
  anyApplication {.importc: "kCFPreferencesAnyApplication".}: CFString
  currentApplication {.importc: "kCFPreferencesCurrentApplication".}: CFString
  anyHost {.importc: "kCFPreferencesAnyHost".}: CFString
  currentHost {.importc: "kCFPreferencesCurrentHost".}: CFString
  anyUser {.importc: "kCFPreferencesAnyUser".}: CFString
  currentUser {.importc: "kCFPreferencesCurrentUser".}: CFString

template kCFPreferencesAnyApplication*: CFString =
  let a = anyApplication; a
template kCFPreferencesCurrentApplication*: CFString =
  let a = currentApplication; a
template kCFPreferencesAnyHost*: CFString =
  let a = anyHost; a
template kCFPreferencesCurrentHost*: CFString =
  let a = currentHost; a
template kCFPreferencesAnyUser*: CFString =
  let a = anyUser; a
template kCFPreferencesCurrentUser*: CFString =
  let a = currentUser; a

proc CFPreferencesCopyAppValue*(key, appId: CFString): CFPropertyList {.importc.}
proc CFPreferencesAppSynchronize*(appId: CFString): Boolean {.importc.}
proc CFPreferencesSetAppValue*(key: CFString, value: CFPropertyList, appId: CFString) {.importc.}
