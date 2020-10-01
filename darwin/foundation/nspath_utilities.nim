import ./nsarray
import ./nsstring

type
  NSSearchPathDomain* {.pure, size: sizeof(uint).} = enum
    user
    local
    network
    system

  NSSearchPathDirectory* {.pure, size: sizeof(uint).} = enum
    application = 1
    demoApplication
    developerApplication
    adminApplication
    library
    developer
    user
    documentation
    document
    coreService
    autosavedInformation
    desktop = 12
    caches = 13
    applicationSupport = 14
    downloads
    inputMethods
    movies
    music
    pictures
    printerDescription
    sharedPublic
    preferencePanes
    applicationScripts
    itemReplacement
    allApplications = 100
    allLibraries = 101
    trash

proc NSSearchPathForDirectoriesInDomains*(d: NSSearchPathDirectory, domains: set[NSSearchPathDomain], expandTilde: bool): NSArray[NSString] {.importc.}
