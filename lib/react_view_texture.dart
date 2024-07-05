import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReactViewTexture extends StatelessWidget {
  final String moduleName;

  const ReactViewTexture({super.key, required this.moduleName});

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
