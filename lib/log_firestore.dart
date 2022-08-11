import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swim_log/model/swim_log.dart';

class LogFireStore {
  static final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static final _logCollection = _firebaseFirestore.collection('log');

  static Future<List<SwimLog>> fetchLog() async {
    try {
      final snapShot = await _logCollection.get();
      return snapShot.docs.map((doc) => toSwimLog(doc.data())).toList();
    } catch (e) {
      return List.empty();
    }
  }

  static SwimLog toSwimLog(Map<String, dynamic> data) {
    final distance = data['distance'];
    final timestamp = data['date'];
    final date = (timestamp is Timestamp) ? timestamp.toDate() : DateTime.now();
    return SwimLog(distance, date);
  }
}
