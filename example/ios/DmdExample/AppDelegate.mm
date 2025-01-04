#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>
#import <DriveMetaDataiOSSDK/DMD.h>

@import DriveMetaDataiOSSDK;
@implementation AppDelegate

typedef void(^DeepLinkCallback)(NSDictionary *response, NSError *error);


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.moduleName = @"DmdExample";
 

  // You can add your custom initial props in the dictionary below.
  // They will be passed down to the ViewController used by React Native.
  self.initialProps = @{};

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
  return [self bundleURL];
}


- (BOOL)application:(UIApplication *)application
            continueUserActivity:(NSUserActivity *)userActivity
            restorationHandler:(void (^)(NSArray *))restorationHandler {

    // Check if the activity type is a web browsing activity (Universal Link)
    if ([userActivity.activityType isEqualToString:NSUserActivityTypeBrowsingWeb]) {
        NSURL *incomingURL = userActivity.webpageURL;
        
        if (incomingURL) {
            // Log the incoming URL for debugging
            NSLog(@"Universal Link URL: %@", incomingURL);
          
//          [DriveMetaData.shared getBackgroundDataWithUri:incomingURL callback:^(NSString *jsonString, NSError *error) {
//              if (error) {
//                  // Handle error
//                  NSLog(@"Error: %@", error.localizedDescription);
//              } else if (jsonString) {
//                  // Handle success, use jsonString
//                  NSLog(@"Received data: %@", jsonString);
//              }
//          }];
          
          
          
          
//          UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert"
//                                                                         message:@"Messaging"
//                                                                             preferredStyle:UIAlertControllerStyleAlert];
//                     
//                     // Add an OK action button
//                     UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
//                                                                        style:UIAlertActionStyleDefault
//                                                                      handler:^(UIAlertAction * _Nonnull action) {
//                                                                          NSLog(@"OK tapped");
//                                                                      }];
//                     [alert addAction:okAction];
//                     
//                     // Present the alert from the root view controller
//                     UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
//                     UIViewController *rootViewController = window.rootViewController;
//                     [rootViewController presentViewController:alert animated:YES completion:nil];


        }
    }
    return YES;
}


- (NSURL *)bundleURL
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
