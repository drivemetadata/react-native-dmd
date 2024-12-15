
import DriveMetaDataiOSSDK
@objc(Dmd)
class Dmd: NSObject {
  
  @objc(multiply:withB:withResolver:withRejecter:)
  func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
    resolve(a*b)
  }
  @objc(add:withB:withResolver:withRejecter:)
  func add(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
    resolve(a+b)
  }
 

}
