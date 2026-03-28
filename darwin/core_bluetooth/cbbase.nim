{.passL: "-framework CoreBluetooth".}

import ../objc/[runtime]
import ../foundation/[nsstring, nsdata, nsuuid]

type
  CBManager* = ptr object of NSObject
  CBUUID* = ptr object of NSObject
  CBAttribute* = ptr object of NSObject

  CBManagerAuthorization* {.size: sizeof(uint).} = enum
    CBManagerAuthorizationNotDetermined = 0,
    CBManagerAuthorizationRestricted,
    CBManagerAuthorizationDenied,
    CBManagerAuthorizationAllowedAlways

  CBManagerState* {.size: sizeof(uint).} = enum
    CBManagerStateUnknown = 0,
    CBManagerStateResetting,
    CBManagerStateUnsupported,
    CBManagerStateUnauthorized,
    CBManagerStatePoweredOff,
    CBManagerStatePoweredOn,

## CBManager
proc state*(self: CBManager): CBManagerState {.objc: "state".}
proc authorization*(self: CBManager): CBManagerAuthorization {.objc: "authorization".}

## CBUUID
proc withString*(self: typedesc[CBUUID], str: cstring): CBUUID {.objc:"UUIDWithString:".}
proc withData*(self: typedesc[CBUUID], data: NSData): CBUUID {.objc:"UUIDWithData:".}
proc withNSUUID*(self: typedesc[CBUUID], uuid: NSUUID): CBUUID {.objc:"UUIDWithNSUUID:".}
proc UUIDString*(self: CBUUID): NSString {.objc: "UUIDString".}
proc data*(self: CBUUID): NSData {.objc: "data".}
proc UUID*(self: CBAttribute): CBUUID {.objc: "UUID".}
