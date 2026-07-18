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
      @JsonKey(name: 'best_day_of_week') int? bestDayOfWeek});

  $MasteryTopicDtoCopyWith<$Res>? get weakest;
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
      @JsonKey(name: 'best_day_of_week') int? bestDayOfWeek});

  @override
  $MasteryTopicDtoCopyWith<$Res>? get weakest;
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
      @JsonKey(name: 'best_day_of_week') this.bestDayOfWeek})
      : _topics = topics;

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

  @override
  String toString() {
    return 'MasteryDto(topics: $topics, weakest: $weakest, weeklyAccuracyDelta: $weeklyAccuracyDelta, bestDayOfWeek: $bestDayOfWeek)';
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
                other.bestDayOfWeek == bestDayOfWeek));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_topics),
      weakest,
      weeklyAccuracyDelta,
      bestDayOfWeek);

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
      @JsonKey(name: 'best_day_of_week')
      final int? bestDayOfWeek}) = _$MasteryDtoImpl;

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

  /// Create a copy of MasteryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MasteryDtoImplCopyWith<_$MasteryDtoImpl> get copyWith =>
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
