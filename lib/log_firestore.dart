import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:swim_log/model/swim_log.dart';

class LogFireStore {
  static final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static final _logCollection = _firebaseFirestore.collection('log');

  static Future<List<SwimLog>> fetchLog() async {
    try {
      final snapShot = await _logCollection.get();
      return snapShot.docs.map((doc) => SwimLog.from(doc.data())).toList();
    } catch (e) {
      Logger().e('fetchError: $e');
      return List.empty();
    }
  }
}
