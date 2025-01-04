#import <React/RCTBridgeModule.h>
//#import "DriveMetaDataiOSSDK/DMD.h"
@import DriveMetaDataiOSSDK;


@interface RCT_EXTERN_MODULE(Dmd, NSObject)


// sdk init
RCT_EXPORT_METHOD(sdkInit:(NSInteger)clientID
                  withToken:(NSString *)token
                  withAppId:(NSInteger)appId
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject) {
  // Validate parameters
  if (clientID <= 0 || appId <= 0 || token.length == 0) {
    reject(@"INVALID_PARAMETERS", @"Client ID, token, or app ID is invalid", nil);
    return;
  }

  // Initialize SDK
  @try {
    [DriveMetaData initializeSharedWithClientId:clientID clientToken:token clientAppId:appId];

    resolve(@"DMD SDK Init Successfully");
  } @catch (NSException *exception) {
    reject(@"SDK_INIT_FAILED", @"Failed to initialize SDK", [NSError errorWithDomain:@"DriveMetaDataError" code:500 userInfo:@{NSLocalizedDescriptionKey: exception.reason}]);
  }
}

// Modified method to include a return type
RCT_EXPORT_METHOD(enableIdfa:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
  @try {
    NSString *response = [[DriveMetaData shared] requestrequestIDFA]; // Ensure `enableIdfa` exists in SDK
    NSLog(@"enableIdfa   - %@", response);
    resolve(response);
  } @catch (NSException *exception) {
    NSLog(@"Failed to enable IDFA: %@", exception.reason);
    reject(@"IDFA_INIT_FAILED", @"Failed to Get IDFA ID", [NSError errorWithDomain:@"DriveMetaDataError" code:500 userInfo:@{NSLocalizedDescriptionKey: exception.reason}]);  }
}

// sends the data to dmd server

RCT_EXPORT_METHOD(sendTags:(NSDictionary *)data) {
  if (data) {
    
    NSString *response = [[DriveMetaData shared] sendTagsWithData:data];
    NSLog(@"Received -  %@",response );

  } else {
    NSLog(@"Data is null");
  }
}
// get background data with deeplink
RCT_EXPORT_METHOD(getBackgroundData:(NSString *)url
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
  // Early return if the URL is nil or invalid
  if (!url || [url isEqualToString:@""]) {
    reject(@"INVALID_URL", @"URL is nil or empty", nil);
    return;
  }

  NSURL *incomingURL = [NSURL URLWithString:url];
  if (!incomingURL) {
    reject(@"INVALID_URL_FORMAT", @"Invalid URL format", nil);
    return;
  }

  // Call the getBackgroundData method from DriveMetaData
  [DriveMetaData.shared getBackgroundDataWithUri:incomingURL callback:^(NSString *jsonString, NSError *error) {
    if (error) {
      // Reject the promise with the error
      reject(@"FETCH_ERROR", error.localizedDescription, error);
    } else if (jsonString) {
      // Resolve the promise with the received data
      resolve(jsonString);
    } else {
      // Handle case when jsonString is nil (e.g., no data returned)
      reject(@"NO_DATA", @"No data received", nil);
    }
  }];
}


RCT_EXPORT_METHOD(appDetails:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
  @try {
    NSString *response = [[DriveMetaData shared] appDetails];
    NSLog(@"appDetails title: %@", response);
    resolve(response); // Resolve the promise with the response
  }
  @catch (NSException *exception) {
    reject(@"app_details_error", @"Failed to fetch app details", nil); // Reject the promise on error
  }
}


RCT_EXPORT_METHOD(deviceDetails:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
  @try {
    NSString *response = [[DriveMetaData shared] deviceDetails];
    NSLog(@"deviceDetails title: %@", response);
    resolve(response); // Resolve the promise with the response
  }
  @catch (NSException *exception) {
    reject(@"app_details_error", @"Failed to fetch app details", nil); // Reject the promise on error
  }
}




+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
