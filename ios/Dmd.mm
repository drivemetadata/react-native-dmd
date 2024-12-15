#import <React/RCTBridgeModule.h>

//@import DriveMetaDataiOSSDK;


@interface RCT_EXTERN_MODULE(Dmd, NSObject)




RCT_EXTERN_METHOD(multiply:(float)a withB:(float)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(add:(float)a withB:(float)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)


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
   // [[DriveMetaData shared] configureWithClientId:clientID
                                      // clientToken:token
                                        // clientAppId:appId];
    resolve(@"SDK Init Successfully");
  } @catch (NSException *exception) {
    reject(@"SDK_INIT_FAILED", @"Failed to initialize SDK", [NSError errorWithDomain:@"DriveMetaDataError" code:500 userInfo:@{NSLocalizedDescriptionKey: exception.reason}]);
  }
}

// Expose the method to JavaScript
RCT_EXPORT_METHOD(enableIdfa:(NSString *)title) {
    NSLog(@"enableIdfa title: %@", title);
}

// sends the data to dmd server

RCT_EXPORT_METHOD(sendTags:(NSDictionary *)data) {
  if (data) {
    NSString *firstName = data[@"firstName"];
    NSString *lastName = data[@"lastName"];
    NSString *eventType = data[@"eventType"];

    NSLog(@"Received Data - First Name: %@, Last Name: %@, Event Type: %@", firstName, lastName, eventType);

    // Process the data as needed
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
}








+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
