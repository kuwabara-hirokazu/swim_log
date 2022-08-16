// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LogData _$$_LogDataFromJson(Map<String, dynamic> json) => _$_LogData(
      totalDistance: json['totalDistance'] as int,
      createDate: DateTime.parse(json['createDate'] as String),
    );

Map<String, dynamic> _$$_LogDataToJson(_$_LogData instance) =>
    <String, dynamic>{
      'totalDistance': instance.totalDistance,
      'createDate': instance.createDate.toIso8601String(),
    };
