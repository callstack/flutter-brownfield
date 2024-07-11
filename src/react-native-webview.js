import * as React from "react";
import { StyleSheet } from "react-native";
import { WebView } from "react-native-webview";

const URL = "https://www.reactnative.dev/";

export function ReactNativeWebView() {
  return <WebView source={{ uri: URL }} style={styles.webView} />;
}

const styles = StyleSheet.create({
  webView: {
    flex: 1,
  },
});
