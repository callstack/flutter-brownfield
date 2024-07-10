import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

/// ReactView for Android using Hybrid Composition mechanism.
/// https://docs.flutter.dev/platform-integration/android/platform-views#hybrid-composition-1
class ReactViewAndroid extends StatelessWidget {
  /// The name of the React Native module to be rendered.
  ///
  /// It should match the key used in AppRegistry.registerComponent() in the React Native code
  /// on the JavaScript side.
  final String moduleName;

  const ReactViewAndroid({super.key, required this.moduleName});

  @override
  Widget build(BuildContext context) {
    const String viewType = 'react_view';
    Map<String, dynamic> creationParams = {"moduleName": moduleName};

    return PlatformViewLink(
      viewType: viewType,
      surfaceFactory: (context, controller) {
        return AndroidViewSurface(
          controller: controller as AndroidViewController,
          gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        );
      },
      onCreatePlatformView: (params) {
        return PlatformViewsService.initSurfaceAndroidView(
          id: params.id,
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
          onFocus: () {
            params.onFocusChanged(true);
          },
        )
          ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
          ..create();
      },
    );
  }
}
