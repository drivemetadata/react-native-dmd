import React, {  useEffect } from 'react';
import { Text, View, StyleSheet, Button, Alert } from 'react-native';
import { sendTags, sdkInit,getBackgroundData, enableIdfa } from 'react-native-dmd';

export default function App() {

  // Trigger multiplication and addition on mount
  useEffect(() => {
    sdkInit(1635, '4d17d90c78154c9a5569c073b67d8a5a22b2fabfc5c9415b6e7f709d68762054', 2659)
    .then((result) => {
      console.log(result); // Expected: "SDK Init Successfully"
    })
    .catch((error) => {
     console.error(error); // Handle initialization errors
   });
 
  }, []);

  // Event handler for the button
  const handleButtonClick = () => {
      //  enableIdfa("Success");

    
   // getBackgroundData("https://example.com");
    





    
    // Show alert and initialize SDK
    //enableIdfa("Success");
    //sdkInit(1234, "Amitkumargupta", 4567);
     
  const data = {
    firstName: "Amit",
    lastName: "Gupta",
    mobile:"7905717240",
    eventType: "userLogin",
  };
  
  sendTags(data);


    // Optional: Provide feedback in the UI
   // Alert.alert("SDK Initialized", "SDK and Alert function called!");
  };

  return (
    <View style={styles.container}>
      <Text>DriveMetaData React-Native SDK</Text>

      {/* Add a button to trigger the alert and SDK initialization */}
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

