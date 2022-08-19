import 'package:logger/logger.dart';

import '../data/log_data.dart';
import '../repository/LogDataDao.dart';

class LogRegisterViewModel {
  final LogDataDao _logDataDao = LogDataDao();

  void registerLog(LogData logData) {
    try {
      _logDataDao.registerLog(logData);
    } catch (e) {
      Logger().e('registerError: $e');
    }
  }
}
