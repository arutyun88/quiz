// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mastery_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MasteryDto _$MasteryDtoFromJson(Map<String, dynamic> json) {
  return _MasteryDto.fromJson(json);
}

/// @nodoc
mixin _$MasteryDto {
  List<MasteryTopicDto> get topics => throw _privateConstructorUsedError;
  MasteryTopicDto? get weakest => throw _privateConstructorUsedError;
  @JsonKey(name: 'weekly_accuracy_delta')
  double? get weeklyAccuracyDelta => throw _privateConstructorUsedError;
  @JsonKey(name: 'best_day_of_week')
  int? get bestDayOfWeek => throw _privateConstructorUsedError;
  @JsonKey(name: 'daily_accuracy')
  List<MasteryDayDto> get dailyAccuracy => throw _privateConstructorUsedError;
  @JsonKey(name: 'best_day')
  MasteryBestDayDto? get bestDay => throw _privateConstructorUsedError;

  /// Serializes this MasteryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MasteryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MasteryDtoCopyWith<MasteryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasteryDtoCopyWith<$Res> {
  factory $MasteryDtoCopyWith(
          MasteryDto value, $Res Function(MasteryDto) then) =
      _$MasteryDtoCopyWithImpl<$Res, MasteryDto>;
  @useResult
  $Res call(
      {List<MasteryTopicDto> topics,
      MasteryTopicDto? weakest,
      @JsonKey(name: 'weekly_accuracy_delta') double? weeklyAccuracyDelta,
      @JsonKey(name: 'best_day_of_week') int? bestDayOfWeek,
      @JsonKey(name: 'daily_accuracy') List<MasteryDayDto> dailyAccuracy,
      @JsonKey(name: 'best_day') MasteryBestDayDto? bestDay});

  $MasteryTopicDtoCopyWith<$Res>? get weakest;
  $MasteryBestDayDtoCopyWith<$Res>? get bestDay;
}

