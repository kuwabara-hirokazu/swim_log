import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_data.freezed.dart';
part 'log_data.g.dart';

@freezed
class LogData with _$LogData {
  const factory LogData({
    required int totalDistance,
    required DateTime createDate,
  }) = _LogData;

  factory LogData.fromJson(Map<String, dynamic> json) => _$LogDataFromJson(json);
}
