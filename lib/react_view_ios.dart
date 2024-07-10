import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// ReactView for iOS using Hybrid Composition mechanism.
/// https://docs.flutter.dev/platform-integration/ios/platform-views
class ReactViewIos extends StatelessWidget {
  /// The name of the React Native module to be rendered.
  ///
  /// It should match the key used in AppRegistry.registerComponent() in the React Native code
  /// on the JavaScript side.
  final String moduleName;

  const ReactViewIos({super.key, required this.moduleName});

  @override
  Widget build(BuildContext context) {
    const String viewType = 'react_view';
    Map<String, dynamic> creationParams = {"moduleName": moduleName};

    return UiKitView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
