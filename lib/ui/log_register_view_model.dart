import 'package:logger/logger.dart';
import 'package:swim_log/data/result.dart';

import '../data/log_data.dart';
import '../repository/LogDataDao.dart';

class LogRegisterViewModel {
  final LogDataDao _logDataDao = LogDataDao();

  Result registerLog(LogData logData) {
    try {
      _logDataDao.registerLog(logData);
      return const Result.success(null);
    } catch (e) {
      Logger().e('registerError: $e');
      return const Result.failure('保存に失敗しました');
    }
  }
}