/// @nodoc
class _$MasteryDtoCopyWithImpl<$Res, $Val extends MasteryDto>
    implements $MasteryDtoCopyWith<$Res> {
  _$MasteryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MasteryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topics = null,
    Object? weakest = freezed,
    Object? weeklyAccuracyDelta = freezed,
    Object? bestDayOfWeek = freezed,
    Object? dailyAccuracy = null,
    Object? bestDay = freezed,
  }) {
    return _then(_value.copyWith(
      topics: null == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<MasteryTopicDto>,
      weakest: freezed == weakest
          ? _value.weakest
          : weakest // ignore: cast_nullable_to_non_nullable
              as MasteryTopicDto?,
      weeklyAccuracyDelta: freezed == weeklyAccuracyDelta
          ? _value.weeklyAccuracyDelta
          : weeklyAccuracyDelta // ignore: cast_nullable_to_non_nullable
              as double?,
      bestDayOfWeek: freezed == bestDayOfWeek
          ? _value.bestDayOfWeek
          : bestDayOfWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      dailyAccuracy: null == dailyAccuracy
          ? _value.dailyAccuracy
          : dailyAccuracy // ignore: cast_nullable_to_non_nullable
              as List<MasteryDayDto>,
      bestDay: freezed == bestDay
          ? _value.bestDay
          : bestDay // ignore: cast_nullable_to_non_nullable
              as MasteryBestDayDto?,
    ) as $Val);
  }

  /// Create a copy of MasteryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasteryTopicDtoCopyWith<$Res>? get weakest {
    if (_value.weakest == null) {
      return null;
    }

    return $MasteryTopicDtoCopyWith<$Res>(_value.weakest!, (value) {
      return _then(_value.copyWith(weakest: value) as $Val);
    });
  }

  /// Create a copy of MasteryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasteryBestDayDtoCopyWith<$Res>? get bestDay {
    if (_value.bestDay == null) {
      return null;
    }

    return $MasteryBestDayDtoCopyWith<$Res>(_value.bestDay!, (value) {
      return _then(_value.copyWith(bestDay: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MasteryDtoImplCopyWith<$Res>
    implements $MasteryDtoCopyWith<$Res> {
  factory _$$MasteryDtoImplCopyWith(
          _$MasteryDtoImpl value, $Res Function(_$MasteryDtoImpl) then) =
      __$$MasteryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MasteryTopicDto> topics,
      MasteryTopicDto? weakest,
      @JsonKey(name: 'weekly_accuracy_delta') double? weeklyAccuracyDelta,
      @JsonKey(name: 'best_day_of_week') int? bestDayOfWeek,
      @JsonKey(name: 'daily_accuracy') List<MasteryDayDto> dailyAccuracy,
      @JsonKey(name: 'best_day') MasteryBestDayDto? bestDay});

  @override
  $MasteryTopicDtoCopyWith<$Res>? get weakest;
  @override
  $MasteryBestDayDtoCopyWith<$Res>? get bestDay;
}

/// @nodoc
class __$$MasteryDtoImplCopyWithImpl<$Res>
    extends _$MasteryDtoCopyWithImpl<$Res, _$MasteryDtoImpl>
    implements _$$MasteryDtoImplCopyWith<$Res> {
  __$$MasteryDtoImplCopyWithImpl(
      _$MasteryDtoImpl _value, $Res Function(_$MasteryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MasteryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topics = null,
    Object? weakest = freezed,
    Object? weeklyAccuracyDelta = freezed,
    Object? bestDayOfWeek = freezed,
    Object? dailyAccuracy = null,
    Object? bestDay = freezed,
  }) {
    return _then(_$MasteryDtoImpl(
      topics: null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<MasteryTopicDto>,
      weakest: freezed == weakest
          ? _value.weakest
          : weakest // ignore: cast_nullable_to_non_nullable
              as MasteryTopicDto?,
      weeklyAccuracyDelta: freezed == weeklyAccuracyDelta
          ? _value.weeklyAccuracyDelta
          : weeklyAccuracyDelta // ignore: cast_nullable_to_non_nullable
              as double?,
      bestDayOfWeek: freezed == bestDayOfWeek
          ? _value.bestDayOfWeek
          : bestDayOfWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      dailyAccuracy: null == dailyAccuracy
          ? _value._dailyAccuracy
          : dailyAccuracy // ignore: cast_nullable_to_non_nullable
              as List<MasteryDayDto>,
      bestDay: freezed == bestDay
          ? _value.bestDay
          : bestDay // ignore: cast_nullable_to_non_nullable
              as MasteryBestDayDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MasteryDtoImpl implements _MasteryDto {
  const _$MasteryDtoImpl(
      {required final List<MasteryTopicDto> topics,
      this.weakest,
      @JsonKey(name: 'weekly_accuracy_delta') this.weeklyAccuracyDelta,
      @JsonKey(name: 'best_day_of_week') this.bestDayOfWeek,
      @JsonKey(name: 'daily_accuracy')
      final List<MasteryDayDto> dailyAccuracy = const [],
      @JsonKey(name: 'best_day') this.bestDay})
      : _topics = topics,
        _dailyAccuracy = dailyAccuracy;

  factory _$MasteryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MasteryDtoImplFromJson(json);

  final List<MasteryTopicDto> _topics;
  @override
  List<MasteryTopicDto> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  @override
  final MasteryTopicDto? weakest;
  @override
  @JsonKey(name: 'weekly_accuracy_delta')
  final double? weeklyAccuracyDelta;
  @override
  @JsonKey(name: 'best_day_of_week')
  final int? bestDayOfWeek;
  final List<MasteryDayDto> _dailyAccuracy;
  @override
  @JsonKey(name: 'daily_accuracy')
  List<MasteryDayDto> get dailyAccuracy {
    if (_dailyAccuracy is EqualUnmodifiableListView) return _dailyAccuracy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyAccuracy);
  }

  @override
  @JsonKey(name: 'best_day')
  final MasteryBestDayDto? bestDay;

  @override
  String toString() {
    return 'MasteryDto(topics: $topics, weakest: $weakest, weeklyAccuracyDelta: $weeklyAccuracyDelta, bestDayOfWeek: $bestDayOfWeek, dailyAccuracy: $dailyAccuracy, bestDay: $bestDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasteryDtoImpl &&
            const DeepCollectionEquality().equals(other._topics, _topics) &&
            (identical(other.weakest, weakest) || other.weakest == weakest) &&
            (identical(other.weeklyAccuracyDelta, weeklyAccuracyDelta) ||
                other.weeklyAccuracyDelta == weeklyAccuracyDelta) &&
            (identical(other.bestDayOfWeek, bestDayOfWeek) ||
                other.bestDayOfWeek == bestDayOfWeek) &&
            const DeepCollectionEquality()
                .equals(other._dailyAccuracy, _dailyAccuracy) &&
            (identical(other.bestDay, bestDay) || other.bestDay == bestDay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_topics),
      weakest,
      weeklyAccuracyDelta,
      bestDayOfWeek,
      const DeepCollectionEquality().hash(_dailyAccuracy),
      bestDay);

  /// Create a copy of MasteryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MasteryDtoImplCopyWith<_$MasteryDtoImpl> get copyWith =>
      __$$MasteryDtoImplCopyWithImpl<_$MasteryDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MasteryDtoImplToJson(
      this,
    );
  }
}

abstract class _MasteryDto implements MasteryDto {
  const factory _MasteryDto(
      {required final List<MasteryTopicDto> topics,
      final MasteryTopicDto? weakest,
      @JsonKey(name: 'weekly_accuracy_delta') final double? weeklyAccuracyDelta,
      @JsonKey(name: 'best_day_of_week') final int? bestDayOfWeek,
      @JsonKey(name: 'daily_accuracy') final List<MasteryDayDto> dailyAccuracy,
      @JsonKey(name: 'best_day')
      final MasteryBestDayDto? bestDay}) = _$MasteryDtoImpl;

  factory _MasteryDto.fromJson(Map<String, dynamic> json) =
      _$MasteryDtoImpl.fromJson;

  @override
  List<MasteryTopicDto> get topics;
  @override
  MasteryTopicDto? get weakest;
  @override
  @JsonKey(name: 'weekly_accuracy_delta')
  double? get weeklyAccuracyDelta;
  @override
  @JsonKey(name: 'best_day_of_week')
  int? get bestDayOfWeek;
  @override
  @JsonKey(name: 'daily_accuracy')
  List<MasteryDayDto> get dailyAccuracy;
  @override
  @JsonKey(name: 'best_day')
  MasteryBestDayDto? get bestDay;

  /// Create a copy of MasteryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MasteryDtoImplCopyWith<_$MasteryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MasteryDayDto _$MasteryDayDtoFromJson(Map<String, dynamic> json) {
  return _MasteryDayDto.fromJson(json);
}

/// @nodoc
mixin _$MasteryDayDto {
  @JsonKey(name: 'day_of_week')
  int get dayOfWeek => throw _privateConstructorUsedError;
  double get accuracy => throw _privateConstructorUsedError;
  int get answers => throw _privateConstructorUsedError;

  /// Serializes this MasteryDayDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MasteryDayDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MasteryDayDtoCopyWith<MasteryDayDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasteryDayDtoCopyWith<$Res> {
  factory $MasteryDayDtoCopyWith(
          MasteryDayDto value, $Res Function(MasteryDayDto) then) =
      _$MasteryDayDtoCopyWithImpl<$Res, MasteryDayDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'day_of_week') int dayOfWeek,
      double accuracy,
      int answers});
}

/// @nodoc
class _$MasteryDayDtoCopyWithImpl<$Res, $Val extends MasteryDayDto>
    implements $MasteryDayDtoCopyWith<$Res> {
  _$MasteryDayDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MasteryDayDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeek = null,
    Object? accuracy = null,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MasteryDayDtoImplCopyWith<$Res>
    implements $MasteryDayDtoCopyWith<$Res> {
  factory _$$MasteryDayDtoImplCopyWith(
          _$MasteryDayDtoImpl value, $Res Function(_$MasteryDayDtoImpl) then) =
      __$$MasteryDayDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'day_of_week') int dayOfWeek,
      double accuracy,
      int answers});
}

