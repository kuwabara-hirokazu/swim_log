import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:swim_log/log_register.dart';

import 'data/log_data.dart';
import 'firebase_options.dart';
import 'logs_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
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
  final LogsViewModel _viewModel = LogsViewModel();
  late StreamProvider _streamProvider;

  @override
  void initState() {
    super.initState();
    _streamProvider = _viewModel.getStreamProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogRegister()),
                );
              },
            )
          ],
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final provider = ref.watch(_streamProvider);
            return provider.when(
                data: (data) => _logItems(data),
                error: (error, stackTrace) => Text('履歴取得に失敗: $error'),
                loading: () => const CircularProgressIndicator());
          },
        ));
  }

  Widget _logItems(List<LogData> logs) {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(DateFormat('yyyy/MM/dd').format(logs[index].createDate)),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.pool,
                          size: 24,
                        ),
                        Text(
                          logs[index].totalDistance.toString(),
                          style: const TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                        const SizedBox(width: 8),
                        const Text('m'),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.more_vert,
                  size: 24,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
