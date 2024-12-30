import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-dmd' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const Dmd = NativeModules.Dmd
  ? NativeModules.Dmd
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );


export function enableIdfa():Promise<string>
{
    return Dmd.enableIdfa();
}
export function sdkInit(clientID: number, token: string, appId: number): Promise<string> {
  return Dmd.sdkInit(clientID, token, appId);
}
/**
 * Sends a dictionary object to the native module.
 * @param {Record<string, any>} data - A dictionary object to send.
 */
export function sendTags(data: Record<string, any>): void {
  if (!Dmd || typeof Dmd.sendTags !== 'function') {
    throw new Error('Native module "Dmd" or method "sendTags" is not available.');
  }

  Dmd.sendTags(data);
}

/**
 * Calls the native method getBackgroundData and returns a Promise.
 * @param {string} url - The URL to process.
 * @returns {Promise<string>} A promise that resolves to the processed result.
 */
export function getBackgroundData(url: string): void {
 
  Dmd.getBackgroundData(url);

  
}

export function appDetails():Promise<string>
{
   return Dmd.appDetails();
}
export function deviceDetails():Promise<string>
{
   return Dmd.deviceDetails();
}



