// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mastery_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MasteryEntity {
  List<MasteryTopicEntity> get topics => throw _privateConstructorUsedError;
  MasteryTopicEntity? get weakest => throw _privateConstructorUsedError;

  /// Accuracy of the last 7 days minus the 7 days before; null without data.
  double? get weeklyAccuracyDelta => throw _privateConstructorUsedError;

  /// ISO day of week (1 = Monday); null without a representative sample.
  int? get bestDayOfWeek => throw _privateConstructorUsedError;

  /// Accuracy by ISO day of week over the last 30 days.
  List<MasteryDayEntity> get dailyAccuracy =>
      throw _privateConstructorUsedError;

  /// Strongest local calendar day over the last 30 days.
  MasteryBestDayEntity? get bestDay => throw _privateConstructorUsedError;

  /// Create a copy of MasteryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MasteryEntityCopyWith<MasteryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasteryEntityCopyWith<$Res> {
  factory $MasteryEntityCopyWith(
          MasteryEntity value, $Res Function(MasteryEntity) then) =
      _$MasteryEntityCopyWithImpl<$Res, MasteryEntity>;
  @useResult
  $Res call(
      {List<MasteryTopicEntity> topics,
      MasteryTopicEntity? weakest,
      double? weeklyAccuracyDelta,
      int? bestDayOfWeek,
      List<MasteryDayEntity> dailyAccuracy,
      MasteryBestDayEntity? bestDay});

  $MasteryTopicEntityCopyWith<$Res>? get weakest;
  $MasteryBestDayEntityCopyWith<$Res>? get bestDay;
}

