import 'package:flutter/material.dart';
import 'package:flutter_brownfield_app/react_view.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ListScreen(),
    );
  }
}

class ListItem {
  final String title;
  final String moduleName;

  ListItem({required this.title, required this.moduleName});
}

class ListScreen extends StatelessWidget {
  final List<ListItem> modules = [
    ListItem(title: '<Hello /> component', moduleName: 'Hello'),
    ListItem(title: '<Counter /> component', moduleName: 'Counter'),
    ListItem(
        title: '<ReactNativeIntro /> screen', moduleName: 'ReactNativeIntro'),
    ListItem(
        title: '<ReactNativeWebView /> component',
        moduleName: 'ReactNativeWebView'),
    ListItem(title: '<Reanimated /> example', moduleName: 'Reanimated'),
  ];

  ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter x React Native POC'),
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: modules.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(modules[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(item: modules[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final ListItem item;

  const DetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: ReactView(moduleName: item.moduleName),
            ),
          ],
        ),
      ),
    );
  }
}
