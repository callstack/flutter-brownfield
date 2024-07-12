# Flutter app with React Native brownfield POC

<img src="https://raw.githubusercontent.com/callstack/flutter-brownfield/main/docs/images/flutter-react-love.png" />

This is a proof-of-concept for adding React Native to an existing Flutter app.

This app is a basic Flutter app with added React Native brownfield integration. It works by leveraging both platforms' abilities to host native platform views, which serve as the briding layer. 

## Scope

* Basic React Native brownfield setup
* Added some popular React Native libraries: React Navigation, Reanimated, React Native WebView.
* Working hot reload for both React Native and Flutter

## Screenshots

|                                                           iOS                                                            |                                                           Android                                                            |
| :----------------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------------------: |
| <img src="https://raw.githubusercontent.com/callstack/flutter-brownfield/main/docs/images/flutter-brownfield-ios.png" /> | <img src="https://raw.githubusercontent.com/callstack/flutter-brownfield/main/docs/images/flutter-brownfield-android.png" /> |

## References

- [Flutter docs: Host a native iOS view](https://docs.flutter.dev/platform-integration/ios/platform-views)
- [Flutter docs: Host a native Android view](https://docs.flutter.dev/platform-integration/android/platform-views)
- [React Native docs: Integration with Existing Apps](https://reactnative.dev/docs/integration-with-existing-apps)
- [React Native docs: Integration with Android Fragment](https://reactnative.dev/docs/integration-with-android-fragment)

## To Do

- [ ] Support for React Native new architecture
- [ ] Improve Flutter to React Native navigation to be more seamless
- [ ] Add TypeScript support
- [ ] Improved type safety and error handling on both Flutter and React Native side