/// @nodoc
class _$MasteryEntityCopyWithImpl<$Res, $Val extends MasteryEntity>
    implements $MasteryEntityCopyWith<$Res> {
  _$MasteryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MasteryEntity
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
              as List<MasteryTopicEntity>,
      weakest: freezed == weakest
          ? _value.weakest
          : weakest // ignore: cast_nullable_to_non_nullable
              as MasteryTopicEntity?,
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
              as List<MasteryDayEntity>,
      bestDay: freezed == bestDay
          ? _value.bestDay
          : bestDay // ignore: cast_nullable_to_non_nullable
              as MasteryBestDayEntity?,
    ) as $Val);
  }

  /// Create a copy of MasteryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasteryTopicEntityCopyWith<$Res>? get weakest {
    if (_value.weakest == null) {
      return null;
    }

    return $MasteryTopicEntityCopyWith<$Res>(_value.weakest!, (value) {
      return _then(_value.copyWith(weakest: value) as $Val);
    });
  }

  /// Create a copy of MasteryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasteryBestDayEntityCopyWith<$Res>? get bestDay {
    if (_value.bestDay == null) {
      return null;
    }

    return $MasteryBestDayEntityCopyWith<$Res>(_value.bestDay!, (value) {
      return _then(_value.copyWith(bestDay: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MasteryEntityImplCopyWith<$Res>
    implements $MasteryEntityCopyWith<$Res> {
  factory _$$MasteryEntityImplCopyWith(
          _$MasteryEntityImpl value, $Res Function(_$MasteryEntityImpl) then) =
      __$$MasteryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MasteryTopicEntity> topics,
      MasteryTopicEntity? weakest,
      double? weeklyAccuracyDelta,
      int? bestDayOfWeek,
      List<MasteryDayEntity> dailyAccuracy,
      MasteryBestDayEntity? bestDay});

  @override
  $MasteryTopicEntityCopyWith<$Res>? get weakest;
  @override
  $MasteryBestDayEntityCopyWith<$Res>? get bestDay;
}

/// @nodoc
class __$$MasteryEntityImplCopyWithImpl<$Res>
    extends _$MasteryEntityCopyWithImpl<$Res, _$MasteryEntityImpl>
    implements _$$MasteryEntityImplCopyWith<$Res> {
  __$$MasteryEntityImplCopyWithImpl(
      _$MasteryEntityImpl _value, $Res Function(_$MasteryEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MasteryEntity
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
    return _then(_$MasteryEntityImpl(
      topics: null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<MasteryTopicEntity>,
      weakest: freezed == weakest
          ? _value.weakest
          : weakest // ignore: cast_nullable_to_non_nullable
              as MasteryTopicEntity?,
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
              as List<MasteryDayEntity>,
      bestDay: freezed == bestDay
          ? _value.bestDay
          : bestDay // ignore: cast_nullable_to_non_nullable
              as MasteryBestDayEntity?,
    ));
  }
}

/// @nodoc

class _$MasteryEntityImpl implements _MasteryEntity {
  const _$MasteryEntityImpl(
      {required final List<MasteryTopicEntity> topics,
      this.weakest,
      this.weeklyAccuracyDelta,
      this.bestDayOfWeek,
      final List<MasteryDayEntity> dailyAccuracy = const [],
      this.bestDay})
      : _topics = topics,
        _dailyAccuracy = dailyAccuracy;

  final List<MasteryTopicEntity> _topics;
  @override
  List<MasteryTopicEntity> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  @override
  final MasteryTopicEntity? weakest;

  /// Accuracy of the last 7 days minus the 7 days before; null without data.
  @override
  final double? weeklyAccuracyDelta;

  /// ISO day of week (1 = Monday); null without a representative sample.
  @override
  final int? bestDayOfWeek;

  /// Accuracy by ISO day of week over the last 30 days.
  final List<MasteryDayEntity> _dailyAccuracy;

  /// Accuracy by ISO day of week over the last 30 days.
  @override
  @JsonKey()
  List<MasteryDayEntity> get dailyAccuracy {
    if (_dailyAccuracy is EqualUnmodifiableListView) return _dailyAccuracy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyAccuracy);
  }

  /// Strongest local calendar day over the last 30 days.
  @override
  final MasteryBestDayEntity? bestDay;

  @override
  String toString() {
    return 'MasteryEntity(topics: $topics, weakest: $weakest, weeklyAccuracyDelta: $weeklyAccuracyDelta, bestDayOfWeek: $bestDayOfWeek, dailyAccuracy: $dailyAccuracy, bestDay: $bestDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasteryEntityImpl &&
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

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_topics),
      weakest,
      weeklyAccuracyDelta,
      bestDayOfWeek,
      const DeepCollectionEquality().hash(_dailyAccuracy),
      bestDay);

  /// Create a copy of MasteryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MasteryEntityImplCopyWith<_$MasteryEntityImpl> get copyWith =>
      __$$MasteryEntityImplCopyWithImpl<_$MasteryEntityImpl>(this, _$identity);
}

abstract class _MasteryEntity implements MasteryEntity {
  const factory _MasteryEntity(
      {required final List<MasteryTopicEntity> topics,
      final MasteryTopicEntity? weakest,
      final double? weeklyAccuracyDelta,
      final int? bestDayOfWeek,
      final List<MasteryDayEntity> dailyAccuracy,
      final MasteryBestDayEntity? bestDay}) = _$MasteryEntityImpl;

  @override
  List<MasteryTopicEntity> get topics;
  @override
  MasteryTopicEntity? get weakest;

  /// Accuracy of the last 7 days minus the 7 days before; null without data.
  @override
  double? get weeklyAccuracyDelta;

  /// ISO day of week (1 = Monday); null without a representative sample.
  @override
  int? get bestDayOfWeek;

  /// Accuracy by ISO day of week over the last 30 days.
  @override
  List<MasteryDayEntity> get dailyAccuracy;

  /// Strongest local calendar day over the last 30 days.
  @override
  MasteryBestDayEntity? get bestDay;

  /// Create a copy of MasteryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MasteryEntityImplCopyWith<_$MasteryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MasteryDayEntity {
  int get dayOfWeek => throw _privateConstructorUsedError;
  double get accuracy => throw _privateConstructorUsedError;
  int get answers => throw _privateConstructorUsedError;

  /// Create a copy of MasteryDayEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MasteryDayEntityCopyWith<MasteryDayEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasteryDayEntityCopyWith<$Res> {
  factory $MasteryDayEntityCopyWith(
          MasteryDayEntity value, $Res Function(MasteryDayEntity) then) =
      _$MasteryDayEntityCopyWithImpl<$Res, MasteryDayEntity>;
  @useResult
  $Res call({int dayOfWeek, double accuracy, int answers});
}

/// @nodoc
class _$MasteryDayEntityCopyWithImpl<$Res, $Val extends MasteryDayEntity>
    implements $MasteryDayEntityCopyWith<$Res> {
  _$MasteryDayEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MasteryDayEntity
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
abstract class _$$MasteryDayEntityImplCopyWith<$Res>
    implements $MasteryDayEntityCopyWith<$Res> {
  factory _$$MasteryDayEntityImplCopyWith(_$MasteryDayEntityImpl value,
          $Res Function(_$MasteryDayEntityImpl) then) =
      __$$MasteryDayEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int dayOfWeek, double accuracy, int answers});
}

