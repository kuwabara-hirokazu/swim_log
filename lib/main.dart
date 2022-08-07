import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Swim記録'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final list = [
      "1000",
      "1500",
      "2000",
      "1500",
      "2000",
      "1500",
      "2000",
      "1500",
      "2000",
      "1500",
      "2000",
      "1500",
      "2000",
      "1500",
      "2000",
      "1500",
      "2000",
      "1500",
      "2000",
      "1500",
      "2000"
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _logItems(list));
  }

  Widget _logItems(List<String> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("2022/08/01"),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      list[index],
                      style: const TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                    const SizedBox(width: 8),
                    const Text("m"),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
