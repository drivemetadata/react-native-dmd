
import DriveMetaDataiOSSDK
@objc(Dmd)
class Dmd: NSObject {
  
  @objc(multiply:withB:withResolver:withRejecter:)
  func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
    //DriveMetaData.shared?.configure(clientId: 123456, clientToken: "toekn", clientAppId: 1967)
    resolve(500)
  }
  @objc(add:withB:withResolver:withRejecter:)
  func add(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
    resolve(a+b)
  }
 

}
