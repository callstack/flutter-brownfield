import * as React from "react";
import { StyleSheet, Text, Pressable, Linking } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";

export function DetailsScreen({ route }) {
  const { name, url } = route.params;

  const handlePress = () => {
    Linking.openURL(url);
  };

  return (
    <SafeAreaView style={styles.screen}>
      <Text style={styles.label}>Website: {name}</Text>
      <Text style={styles.label}>URL: {url}</Text>

      <Pressable style={styles.button} onPress={handlePress}>
        <Text style={styles.buttonText}>Open in browser</Text>
      </Pressable>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  screen: {
    padding: 10,
  },
  label: {
    marginVertical: 10,
    fontSize: 20,
  },
  button: {
    paddingVertical: 16,
  },
  buttonText: {
    fontSize: 20,
    color: "blue",
  },
});
