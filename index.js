import { AppRegistry } from "react-native";

import { Counter } from "./src/counter";
import { Hello } from "./src/hello";
import { ReactNativeScreen } from "./src/react-native-screen";

AppRegistry.registerComponent("Hello", () => Hello);
AppRegistry.registerComponent("Counter", () => Counter);
AppRegistry.registerComponent("ReactNativeScreen", () => ReactNativeScreen);
