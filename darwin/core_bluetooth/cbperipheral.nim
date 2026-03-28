import ./cbbase
import ../objc/[runtime]
import ./cbpeer
import ../foundation/[nsstring, nsarray, nsdata]

type
  CBPeripheral* = ptr object of CBPeer
  CBService* = ptr object of CBAttribute
  CBCharacteristic* = ptr object of CBAttribute
  CBDescriptor* = ptr object of CBAttribute
  CBCharacteristicProperties* {.size: sizeof(uint).} = enum
    CBCharacteristicPropertyBroadcast = 0x01,
    CBCharacteristicPropertyRead = 0x02,
    CBCharacteristicPropertyWriteWithoutResponse = 0x04,
    CBCharacteristicPropertyWrite = 0x08,
    CBCharacteristicPropertyNotify = 0x10,
    CBCharacteristicPropertyIndicate = 0x20,
    CBCharacteristicPropertyAuthenticatedSignedWrites = 0x40,
    CBCharacteristicPropertyExtendedProperties = 0x80,
    CBCharacteristicPropertyNotifyEncryptionRequired = 0x100,
    CBCharacteristicPropertyIndicateEncryptionRequired = 0x200
  CBCharacteristicWriteType* {.size: sizeof(uint).} = enum
    CBCharacteristicWriteWithResponse = 0,
    CBCharacteristicWriteWithoutResponse,
  CBPeripheralState* {.size: sizeof(uint).} = enum
    CBPeripheralStateDisconnected = 0,
    CBPeripheralStateConnecting,
    CBPeripheralStateConnected,
    CBPeripheralStateDisconnecting

proc name*(self: CBPeripheral): NSString {.objc: "name".}
proc delegate*(self: CBPeripheral): NSObject {.objc: "delegate".} # CBPeripheralDelegate
proc discoverServices*(self: CBPeripheral, services: NSArray[CBUUID]) {.objc: "discoverServices:".}
proc discoverIncludedServices*(self: CBPeripheral, services: NSArray[CBUUID], forService: CBService) {.objc: "discoverIncludedServices:forService:".}
proc services*(self: CBPeripheral): NSArray[CBService] {.objc: "services".}
proc discoverCharacteristics*(self: CBPeripheral, uuids:NSArray[CBUUID], forService: CBService) {.objc:"discoverCharacteristics:forService:".}
proc discoverDescriptorsForCharacteristic*(self: CBPeripheral, characteristic: CBCharacteristic) {.objc:"discoverDescriptorsForCharacteristic:".}
proc readValueForCharacteristic*(self: CBPeripheral, characteristic: CBCharacteristic) {.objc:"readValueForCharacteristic:".}
proc readValueForDescriptor*(self: CBPeripheral, descriptor: CBDescriptor) {.objc:"readValueForDescriptor:".}
proc writeValue*(self: CBPeripheral, data: NSData, characteristic: CBCharacteristic, kind: CBCharacteristicWriteType) {.objc:"writeValue:forCharacteristic:type:".}
proc writeValue*(self: CBPeripheral, data: NSData, descriptor: CBDescriptor) {.objc: "writeValue:forDescriptor:".}
proc maximumWriteValueLengthForType*(self: CBPeripheral, kind: CBCharacteristicWriteType):int {.objc: "maximumWriteValueLengthForType:".}
proc setNotifyValue*(self: CBPeripheral, characteristic: CBCharacteristic) {.objc: "setNotifyValue:forCharacteristic:".}
proc state*(self: CBPeripheral): CBPeripheralState {.objc: "state".}
proc canSendWriteWithoutResponse*(self: CBPeripheral): bool {.objc: "canSendWriteWithoutResponse".}

## CBService
proc peripheral*(self: CBService): CBPeripheral {.objc: "peripheral".}
proc isPrimary*(self: CBService): bool {.objc: "isPrimary".}
proc characteristics*(self: CBService): NSArray[CBCharacteristic] {.objc: "characteristics".}
proc includedServices*(self: CBService): NSArray[CBService] {.objc: "includedServices".}

## CBCharacteristic
proc service*(self: CBCharacteristic): CBService {.objc: "service".}
proc value*(self: CBCharacteristic): NSData {.objc: "value".}
proc properties*(self: CBCharacteristic): CBCharacteristicProperties {.objc:"properties".}
proc isNotifying*(self: CBCharacteristic): bool {.objc: "isNotifying".}
proc isBroadcasted*(self: CBCharacteristic): bool {.objc: "isBroadcasted".}

## CBDescriptor
proc characteristic*(self: CBDescriptor): CBCharacteristic {.objc: "characteristic".}
proc value*(self: CBDescriptor): NSObject {.objc: "value".}