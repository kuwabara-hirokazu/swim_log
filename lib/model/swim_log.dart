import 'package:cloud_firestore/cloud_firestore.dart';

class SwimLog {
  int totalDistance;
  DateTime date;

  SwimLog(this.totalDistance, this.date);

  static SwimLog from(Map<String, dynamic> data) {
    final distance = data['distance'];
    final timestamp = data['date'];
    final date = (timestamp is Timestamp) ? timestamp.toDate() : DateTime.now();
    return SwimLog(distance, date);
  }
}
