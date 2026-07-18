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

  /// ISO day of week (1 = Monday); null without data.
  int? get bestDayOfWeek => throw _privateConstructorUsedError;

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
      int? bestDayOfWeek});

  $MasteryTopicEntityCopyWith<$Res>? get weakest;
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
      int? bestDayOfWeek});

  @override
  $MasteryTopicEntityCopyWith<$Res>? get weakest;
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
    ));
  }
}

/// @nodoc

class _$MasteryEntityImpl implements _MasteryEntity {
  const _$MasteryEntityImpl(
      {required final List<MasteryTopicEntity> topics,
      this.weakest,
      this.weeklyAccuracyDelta,
      this.bestDayOfWeek})
      : _topics = topics;

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

  /// ISO day of week (1 = Monday); null without data.
  @override
  final int? bestDayOfWeek;

  @override
  String toString() {
    return 'MasteryEntity(topics: $topics, weakest: $weakest, weeklyAccuracyDelta: $weeklyAccuracyDelta, bestDayOfWeek: $bestDayOfWeek)';
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
                other.bestDayOfWeek == bestDayOfWeek));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_topics),
      weakest,
      weeklyAccuracyDelta,
      bestDayOfWeek);

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
      final int? bestDayOfWeek}) = _$MasteryEntityImpl;

  @override
  List<MasteryTopicEntity> get topics;
  @override
  MasteryTopicEntity? get weakest;

  /// Accuracy of the last 7 days minus the 7 days before; null without data.
  @override
  double? get weeklyAccuracyDelta;

  /// ISO day of week (1 = Monday); null without data.
  @override
  int? get bestDayOfWeek;

  /// Create a copy of MasteryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MasteryEntityImplCopyWith<_$MasteryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
