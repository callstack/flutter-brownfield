import { AppRegistry } from "react-native";

import { Counter } from "./src/counter";
import { Hello } from "./src/hello";
import { ReactNativeIntro } from "./src/react-native-intro";

AppRegistry.registerComponent("Hello", () => Hello);
AppRegistry.registerComponent("Counter", () => Counter);
AppRegistry.registerComponent("ReactNativeIntro", () => ReactNativeIntro);
