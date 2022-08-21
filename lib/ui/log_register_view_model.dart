import 'package:logger/logger.dart';
import 'package:swim_log/data/result.dart';

import '../data/log_data.dart';
import '../repository/LogDataDao.dart';

class LogRegisterViewModel {
  final LogDataDao _logDataDao = LogDataDao();

  DateTime date = DateTime.now();
  String distance = '';

  Future<Result> registerLog() async {
    try {
      LogData logData = LogData(totalDistance: int.parse(distance), createDate: date);
      if (logData.totalDistance < 1) return const Result.failure('1m以上の距離を入力してください');

      await _logDataDao.registerLog(logData);
      return const Result.success(null);
    } on FormatException catch (e) {
      return const Result.failure('1m以上の距離を入力してください');
    } catch (e) {
      Logger().e('registerError: $e');
      return const Result.failure('保存に失敗しました');
    }
  }
}
