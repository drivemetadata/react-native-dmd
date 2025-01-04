import React, { useEffect } from 'react';
import { Text, View, StyleSheet, Button, Alert } from 'react-native';
import Dmd from 'react-native-dmd';

export default function App() {
  // Trigger SDK initialization on mount
  useEffect(() => {
    Dmd.sdkInit(1635, '4d17d90c78154c9a5569c073b67d8a5a22b2fabfc5c9415b6e7f709d68762054', 2659)
      .then((result) => {
        console.log(result); // Expected: "SDK Init Successfully"
      })
      .catch((error) => {
        console.error('SDK Init Error:', error);
      });
  }, []);

  // Event handler for the button
  const handleButtonClick = () => {
    // Call enableIdfa
    // Dmd.enableIdfa()
    //   .then((result) => {
    //     console.log(result); // Expected: "IDFA Generate Successfully"
    //     Alert.alert('IDFA Success', result);
    //   })
    //   .catch((error) => {
    //     console.error('IDFA Error:', error);
    //     Alert.alert('IDFA Error', error.message || 'An error occurred');
    //   });

    // Example of sending tags
    const data = {
      firstName: 'Amit',
      lastName: 'Gupta',
      mobile: '7905717240',
      eventType: 'userLogin',
    };

    Dmd.getBackgroundData('https://deep.drivemetadata.com/mnopq')
     .then((details) => {
     console.log('Deeplink Details:', details);
    // Alert.alert('App Details', details);
   })
   .catch((error) => {
     console.error('Error fetching app details:', error);
    // Alert.alert('Error', error.message || 'Failed to fetch app details');
   }); 
    
   
   
   
   //   Dmd.appDetails()
  // .then((details) => {
  //   console.log('App Details:', details);
  //  // Alert.alert('App Details', details);
  // })
  // .catch((error) => {
  //   console.error('Error fetching app details:', error);
  //  // Alert.alert('Error', error.message || 'Failed to fetch app details');
  // });

 
 
 
  // Dmd.deviceDetails()
  // .then((details) => {
  //   console.log('App Details:', details);
  //   Alert.alert('App Details', details);
  // })
  // .catch((error) => {
  //   console.error('Error fetching app details:', error);
  //   Alert.alert('Error', error.message || 'Failed to fetch app details');
  // });

   // Dmd.sendTags(data);
  };

  return (
    <View style={styles.container}>
      <Text>DriveMetaData React-Native SDK</Text>
      <Button title="Click Me" onPress={handleButtonClick} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