/// @nodoc
class __$$MasteryDayEntityImplCopyWithImpl<$Res>
    extends _$MasteryDayEntityCopyWithImpl<$Res, _$MasteryDayEntityImpl>
    implements _$$MasteryDayEntityImplCopyWith<$Res> {
  __$$MasteryDayEntityImplCopyWithImpl(_$MasteryDayEntityImpl _value,
      $Res Function(_$MasteryDayEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MasteryDayEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeek = null,
    Object? accuracy = null,
    Object? answers = null,
  }) {
    return _then(_$MasteryDayEntityImpl(
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

class _$MasteryDayEntityImpl implements _MasteryDayEntity {
  const _$MasteryDayEntityImpl(
      {required this.dayOfWeek, required this.accuracy, required this.answers});

  @override
  final int dayOfWeek;
  @override
  final double accuracy;
  @override
  final int answers;

  @override
  String toString() {
    return 'MasteryDayEntity(dayOfWeek: $dayOfWeek, accuracy: $accuracy, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasteryDayEntityImpl &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.answers, answers) || other.answers == answers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dayOfWeek, accuracy, answers);

  /// Create a copy of MasteryDayEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MasteryDayEntityImplCopyWith<_$MasteryDayEntityImpl> get copyWith =>
      __$$MasteryDayEntityImplCopyWithImpl<_$MasteryDayEntityImpl>(
          this, _$identity);
}

abstract class _MasteryDayEntity implements MasteryDayEntity {
  const factory _MasteryDayEntity(
      {required final int dayOfWeek,
      required final double accuracy,
      required final int answers}) = _$MasteryDayEntityImpl;

  @override
  int get dayOfWeek;
  @override
  double get accuracy;
  @override
  int get answers;

  /// Create a copy of MasteryDayEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MasteryDayEntityImplCopyWith<_$MasteryDayEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MasteryBestDayEntity {
  DateTime get date => throw _privateConstructorUsedError;
  double get accuracy => throw _privateConstructorUsedError;
  int get answers => throw _privateConstructorUsedError;

  /// Create a copy of MasteryBestDayEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MasteryBestDayEntityCopyWith<MasteryBestDayEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasteryBestDayEntityCopyWith<$Res> {
  factory $MasteryBestDayEntityCopyWith(MasteryBestDayEntity value,
          $Res Function(MasteryBestDayEntity) then) =
      _$MasteryBestDayEntityCopyWithImpl<$Res, MasteryBestDayEntity>;
  @useResult
  $Res call({DateTime date, double accuracy, int answers});
}

/// @nodoc
class _$MasteryBestDayEntityCopyWithImpl<$Res,
        $Val extends MasteryBestDayEntity>
    implements $MasteryBestDayEntityCopyWith<$Res> {
  _$MasteryBestDayEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MasteryBestDayEntity
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
abstract class _$$MasteryBestDayEntityImplCopyWith<$Res>
    implements $MasteryBestDayEntityCopyWith<$Res> {
  factory _$$MasteryBestDayEntityImplCopyWith(_$MasteryBestDayEntityImpl value,
          $Res Function(_$MasteryBestDayEntityImpl) then) =
      __$$MasteryBestDayEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double accuracy, int answers});
}

/// @nodoc
class __$$MasteryBestDayEntityImplCopyWithImpl<$Res>
    extends _$MasteryBestDayEntityCopyWithImpl<$Res, _$MasteryBestDayEntityImpl>
    implements _$$MasteryBestDayEntityImplCopyWith<$Res> {
  __$$MasteryBestDayEntityImplCopyWithImpl(_$MasteryBestDayEntityImpl _value,
      $Res Function(_$MasteryBestDayEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MasteryBestDayEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? accuracy = null,
    Object? answers = null,
  }) {
    return _then(_$MasteryBestDayEntityImpl(
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

class _$MasteryBestDayEntityImpl implements _MasteryBestDayEntity {
  const _$MasteryBestDayEntityImpl(
      {required this.date, required this.accuracy, required this.answers});

  @override
  final DateTime date;
  @override
  final double accuracy;
  @override
  final int answers;

  @override
  String toString() {
    return 'MasteryBestDayEntity(date: $date, accuracy: $accuracy, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasteryBestDayEntityImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.answers, answers) || other.answers == answers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, accuracy, answers);

  /// Create a copy of MasteryBestDayEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MasteryBestDayEntityImplCopyWith<_$MasteryBestDayEntityImpl>
      get copyWith =>
          __$$MasteryBestDayEntityImplCopyWithImpl<_$MasteryBestDayEntityImpl>(
              this, _$identity);
}

abstract class _MasteryBestDayEntity implements MasteryBestDayEntity {
  const factory _MasteryBestDayEntity(
      {required final DateTime date,
      required final double accuracy,
      required final int answers}) = _$MasteryBestDayEntityImpl;

  @override
  DateTime get date;
  @override
  double get accuracy;
  @override
  int get answers;

  /// Create a copy of MasteryBestDayEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MasteryBestDayEntityImplCopyWith<_$MasteryBestDayEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MasteryTopicEntity {
  String get name => throw _privateConstructorUsedError;
  double get accuracy => throw _privateConstructorUsedError;
  int get answers => throw _privateConstructorUsedError;

  /// Create a copy of MasteryTopicEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MasteryTopicEntityCopyWith<MasteryTopicEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasteryTopicEntityCopyWith<$Res> {
  factory $MasteryTopicEntityCopyWith(
          MasteryTopicEntity value, $Res Function(MasteryTopicEntity) then) =
      _$MasteryTopicEntityCopyWithImpl<$Res, MasteryTopicEntity>;
  @useResult
  $Res call({String name, double accuracy, int answers});
}

/// @nodoc
class _$MasteryTopicEntityCopyWithImpl<$Res, $Val extends MasteryTopicEntity>
    implements $MasteryTopicEntityCopyWith<$Res> {
  _$MasteryTopicEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MasteryTopicEntity
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
abstract class _$$MasteryTopicEntityImplCopyWith<$Res>
    implements $MasteryTopicEntityCopyWith<$Res> {
  factory _$$MasteryTopicEntityImplCopyWith(_$MasteryTopicEntityImpl value,
          $Res Function(_$MasteryTopicEntityImpl) then) =
      __$$MasteryTopicEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double accuracy, int answers});
}

/// @nodoc
class __$$MasteryTopicEntityImplCopyWithImpl<$Res>
    extends _$MasteryTopicEntityCopyWithImpl<$Res, _$MasteryTopicEntityImpl>
    implements _$$MasteryTopicEntityImplCopyWith<$Res> {
  __$$MasteryTopicEntityImplCopyWithImpl(_$MasteryTopicEntityImpl _value,
      $Res Function(_$MasteryTopicEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MasteryTopicEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? accuracy = null,
    Object? answers = null,
  }) {
    return _then(_$MasteryTopicEntityImpl(
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

class _$MasteryTopicEntityImpl implements _MasteryTopicEntity {
  const _$MasteryTopicEntityImpl(
      {required this.name, required this.accuracy, required this.answers});

  @override
  final String name;
  @override
  final double accuracy;
  @override
  final int answers;

  @override
  String toString() {
    return 'MasteryTopicEntity(name: $name, accuracy: $accuracy, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasteryTopicEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.answers, answers) || other.answers == answers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, accuracy, answers);

  /// Create a copy of MasteryTopicEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MasteryTopicEntityImplCopyWith<_$MasteryTopicEntityImpl> get copyWith =>
      __$$MasteryTopicEntityImplCopyWithImpl<_$MasteryTopicEntityImpl>(
          this, _$identity);
}

abstract class _MasteryTopicEntity implements MasteryTopicEntity {
  const factory _MasteryTopicEntity(
      {required final String name,
      required final double accuracy,
      required final int answers}) = _$MasteryTopicEntityImpl;

  @override
  String get name;
  @override
  double get accuracy;
  @override
  int get answers;

  /// Create a copy of MasteryTopicEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MasteryTopicEntityImplCopyWith<_$MasteryTopicEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
