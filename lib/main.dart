import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swim_log/model/swim_log.dart';

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
    final swimLog = [
      SwimLog("1000", DateTime(2022, 8, 1)),
      SwimLog("1200", DateTime(2022, 8, 2)),
      SwimLog("1400", DateTime(2022, 8, 3)),
      SwimLog("1500", DateTime(2022, 8, 4)),
      SwimLog("1600", DateTime(2022, 8, 5)),
      SwimLog("1800", DateTime(2022, 8, 6)),
      SwimLog("1800", DateTime(2022, 8, 6)),
      SwimLog("1800", DateTime(2022, 8, 6)),
      SwimLog("1800", DateTime(2022, 8, 6)),
      SwimLog("1800", DateTime(2022, 8, 6)),
      SwimLog("1800", DateTime(2022, 8, 6)),
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _logItems(swimLog));
  }

  Widget _logItems(List<SwimLog> logs) {
    return ListView.builder(
      itemCount: logs.length,
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
                Text(DateFormat('yyyy/MM/dd').format(logs[index].date)),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      logs[index].totalDistance,
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