/// @nodoc
class __$$MasteryDayDtoImplCopyWithImpl<$Res>
    extends _$MasteryDayDtoCopyWithImpl<$Res, _$MasteryDayDtoImpl>
    implements _$$MasteryDayDtoImplCopyWith<$Res> {
  __$$MasteryDayDtoImplCopyWithImpl(
      _$MasteryDayDtoImpl _value, $Res Function(_$MasteryDayDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MasteryDayDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeek = null,
    Object? accuracy = null,
    Object? answers = null,
  }) {
    return _then(_$MasteryDayDtoImpl(
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MasteryDayDtoImpl implements _MasteryDayDto {
  const _$MasteryDayDtoImpl(
      {@JsonKey(name: 'day_of_week') required this.dayOfWeek,
      required this.accuracy,
      required this.answers});

  factory _$MasteryDayDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MasteryDayDtoImplFromJson(json);

  @override
  @JsonKey(name: 'day_of_week')
  final int dayOfWeek;
  @override
  final double accuracy;
  @override
  final int answers;

  @override
  String toString() {
    return 'MasteryDayDto(dayOfWeek: $dayOfWeek, accuracy: $accuracy, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasteryDayDtoImpl &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.answers, answers) || other.answers == answers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dayOfWeek, accuracy, answers);

  /// Create a copy of MasteryDayDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MasteryDayDtoImplCopyWith<_$MasteryDayDtoImpl> get copyWith =>
      __$$MasteryDayDtoImplCopyWithImpl<_$MasteryDayDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MasteryDayDtoImplToJson(
      this,
    );
  }
}

abstract class _MasteryDayDto implements MasteryDayDto {
  const factory _MasteryDayDto(
      {@JsonKey(name: 'day_of_week') required final int dayOfWeek,
      required final double accuracy,
      required final int answers}) = _$MasteryDayDtoImpl;

  factory _MasteryDayDto.fromJson(Map<String, dynamic> json) =
      _$MasteryDayDtoImpl.fromJson;

  @override
  @JsonKey(name: 'day_of_week')
  int get dayOfWeek;
  @override
  double get accuracy;
  @override
  int get answers;

  /// Create a copy of MasteryDayDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MasteryDayDtoImplCopyWith<_$MasteryDayDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MasteryBestDayDto _$MasteryBestDayDtoFromJson(Map<String, dynamic> json) {
  return _MasteryBestDayDto.fromJson(json);
}

/// @nodoc
mixin _$MasteryBestDayDto {
  DateTime get date => throw _privateConstructorUsedError;
  double get accuracy => throw _privateConstructorUsedError;
  int get answers => throw _privateConstructorUsedError;

  /// Serializes this MasteryBestDayDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MasteryBestDayDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MasteryBestDayDtoCopyWith<MasteryBestDayDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasteryBestDayDtoCopyWith<$Res> {
  factory $MasteryBestDayDtoCopyWith(
          MasteryBestDayDto value, $Res Function(MasteryBestDayDto) then) =
      _$MasteryBestDayDtoCopyWithImpl<$Res, MasteryBestDayDto>;
  @useResult
  $Res call({DateTime date, double accuracy, int answers});
}

/// @nodoc
class _$MasteryBestDayDtoCopyWithImpl<$Res, $Val extends MasteryBestDayDto>
    implements $MasteryBestDayDtoCopyWith<$Res> {
  _$MasteryBestDayDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MasteryBestDayDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? accuracy = null,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MasteryBestDayDtoImplCopyWith<$Res>
    implements $MasteryBestDayDtoCopyWith<$Res> {
  factory _$$MasteryBestDayDtoImplCopyWith(_$MasteryBestDayDtoImpl value,
          $Res Function(_$MasteryBestDayDtoImpl) then) =
      __$$MasteryBestDayDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double accuracy, int answers});
}

/// @nodoc
class __$$MasteryBestDayDtoImplCopyWithImpl<$Res>
    extends _$MasteryBestDayDtoCopyWithImpl<$Res, _$MasteryBestDayDtoImpl>
    implements _$$MasteryBestDayDtoImplCopyWith<$Res> {
  __$$MasteryBestDayDtoImplCopyWithImpl(_$MasteryBestDayDtoImpl _value,
      $Res Function(_$MasteryBestDayDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MasteryBestDayDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? accuracy = null,
    Object? answers = null,
  }) {
    return _then(_$MasteryBestDayDtoImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MasteryBestDayDtoImpl implements _MasteryBestDayDto {
  const _$MasteryBestDayDtoImpl(
      {required this.date, required this.accuracy, required this.answers});

  factory _$MasteryBestDayDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MasteryBestDayDtoImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double accuracy;
  @override
  final int answers;

  @override
  String toString() {
    return 'MasteryBestDayDto(date: $date, accuracy: $accuracy, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasteryBestDayDtoImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.answers, answers) || other.answers == answers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, accuracy, answers);

  /// Create a copy of MasteryBestDayDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MasteryBestDayDtoImplCopyWith<_$MasteryBestDayDtoImpl> get copyWith =>
      __$$MasteryBestDayDtoImplCopyWithImpl<_$MasteryBestDayDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MasteryBestDayDtoImplToJson(
      this,
    );
  }
}

abstract class _MasteryBestDayDto implements MasteryBestDayDto {
  const factory _MasteryBestDayDto(
      {required final DateTime date,
      required final double accuracy,
      required final int answers}) = _$MasteryBestDayDtoImpl;

  factory _MasteryBestDayDto.fromJson(Map<String, dynamic> json) =
      _$MasteryBestDayDtoImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get accuracy;
  @override
  int get answers;

  /// Create a copy of MasteryBestDayDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MasteryBestDayDtoImplCopyWith<_$MasteryBestDayDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MasteryTopicDto _$MasteryTopicDtoFromJson(Map<String, dynamic> json) {
  return _MasteryTopicDto.fromJson(json);
}

/// @nodoc
mixin _$MasteryTopicDto {
  String get name => throw _privateConstructorUsedError;
  double get accuracy => throw _privateConstructorUsedError;
  int get answers => throw _privateConstructorUsedError;

  /// Serializes this MasteryTopicDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MasteryTopicDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MasteryTopicDtoCopyWith<MasteryTopicDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasteryTopicDtoCopyWith<$Res> {
  factory $MasteryTopicDtoCopyWith(
          MasteryTopicDto value, $Res Function(MasteryTopicDto) then) =
      _$MasteryTopicDtoCopyWithImpl<$Res, MasteryTopicDto>;
  @useResult
  $Res call({String name, double accuracy, int answers});
}

/// @nodoc
class _$MasteryTopicDtoCopyWithImpl<$Res, $Val extends MasteryTopicDto>
    implements $MasteryTopicDtoCopyWith<$Res> {
  _$MasteryTopicDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MasteryTopicDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? accuracy = null,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MasteryTopicDtoImplCopyWith<$Res>
    implements $MasteryTopicDtoCopyWith<$Res> {
  factory _$$MasteryTopicDtoImplCopyWith(_$MasteryTopicDtoImpl value,
          $Res Function(_$MasteryTopicDtoImpl) then) =
      __$$MasteryTopicDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double accuracy, int answers});
}

/// @nodoc
class __$$MasteryTopicDtoImplCopyWithImpl<$Res>
    extends _$MasteryTopicDtoCopyWithImpl<$Res, _$MasteryTopicDtoImpl>
    implements _$$MasteryTopicDtoImplCopyWith<$Res> {
  __$$MasteryTopicDtoImplCopyWithImpl(
      _$MasteryTopicDtoImpl _value, $Res Function(_$MasteryTopicDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MasteryTopicDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? accuracy = null,
    Object? answers = null,
  }) {
    return _then(_$MasteryTopicDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MasteryTopicDtoImpl implements _MasteryTopicDto {
  const _$MasteryTopicDtoImpl(
      {required this.name, required this.accuracy, required this.answers});

  factory _$MasteryTopicDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MasteryTopicDtoImplFromJson(json);

  @override
  final String name;
  @override
  final double accuracy;
  @override
  final int answers;

  @override
  String toString() {
    return 'MasteryTopicDto(name: $name, accuracy: $accuracy, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasteryTopicDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.answers, answers) || other.answers == answers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, accuracy, answers);

  /// Create a copy of MasteryTopicDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MasteryTopicDtoImplCopyWith<_$MasteryTopicDtoImpl> get copyWith =>
      __$$MasteryTopicDtoImplCopyWithImpl<_$MasteryTopicDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MasteryTopicDtoImplToJson(
      this,
    );
  }
}

abstract class _MasteryTopicDto implements MasteryTopicDto {
  const factory _MasteryTopicDto(
      {required final String name,
      required final double accuracy,
      required final int answers}) = _$MasteryTopicDtoImpl;

  factory _MasteryTopicDto.fromJson(Map<String, dynamic> json) =
      _$MasteryTopicDtoImpl.fromJson;

  @override
  String get name;
  @override
  double get accuracy;
  @override
  int get answers;

  /// Create a copy of MasteryTopicDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MasteryTopicDtoImplCopyWith<_$MasteryTopicDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
