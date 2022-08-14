import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swim_log/data/log_data.dart';

class LogDataDao {
  final CollectionReference _collection = FirebaseFirestore.instance.collection('log');

  void registerLog(LogData logData) {
    _collection.add(logData.toJson());
  }

  Stream<QuerySnapshot> getSnapshot() {
    return _collection.orderBy('createDate', descending: true).snapshots();
  }
}
