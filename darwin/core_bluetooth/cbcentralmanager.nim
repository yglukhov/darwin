import ./cbbase
import ../objc/[runtime]
import ../foundation/[nsdictionary, nsstring, nsarray]
import ./cbperipheral

type
  CBCentralManager* = ptr object of CBManager
  CBCentralManagerFeature* {.size: sizeof(uint).} = enum
    CBCentralManagerFeatureExtendedScanAndConnect = 1 # 1LU << 0
  CBConnectionEvent* {.size: sizeof(uint).} = enum
    CBConnectionEventPeerDisconnected = 0,
    CBConnectionEventPeerConnected = 1,

proc initWithDelegateInternal(self: CBCentralManager, delegate: NSObject, queue: NSObject):CBCentralManager {.objc: "initWithDelegate:queue:".}  #CBCentralManagerDelegate
proc initWithDelegate*(self: CBCentralManager, delegate: NSObject):CBCentralManager = initWithDelegateInternal(self, delegate, nil)
proc connectPeripheral*(self: CBCentralManager, options: NSDictionary[NSString, NSObject]) {.objc: "connectPeripheral:options:".}
proc cancelPeripheralConnection*(self: CBCentralManager, peripheral: CBPeripheral) {.objc: "cancelPeripheralConnection".}
proc retrieveConnectedPeripheralsWithServices*(self: CBCentralManager, services: NSArray[CBUUID]): NSArray[CBPeripheral] {.objc: "retrieveConnectedPeripheralsWithServices:".}
proc retrievePeripheralsWithIdentifiers*(self: CBCentralManager, identifiers: NSArray[CBUUID]): NSArray[CBPeripheral] {.objc: "retrievePeripheralsWithIdentifiers:".}
proc scanForPeripheralsWithServices*(self: CBCentralManager, services: NSArray[CBUUID], options: NSDictionary[NSString, NSObject]) {.objc: "scanForPeripheralsWithServices:options:".}
proc stopScan*(self: CBCentralManager) {.objc: "stopScan".}
proc isScanning*(self: CBCentralManager): bool {.objc: "isScanning".}
proc supportsFeatures*(self: typedesc[CBCentralManager], features: CBCentralManagerFeature): bool {.objc: "supportsFeatures:".}
proc delegate*(self: CBCentralManager): NSObject {.objc:"deleage".}
proc registerForConnectionEventsWithOptions*(self: CBCentralManager, options: NSDictionary[NSString, NSObject]) {.objc: "registerForConnectionEventsWithOptions".}
