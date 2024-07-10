import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// ReactView for Android using Hybrid Composition Texture Layer mechanism.
/// https://docs.flutter.dev/platform-integration/android/platform-views#texturelayerhybridcompisition
class ReactViewAndroidTextureLayer extends StatelessWidget {
  final String moduleName;

  const ReactViewAndroidTextureLayer({super.key, required this.moduleName});

  @override
  Widget build(BuildContext context) {
    const String viewType = 'react_view';
    Map<String, dynamic> creationParams = {"moduleName": moduleName};

    return AndroidView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
