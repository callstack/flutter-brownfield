import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeViewIos extends StatelessWidget {
  const NativeViewIos({super.key});

  @override
  Widget build(BuildContext context) {
    // This is used in the platform side to register the view.
    const String viewType = 'native_view_ios';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};

    return UiKitView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
