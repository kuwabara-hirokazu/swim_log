import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swim_log/repository/LogDataDao.dart';

import '../data/log_data.dart';

class LogListViewModel {
  final LogDataDao _logDataDao = LogDataDao();

  StreamProvider getStreamProvider() {
    return StreamProvider<List<LogData>>((ref) => _logDataDao
        .getSnapshot()
        .map((event) => event.docs.map((data) => _convert(data.data())).whereNotNull().toList()));
  }

  LogData? _convert(Object? obj) {
    if (obj == null) return null;

    var map = obj as Map<String, dynamic>;
    return LogData.fromJson(map);
  }
}
