import 'package:flutter/material.dart';
import 'package:flutter_brownfield_app/react_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('React Native <Hello /> component'),
            Flexible(
              flex: 1,
              child: ReactView(moduleName: "Hello"),
            ),
            Text('React Native <Counter> component'),
            Flexible(
              flex: 2,
              child: ReactView(moduleName: "Counter"),
            ),
            Text('React Native <Intro> screen'),
            Flexible(
              flex: 8,
              child: ReactView(moduleName: "ReactNativeIntro"),
            ),
          ],
        ),
      ),
    );
  }
}
