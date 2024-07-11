import React from "react";
import { StyleSheet, Text, View } from "react-native";

/**
 * Basic Hello World component.
 */
export function Hello() {
  return (
    <View style={styles.container}>
      <Text style={styles.text}>Hello React Native!</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 10,
  },
  text: {
    fontSize: 20,
  },
});
