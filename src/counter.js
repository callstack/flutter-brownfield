import React from "react";
import { StyleSheet, Pressable, Text, View } from "react-native";

export function Counter() {
  const [count, setCount] = React.useState(0);

  return (
    <View style={styles.container}>
      <Text style={styles.text}>Count: {count}</Text>
      <View style={styles.buttonContainer}>
        <Pressable style={styles.button} onPress={() => setCount((c) => c + 1)}>
          <Text style={styles.buttonText}>+</Text>
        </Pressable>
        <Pressable style={styles.button} onPress={() => setCount((c) => c - 1)}>
          <Text style={styles.buttonText}>−</Text>
        </Pressable>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 10,
  },
  text: {
    fontSize: 20,
    textAlign: "center",
  },
  buttonContainer: {
    flexDirection: "row",
    justifyContent: "center",
    marginVertical: 10,
  },
  button: {
    alignSelf: "center",
    backgroundColor: "grey",
    padding: 10,
    borderColor: "black",
    borderWidth: 1,
    marginHorizontal: 10,
  },
  buttonText: {
    fontSize: 18,
  },
});
