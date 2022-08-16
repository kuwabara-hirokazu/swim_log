// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'log_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LogData _$LogDataFromJson(Map<String, dynamic> json) {
  return _LogData.fromJson(json);
}

/// @nodoc
mixin _$LogData {
  int get totalDistance => throw _privateConstructorUsedError;
  DateTime get createDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogDataCopyWith<LogData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogDataCopyWith<$Res> {
  factory $LogDataCopyWith(LogData value, $Res Function(LogData) then) =
      _$LogDataCopyWithImpl<$Res>;
  $Res call({int totalDistance, DateTime createDate});
}

/// @nodoc
class _$LogDataCopyWithImpl<$Res> implements $LogDataCopyWith<$Res> {
  _$LogDataCopyWithImpl(this._value, this._then);

  final LogData _value;
  // ignore: unused_field
  final $Res Function(LogData) _then;

  @override
  $Res call({
    Object? totalDistance = freezed,
    Object? createDate = freezed,
  }) {
    return _then(_value.copyWith(
      totalDistance: totalDistance == freezed
          ? _value.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as int,
      createDate: createDate == freezed
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_LogDataCopyWith<$Res> implements $LogDataCopyWith<$Res> {
  factory _$$_LogDataCopyWith(
          _$_LogData value, $Res Function(_$_LogData) then) =
      __$$_LogDataCopyWithImpl<$Res>;
  @override
  $Res call({int totalDistance, DateTime createDate});
}

/// @nodoc
class __$$_LogDataCopyWithImpl<$Res> extends _$LogDataCopyWithImpl<$Res>
    implements _$$_LogDataCopyWith<$Res> {
  __$$_LogDataCopyWithImpl(_$_LogData _value, $Res Function(_$_LogData) _then)
      : super(_value, (v) => _then(v as _$_LogData));

  @override
  _$_LogData get _value => super._value as _$_LogData;

  @override
  $Res call({
    Object? totalDistance = freezed,
    Object? createDate = freezed,
  }) {
    return _then(_$_LogData(
      totalDistance: totalDistance == freezed
          ? _value.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as int,
      createDate: createDate == freezed
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LogData implements _LogData {
  const _$_LogData({required this.totalDistance, required this.createDate});

  factory _$_LogData.fromJson(Map<String, dynamic> json) =>
      _$$_LogDataFromJson(json);

  @override
  final int totalDistance;
  @override
  final DateTime createDate;

  @override
  String toString() {
    return 'LogData(totalDistance: $totalDistance, createDate: $createDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LogData &&
            const DeepCollectionEquality()
                .equals(other.totalDistance, totalDistance) &&
            const DeepCollectionEquality()
                .equals(other.createDate, createDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(totalDistance),
      const DeepCollectionEquality().hash(createDate));

  @JsonKey(ignore: true)
  @override
  _$$_LogDataCopyWith<_$_LogData> get copyWith =>
      __$$_LogDataCopyWithImpl<_$_LogData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LogDataToJson(
      this,
    );
  }
}

abstract class _LogData implements LogData {
  const factory _LogData(
      {required final int totalDistance,
      required final DateTime createDate}) = _$_LogData;

  factory _LogData.fromJson(Map<String, dynamic> json) = _$_LogData.fromJson;

  @override
  int get totalDistance;
  @override
  DateTime get createDate;
  @override
  @JsonKey(ignore: true)
  _$$_LogDataCopyWith<_$_LogData> get copyWith =>
      throw _privateConstructorUsedError;
}
