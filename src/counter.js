import React from "react";
import { StyleSheet, Pressable, Text, View } from "react-native";

export function Counter() {
  const [count, setCount] = React.useState(0);

  return (
    <View style={styles.container}>
      <Text style={styles.text}>Count: {count}</Text>
      <Pressable style={styles.button} onPress={() => setCount((c) => c + 1)}>
        <Text style={styles.buttonText}>Increase</Text>
      </Pressable>
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
  button: {
    alignSelf: "center",
    backgroundColor: "grey",
    padding: 10,
    borderColor: "black",
    borderWidth: 1,
  },
  buttonText: {
    fontSize: 18,
  },
});
