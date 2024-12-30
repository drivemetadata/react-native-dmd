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



//handle deeplink
RCT_EXPORT_METHOD(getBackgroundData:(NSString *)url)
{
  if (url == nil) {
    return;
  }

  @try {
    // Example: Process or fetch data
    NSLog(@"enableIdfa title: %@", url);

    // Resolve the promise with the result
  } @catch (NSException *exception) {
    // Handle errors and reject the promise
    NSLog(@"Received Data: %@, URL: %@", url);

  }
}//E695AE7D-C962-4EB2-9572-665C35422976
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
