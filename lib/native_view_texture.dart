import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeViewTexture extends StatelessWidget {
  const NativeViewTexture({super.key});

  @override
  Widget build(BuildContext context) {
    const String viewType = 'native_view';
    const Map<String, dynamic> creationParams = {'text': 'Texture Layer'};

    return const AndroidView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: StandardMessageCodec(),
    );
  }
}
