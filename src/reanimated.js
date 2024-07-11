import { Pressable, Text, View } from "react-native";
import Animated, { useSharedValue, withSpring } from "react-native-reanimated";

/**
 * Basic Reanimated example.
 * See: https://docs.swmansion.com/react-native-reanimated/docs/fundamentals/your-first-animation
 */
export function Reanimated() {
  const width = useSharedValue(100);

  const handlePress = () => {
    width.value = withSpring(width.value + 50);
  };

  return (
    <View style={{ flex: 1, alignItems: "center" }}>
      <Animated.View
        style={{
          width,
          height: 100,
          backgroundColor: "blue",
        }}
      />

      <Pressable onPress={handlePress} style={{ marginTop: 10 }}>
        <Text>Press me</Text>
      </Pressable>
    </View>
  );
}
