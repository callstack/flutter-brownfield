import { AppRegistry } from "react-native";

import { Counter } from "./src/counter";
import { Hello } from "./src/hello";
import { ReactNativeIntro } from "./src/react-native-intro";
import { ReactNavigationFlow } from "./src/react-navigation-flow";
import { ReactNativeWebView } from "./src/react-native-webview";
import { Reanimated } from "./src/reanimated";

AppRegistry.registerComponent("Hello", () => Hello);
AppRegistry.registerComponent("Counter", () => Counter);
AppRegistry.registerComponent("ReactNativeIntro", () => ReactNativeIntro);
AppRegistry.registerComponent("ReactNavigationFlow", () => ReactNavigationFlow);
AppRegistry.registerComponent("ReactNativeWebView", () => ReactNativeWebView);
AppRegistry.registerComponent("Reanimated", () => Reanimated);
