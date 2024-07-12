import * as React from "react";
import { StyleSheet, Text, FlatList, Pressable } from "react-native";

const websites = [
  { name: "Callstack", url: "https://callstack.com/" },
  { name: "React Native", url: "https://reactnative.dev/" },
  { name: "Flutter", url: "https://flutter.dev/" },
];

export function ListScreen({ navigation }) {
  return (
    <FlatList
      style={styles.list}
      data={websites}
      automaticallyAdjustContentInsets
      renderItem={({ item }) => {
        return (
          <ListItem
            {...item}
            onPress={() => navigation.navigate("Details", item)}
          />
        );
      }}
    />
  );
}

function ListItem({ name, onPress }) {
  return (
    <Pressable style={styles.listItem} onPress={onPress}>
      <Text style={styles.title}>{name}</Text>
    </Pressable>
  );
}

const styles = StyleSheet.create({
  listItem: {
    padding: 16,
  },
  title: {
    fontSize: 20,
  },
});
