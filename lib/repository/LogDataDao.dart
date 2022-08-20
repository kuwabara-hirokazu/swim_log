import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swim_log/data/log_data.dart';

class LogDataDao {
  final CollectionReference _collection = FirebaseFirestore.instance.collection('log');

  Future<void> registerLog(LogData logData) async {
    await _collection.add(logData.toJson());
  }

  Stream<QuerySnapshot> getSnapshot() {
    return _collection.orderBy('createDate', descending: true).snapshots();
  }
}
