// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_edition_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailyContinuationDto _$DailyContinuationDtoFromJson(Map<String, dynamic> json) {
  return _DailyContinuationDto.fromJson(json);
}

/// @nodoc
mixin _$DailyContinuationDto {
  @JsonKey(name: 'run_id')
  String get runId => throw _privateConstructorUsedError;
  @JsonKey(name: 'server_time')
  DateTime get serverTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'closes_at')
  DateTime get closesAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_action')
  String get nextAction => throw _privateConstructorUsedError;
  @JsonKey(name: 'quiz_plus')
  bool get quizPlus => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonus_questions_granted')
  int get bonusQuestionsGranted => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonus_questions_served')
  int get bonusQuestionsServed => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonus_questions_remaining')
  int get bonusQuestionsRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'questions_per_reward')
  int get questionsPerReward => throw _privateConstructorUsedError;
  @JsonKey(name: 'rewarded_videos_used')
  int get rewardedVideosUsed => throw _privateConstructorUsedError;
  @JsonKey(name: 'rewarded_videos_max')
  int get rewardedVideosMax => throw _privateConstructorUsedError;
  @JsonKey(name: 'rewarded_videos_remaining')
  int get rewardedVideosRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'rolling_videos_used')
  int get rollingVideosUsed => throw _privateConstructorUsedError;
  @JsonKey(name: 'rolling_videos_max')
  int get rollingVideosMax => throw _privateConstructorUsedError;
  @JsonKey(name: 'rewarded_ad_available')
  bool get rewardedAdAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'rewarded_ad_next_available_at')
  DateTime? get rewardedAdNextAvailableAt => throw _privateConstructorUsedError;

  /// Serializes this DailyContinuationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyContinuationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyContinuationDtoCopyWith<DailyContinuationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyContinuationDtoCopyWith<$Res> {
  factory $DailyContinuationDtoCopyWith(DailyContinuationDto value,
          $Res Function(DailyContinuationDto) then) =
      _$DailyContinuationDtoCopyWithImpl<$Res, DailyContinuationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'run_id') String runId,
      @JsonKey(name: 'server_time') DateTime serverTime,
      @JsonKey(name: 'closes_at') DateTime closesAt,
      @JsonKey(name: 'next_action') String nextAction,
      @JsonKey(name: 'quiz_plus') bool quizPlus,
      @JsonKey(name: 'bonus_questions_granted') int bonusQuestionsGranted,
      @JsonKey(name: 'bonus_questions_served') int bonusQuestionsServed,
      @JsonKey(name: 'bonus_questions_remaining') int bonusQuestionsRemaining,
      @JsonKey(name: 'questions_per_reward') int questionsPerReward,
      @JsonKey(name: 'rewarded_videos_used') int rewardedVideosUsed,
      @JsonKey(name: 'rewarded_videos_max') int rewardedVideosMax,
      @JsonKey(name: 'rewarded_videos_remaining') int rewardedVideosRemaining,
      @JsonKey(name: 'rolling_videos_used') int rollingVideosUsed,
      @JsonKey(name: 'rolling_videos_max') int rollingVideosMax,
      @JsonKey(name: 'rewarded_ad_available') bool rewardedAdAvailable,
      @JsonKey(name: 'rewarded_ad_next_available_at')
      DateTime? rewardedAdNextAvailableAt});
}

/// @nodoc
class _$DailyContinuationDtoCopyWithImpl<$Res,
        $Val extends DailyContinuationDto>
    implements $DailyContinuationDtoCopyWith<$Res> {
  _$DailyContinuationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyContinuationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runId = null,
    Object? serverTime = null,
    Object? closesAt = null,
    Object? nextAction = null,
    Object? quizPlus = null,
    Object? bonusQuestionsGranted = null,
    Object? bonusQuestionsServed = null,
    Object? bonusQuestionsRemaining = null,
    Object? questionsPerReward = null,
    Object? rewardedVideosUsed = null,
    Object? rewardedVideosMax = null,
    Object? rewardedVideosRemaining = null,
    Object? rollingVideosUsed = null,
    Object? rollingVideosMax = null,
    Object? rewardedAdAvailable = null,
    Object? rewardedAdNextAvailableAt = freezed,
  }) {
    return _then(_value.copyWith(
      runId: null == runId
          ? _value.runId
          : runId // ignore: cast_nullable_to_non_nullable
              as String,
      serverTime: null == serverTime
          ? _value.serverTime
          : serverTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      closesAt: null == closesAt
          ? _value.closesAt
          : closesAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nextAction: null == nextAction
          ? _value.nextAction
          : nextAction // ignore: cast_nullable_to_non_nullable
              as String,
      quizPlus: null == quizPlus
          ? _value.quizPlus
          : quizPlus // ignore: cast_nullable_to_non_nullable
              as bool,
      bonusQuestionsGranted: null == bonusQuestionsGranted
          ? _value.bonusQuestionsGranted
          : bonusQuestionsGranted // ignore: cast_nullable_to_non_nullable
              as int,
      bonusQuestionsServed: null == bonusQuestionsServed
          ? _value.bonusQuestionsServed
          : bonusQuestionsServed // ignore: cast_nullable_to_non_nullable
              as int,
      bonusQuestionsRemaining: null == bonusQuestionsRemaining
          ? _value.bonusQuestionsRemaining
          : bonusQuestionsRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      questionsPerReward: null == questionsPerReward
          ? _value.questionsPerReward
          : questionsPerReward // ignore: cast_nullable_to_non_nullable
              as int,
      rewardedVideosUsed: null == rewardedVideosUsed
          ? _value.rewardedVideosUsed
          : rewardedVideosUsed // ignore: cast_nullable_to_non_nullable
              as int,
      rewardedVideosMax: null == rewardedVideosMax
          ? _value.rewardedVideosMax
          : rewardedVideosMax // ignore: cast_nullable_to_non_nullable
              as int,
      rewardedVideosRemaining: null == rewardedVideosRemaining
          ? _value.rewardedVideosRemaining
          : rewardedVideosRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      rollingVideosUsed: null == rollingVideosUsed
          ? _value.rollingVideosUsed
          : rollingVideosUsed // ignore: cast_nullable_to_non_nullable
              as int,
      rollingVideosMax: null == rollingVideosMax
          ? _value.rollingVideosMax
          : rollingVideosMax // ignore: cast_nullable_to_non_nullable
              as int,
      rewardedAdAvailable: null == rewardedAdAvailable
          ? _value.rewardedAdAvailable
          : rewardedAdAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      rewardedAdNextAvailableAt: freezed == rewardedAdNextAvailableAt
          ? _value.rewardedAdNextAvailableAt
          : rewardedAdNextAvailableAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyContinuationDtoImplCopyWith<$Res>
    implements $DailyContinuationDtoCopyWith<$Res> {
  factory _$$DailyContinuationDtoImplCopyWith(_$DailyContinuationDtoImpl value,
          $Res Function(_$DailyContinuationDtoImpl) then) =
      __$$DailyContinuationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'run_id') String runId,
      @JsonKey(name: 'server_time') DateTime serverTime,
      @JsonKey(name: 'closes_at') DateTime closesAt,
      @JsonKey(name: 'next_action') String nextAction,
      @JsonKey(name: 'quiz_plus') bool quizPlus,
      @JsonKey(name: 'bonus_questions_granted') int bonusQuestionsGranted,
      @JsonKey(name: 'bonus_questions_served') int bonusQuestionsServed,
      @JsonKey(name: 'bonus_questions_remaining') int bonusQuestionsRemaining,
      @JsonKey(name: 'questions_per_reward') int questionsPerReward,
      @JsonKey(name: 'rewarded_videos_used') int rewardedVideosUsed,
      @JsonKey(name: 'rewarded_videos_max') int rewardedVideosMax,
      @JsonKey(name: 'rewarded_videos_remaining') int rewardedVideosRemaining,
      @JsonKey(name: 'rolling_videos_used') int rollingVideosUsed,
      @JsonKey(name: 'rolling_videos_max') int rollingVideosMax,
      @JsonKey(name: 'rewarded_ad_available') bool rewardedAdAvailable,
      @JsonKey(name: 'rewarded_ad_next_available_at')
      DateTime? rewardedAdNextAvailableAt});
}

/// @nodoc
class __$$DailyContinuationDtoImplCopyWithImpl<$Res>
    extends _$DailyContinuationDtoCopyWithImpl<$Res, _$DailyContinuationDtoImpl>
    implements _$$DailyContinuationDtoImplCopyWith<$Res> {
  __$$DailyContinuationDtoImplCopyWithImpl(_$DailyContinuationDtoImpl _value,
      $Res Function(_$DailyContinuationDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyContinuationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runId = null,
    Object? serverTime = null,
    Object? closesAt = null,
    Object? nextAction = null,
    Object? quizPlus = null,
    Object? bonusQuestionsGranted = null,
    Object? bonusQuestionsServed = null,
    Object? bonusQuestionsRemaining = null,
    Object? questionsPerReward = null,
    Object? rewardedVideosUsed = null,
    Object? rewardedVideosMax = null,
    Object? rewardedVideosRemaining = null,
    Object? rollingVideosUsed = null,
    Object? rollingVideosMax = null,
    Object? rewardedAdAvailable = null,
    Object? rewardedAdNextAvailableAt = freezed,
  }) {
    return _then(_$DailyContinuationDtoImpl(
      runId: null == runId
          ? _value.runId
          : runId // ignore: cast_nullable_to_non_nullable
              as String,
      serverTime: null == serverTime
          ? _value.serverTime
          : serverTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      closesAt: null == closesAt
          ? _value.closesAt
          : closesAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nextAction: null == nextAction
          ? _value.nextAction
          : nextAction // ignore: cast_nullable_to_non_nullable
              as String,
      quizPlus: null == quizPlus
          ? _value.quizPlus
          : quizPlus // ignore: cast_nullable_to_non_nullable
              as bool,
      bonusQuestionsGranted: null == bonusQuestionsGranted
          ? _value.bonusQuestionsGranted
          : bonusQuestionsGranted // ignore: cast_nullable_to_non_nullable
              as int,
      bonusQuestionsServed: null == bonusQuestionsServed
          ? _value.bonusQuestionsServed
          : bonusQuestionsServed // ignore: cast_nullable_to_non_nullable
              as int,
      bonusQuestionsRemaining: null == bonusQuestionsRemaining
          ? _value.bonusQuestionsRemaining
          : bonusQuestionsRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      questionsPerReward: null == questionsPerReward
          ? _value.questionsPerReward
          : questionsPerReward // ignore: cast_nullable_to_non_nullable
              as int,
      rewardedVideosUsed: null == rewardedVideosUsed
          ? _value.rewardedVideosUsed
          : rewardedVideosUsed // ignore: cast_nullable_to_non_nullable
              as int,
      rewardedVideosMax: null == rewardedVideosMax
          ? _value.rewardedVideosMax
          : rewardedVideosMax // ignore: cast_nullable_to_non_nullable
              as int,
      rewardedVideosRemaining: null == rewardedVideosRemaining
          ? _value.rewardedVideosRemaining
          : rewardedVideosRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      rollingVideosUsed: null == rollingVideosUsed
          ? _value.rollingVideosUsed
          : rollingVideosUsed // ignore: cast_nullable_to_non_nullable
              as int,
      rollingVideosMax: null == rollingVideosMax
          ? _value.rollingVideosMax
          : rollingVideosMax // ignore: cast_nullable_to_non_nullable
              as int,
      rewardedAdAvailable: null == rewardedAdAvailable
          ? _value.rewardedAdAvailable
          : rewardedAdAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      rewardedAdNextAvailableAt: freezed == rewardedAdNextAvailableAt
          ? _value.rewardedAdNextAvailableAt
          : rewardedAdNextAvailableAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyContinuationDtoImpl implements _DailyContinuationDto {
  const _$DailyContinuationDtoImpl(
      {@JsonKey(name: 'run_id') required this.runId,
      @JsonKey(name: 'server_time') required this.serverTime,
      @JsonKey(name: 'closes_at') required this.closesAt,
      @JsonKey(name: 'next_action') required this.nextAction,
      @JsonKey(name: 'quiz_plus') required this.quizPlus,
      @JsonKey(name: 'bonus_questions_granted')
      required this.bonusQuestionsGranted,
      @JsonKey(name: 'bonus_questions_served')
      required this.bonusQuestionsServed,
      @JsonKey(name: 'bonus_questions_remaining')
      required this.bonusQuestionsRemaining,
      @JsonKey(name: 'questions_per_reward') required this.questionsPerReward,
      @JsonKey(name: 'rewarded_videos_used') required this.rewardedVideosUsed,
      @JsonKey(name: 'rewarded_videos_max') required this.rewardedVideosMax,
      @JsonKey(name: 'rewarded_videos_remaining')
      required this.rewardedVideosRemaining,
      @JsonKey(name: 'rolling_videos_used') required this.rollingVideosUsed,
      @JsonKey(name: 'rolling_videos_max') required this.rollingVideosMax,
      @JsonKey(name: 'rewarded_ad_available') required this.rewardedAdAvailable,
      @JsonKey(name: 'rewarded_ad_next_available_at')
      this.rewardedAdNextAvailableAt});

  factory _$DailyContinuationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyContinuationDtoImplFromJson(json);

  @override
  @JsonKey(name: 'run_id')
  final String runId;
  @override
  @JsonKey(name: 'server_time')
  final DateTime serverTime;
  @override
  @JsonKey(name: 'closes_at')
  final DateTime closesAt;
  @override
  @JsonKey(name: 'next_action')
  final String nextAction;
  @override
  @JsonKey(name: 'quiz_plus')
  final bool quizPlus;
  @override
  @JsonKey(name: 'bonus_questions_granted')
  final int bonusQuestionsGranted;
  @override
  @JsonKey(name: 'bonus_questions_served')
  final int bonusQuestionsServed;
  @override
  @JsonKey(name: 'bonus_questions_remaining')
  final int bonusQuestionsRemaining;
  @override
  @JsonKey(name: 'questions_per_reward')
  final int questionsPerReward;
  @override
  @JsonKey(name: 'rewarded_videos_used')
  final int rewardedVideosUsed;
  @override
  @JsonKey(name: 'rewarded_videos_max')
  final int rewardedVideosMax;
  @override
  @JsonKey(name: 'rewarded_videos_remaining')
  final int rewardedVideosRemaining;
  @override
  @JsonKey(name: 'rolling_videos_used')
  final int rollingVideosUsed;
  @override
  @JsonKey(name: 'rolling_videos_max')
  final int rollingVideosMax;
  @override
  @JsonKey(name: 'rewarded_ad_available')
  final bool rewardedAdAvailable;
  @override
  @JsonKey(name: 'rewarded_ad_next_available_at')
  final DateTime? rewardedAdNextAvailableAt;

  @override
  String toString() {
    return 'DailyContinuationDto(runId: $runId, serverTime: $serverTime, closesAt: $closesAt, nextAction: $nextAction, quizPlus: $quizPlus, bonusQuestionsGranted: $bonusQuestionsGranted, bonusQuestionsServed: $bonusQuestionsServed, bonusQuestionsRemaining: $bonusQuestionsRemaining, questionsPerReward: $questionsPerReward, rewardedVideosUsed: $rewardedVideosUsed, rewardedVideosMax: $rewardedVideosMax, rewardedVideosRemaining: $rewardedVideosRemaining, rollingVideosUsed: $rollingVideosUsed, rollingVideosMax: $rollingVideosMax, rewardedAdAvailable: $rewardedAdAvailable, rewardedAdNextAvailableAt: $rewardedAdNextAvailableAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyContinuationDtoImpl &&
            (identical(other.runId, runId) || other.runId == runId) &&
            (identical(other.serverTime, serverTime) ||
                other.serverTime == serverTime) &&
            (identical(other.closesAt, closesAt) ||
                other.closesAt == closesAt) &&
            (identical(other.nextAction, nextAction) ||
                other.nextAction == nextAction) &&
            (identical(other.quizPlus, quizPlus) ||
                other.quizPlus == quizPlus) &&
            (identical(other.bonusQuestionsGranted, bonusQuestionsGranted) ||
                other.bonusQuestionsGranted == bonusQuestionsGranted) &&
            (identical(other.bonusQuestionsServed, bonusQuestionsServed) ||
                other.bonusQuestionsServed == bonusQuestionsServed) &&
            (identical(
                    other.bonusQuestionsRemaining, bonusQuestionsRemaining) ||
                other.bonusQuestionsRemaining == bonusQuestionsRemaining) &&
            (identical(other.questionsPerReward, questionsPerReward) ||
                other.questionsPerReward == questionsPerReward) &&
            (identical(other.rewardedVideosUsed, rewardedVideosUsed) ||
                other.rewardedVideosUsed == rewardedVideosUsed) &&
            (identical(other.rewardedVideosMax, rewardedVideosMax) ||
                other.rewardedVideosMax == rewardedVideosMax) &&
            (identical(
                    other.rewardedVideosRemaining, rewardedVideosRemaining) ||
                other.rewardedVideosRemaining == rewardedVideosRemaining) &&
            (identical(other.rollingVideosUsed, rollingVideosUsed) ||
                other.rollingVideosUsed == rollingVideosUsed) &&
            (identical(other.rollingVideosMax, rollingVideosMax) ||
                other.rollingVideosMax == rollingVideosMax) &&
            (identical(other.rewardedAdAvailable, rewardedAdAvailable) ||
                other.rewardedAdAvailable == rewardedAdAvailable) &&
            (identical(other.rewardedAdNextAvailableAt,
                    rewardedAdNextAvailableAt) ||
                other.rewardedAdNextAvailableAt == rewardedAdNextAvailableAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      runId,
      serverTime,
      closesAt,
      nextAction,
      quizPlus,
      bonusQuestionsGranted,
      bonusQuestionsServed,
      bonusQuestionsRemaining,
      questionsPerReward,
      rewardedVideosUsed,
      rewardedVideosMax,
      rewardedVideosRemaining,
      rollingVideosUsed,
      rollingVideosMax,
      rewardedAdAvailable,
      rewardedAdNextAvailableAt);

  /// Create a copy of DailyContinuationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyContinuationDtoImplCopyWith<_$DailyContinuationDtoImpl>
      get copyWith =>
          __$$DailyContinuationDtoImplCopyWithImpl<_$DailyContinuationDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyContinuationDtoImplToJson(
      this,
    );
  }
}

abstract class _DailyContinuationDto implements DailyContinuationDto {
  const factory _DailyContinuationDto(
      {@JsonKey(name: 'run_id') required final String runId,
      @JsonKey(name: 'server_time') required final DateTime serverTime,
      @JsonKey(name: 'closes_at') required final DateTime closesAt,
      @JsonKey(name: 'next_action') required final String nextAction,
      @JsonKey(name: 'quiz_plus') required final bool quizPlus,
      @JsonKey(name: 'bonus_questions_granted')
      required final int bonusQuestionsGranted,
      @JsonKey(name: 'bonus_questions_served')
      required final int bonusQuestionsServed,
      @JsonKey(name: 'bonus_questions_remaining')
      required final int bonusQuestionsRemaining,
      @JsonKey(name: 'questions_per_reward')
      required final int questionsPerReward,
      @JsonKey(name: 'rewarded_videos_used')
      required final int rewardedVideosUsed,
      @JsonKey(name: 'rewarded_videos_max')
      required final int rewardedVideosMax,
      @JsonKey(name: 'rewarded_videos_remaining')
      required final int rewardedVideosRemaining,
      @JsonKey(name: 'rolling_videos_used')
      required final int rollingVideosUsed,
      @JsonKey(name: 'rolling_videos_max') required final int rollingVideosMax,
      @JsonKey(name: 'rewarded_ad_available')
      required final bool rewardedAdAvailable,
      @JsonKey(name: 'rewarded_ad_next_available_at')
      final DateTime? rewardedAdNextAvailableAt}) = _$DailyContinuationDtoImpl;

  factory _DailyContinuationDto.fromJson(Map<String, dynamic> json) =
      _$DailyContinuationDtoImpl.fromJson;

  @override
  @JsonKey(name: 'run_id')
  String get runId;
  @override
  @JsonKey(name: 'server_time')
  DateTime get serverTime;
  @override
  @JsonKey(name: 'closes_at')
  DateTime get closesAt;
  @override
  @JsonKey(name: 'next_action')
  String get nextAction;
  @override
  @JsonKey(name: 'quiz_plus')
  bool get quizPlus;
  @override
  @JsonKey(name: 'bonus_questions_granted')
  int get bonusQuestionsGranted;
  @override
  @JsonKey(name: 'bonus_questions_served')
  int get bonusQuestionsServed;
  @override
  @JsonKey(name: 'bonus_questions_remaining')
  int get bonusQuestionsRemaining;
  @override
  @JsonKey(name: 'questions_per_reward')
  int get questionsPerReward;
  @override
  @JsonKey(name: 'rewarded_videos_used')
  int get rewardedVideosUsed;
  @override
  @JsonKey(name: 'rewarded_videos_max')
  int get rewardedVideosMax;
  @override
  @JsonKey(name: 'rewarded_videos_remaining')
  int get rewardedVideosRemaining;
  @override
  @JsonKey(name: 'rolling_videos_used')
  int get rollingVideosUsed;
  @override
  @JsonKey(name: 'rolling_videos_max')
  int get rollingVideosMax;
  @override
  @JsonKey(name: 'rewarded_ad_available')
  bool get rewardedAdAvailable;
  @override
  @JsonKey(name: 'rewarded_ad_next_available_at')
  DateTime? get rewardedAdNextAvailableAt;

  /// Create a copy of DailyContinuationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyContinuationDtoImplCopyWith<_$DailyContinuationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DailyOpenDto _$DailyOpenDtoFromJson(Map<String, dynamic> json) {
  return _DailyOpenDto.fromJson(json);
}

/// @nodoc
mixin _$DailyOpenDto {
  @JsonKey(name: 'run_id')
  String get runId => throw _privateConstructorUsedError;
  @JsonKey(name: 'edition_date')
  String get editionDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'closes_at')
  DateTime get closesAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'grace_ends_at')
  DateTime get graceEndsAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'required_count')
  int get requiredCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'resolved_count')
  int get resolvedCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating_at_open')
  int get ratingAtOpen => throw _privateConstructorUsedError;
  DailyContinuationDto get continuation => throw _privateConstructorUsedError;

  /// Serializes this DailyOpenDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyOpenDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyOpenDtoCopyWith<DailyOpenDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyOpenDtoCopyWith<$Res> {
  factory $DailyOpenDtoCopyWith(
          DailyOpenDto value, $Res Function(DailyOpenDto) then) =
      _$DailyOpenDtoCopyWithImpl<$Res, DailyOpenDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'run_id') String runId,
      @JsonKey(name: 'edition_date') String editionDate,
      String status,
      @JsonKey(name: 'closes_at') DateTime closesAt,
      @JsonKey(name: 'grace_ends_at') DateTime graceEndsAt,
      @JsonKey(name: 'required_count') int requiredCount,
      @JsonKey(name: 'resolved_count') int resolvedCount,
      @JsonKey(name: 'rating_at_open') int ratingAtOpen,
      DailyContinuationDto continuation});

  $DailyContinuationDtoCopyWith<$Res> get continuation;
}

/// @nodoc
class _$DailyOpenDtoCopyWithImpl<$Res, $Val extends DailyOpenDto>
    implements $DailyOpenDtoCopyWith<$Res> {
  _$DailyOpenDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyOpenDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runId = null,
    Object? editionDate = null,
    Object? status = null,
    Object? closesAt = null,
    Object? graceEndsAt = null,
    Object? requiredCount = null,
    Object? resolvedCount = null,
    Object? ratingAtOpen = null,
    Object? continuation = null,
  }) {
    return _then(_value.copyWith(
      runId: null == runId
          ? _value.runId
          : runId // ignore: cast_nullable_to_non_nullable
              as String,
      editionDate: null == editionDate
          ? _value.editionDate
          : editionDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      closesAt: null == closesAt
          ? _value.closesAt
          : closesAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      graceEndsAt: null == graceEndsAt
          ? _value.graceEndsAt
          : graceEndsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      requiredCount: null == requiredCount
          ? _value.requiredCount
          : requiredCount // ignore: cast_nullable_to_non_nullable
              as int,
      resolvedCount: null == resolvedCount
          ? _value.resolvedCount
          : resolvedCount // ignore: cast_nullable_to_non_nullable
              as int,
      ratingAtOpen: null == ratingAtOpen
          ? _value.ratingAtOpen
          : ratingAtOpen // ignore: cast_nullable_to_non_nullable
              as int,
      continuation: null == continuation
          ? _value.continuation
          : continuation // ignore: cast_nullable_to_non_nullable
              as DailyContinuationDto,
    ) as $Val);
  }

  /// Create a copy of DailyOpenDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyContinuationDtoCopyWith<$Res> get continuation {
    return $DailyContinuationDtoCopyWith<$Res>(_value.continuation, (value) {
      return _then(_value.copyWith(continuation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DailyOpenDtoImplCopyWith<$Res>
    implements $DailyOpenDtoCopyWith<$Res> {
  factory _$$DailyOpenDtoImplCopyWith(
          _$DailyOpenDtoImpl value, $Res Function(_$DailyOpenDtoImpl) then) =
      __$$DailyOpenDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'run_id') String runId,
      @JsonKey(name: 'edition_date') String editionDate,
      String status,
      @JsonKey(name: 'closes_at') DateTime closesAt,
      @JsonKey(name: 'grace_ends_at') DateTime graceEndsAt,
      @JsonKey(name: 'required_count') int requiredCount,
      @JsonKey(name: 'resolved_count') int resolvedCount,
      @JsonKey(name: 'rating_at_open') int ratingAtOpen,
      DailyContinuationDto continuation});

  @override
  $DailyContinuationDtoCopyWith<$Res> get continuation;
}

/// @nodoc
class __$$DailyOpenDtoImplCopyWithImpl<$Res>
    extends _$DailyOpenDtoCopyWithImpl<$Res, _$DailyOpenDtoImpl>
    implements _$$DailyOpenDtoImplCopyWith<$Res> {
  __$$DailyOpenDtoImplCopyWithImpl(
      _$DailyOpenDtoImpl _value, $Res Function(_$DailyOpenDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyOpenDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runId = null,
    Object? editionDate = null,
    Object? status = null,
    Object? closesAt = null,
    Object? graceEndsAt = null,
    Object? requiredCount = null,
    Object? resolvedCount = null,
    Object? ratingAtOpen = null,
    Object? continuation = null,
  }) {
    return _then(_$DailyOpenDtoImpl(
      runId: null == runId
          ? _value.runId
          : runId // ignore: cast_nullable_to_non_nullable
              as String,
      editionDate: null == editionDate
          ? _value.editionDate
          : editionDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      closesAt: null == closesAt
          ? _value.closesAt
          : closesAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      graceEndsAt: null == graceEndsAt
          ? _value.graceEndsAt
          : graceEndsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      requiredCount: null == requiredCount
          ? _value.requiredCount
          : requiredCount // ignore: cast_nullable_to_non_nullable
              as int,
      resolvedCount: null == resolvedCount
          ? _value.resolvedCount
          : resolvedCount // ignore: cast_nullable_to_non_nullable
              as int,
      ratingAtOpen: null == ratingAtOpen
          ? _value.ratingAtOpen
          : ratingAtOpen // ignore: cast_nullable_to_non_nullable
              as int,
      continuation: null == continuation
          ? _value.continuation
          : continuation // ignore: cast_nullable_to_non_nullable
              as DailyContinuationDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyOpenDtoImpl implements _DailyOpenDto {
  const _$DailyOpenDtoImpl(
      {@JsonKey(name: 'run_id') required this.runId,
      @JsonKey(name: 'edition_date') required this.editionDate,
      required this.status,
      @JsonKey(name: 'closes_at') required this.closesAt,
      @JsonKey(name: 'grace_ends_at') required this.graceEndsAt,
      @JsonKey(name: 'required_count') required this.requiredCount,
      @JsonKey(name: 'resolved_count') required this.resolvedCount,
      @JsonKey(name: 'rating_at_open') required this.ratingAtOpen,
      required this.continuation});

  factory _$DailyOpenDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyOpenDtoImplFromJson(json);

  @override
  @JsonKey(name: 'run_id')
  final String runId;
  @override
  @JsonKey(name: 'edition_date')
  final String editionDate;
  @override
  final String status;
  @override
  @JsonKey(name: 'closes_at')
  final DateTime closesAt;
  @override
  @JsonKey(name: 'grace_ends_at')
  final DateTime graceEndsAt;
  @override
  @JsonKey(name: 'required_count')
  final int requiredCount;
  @override
  @JsonKey(name: 'resolved_count')
  final int resolvedCount;
  @override
  @JsonKey(name: 'rating_at_open')
  final int ratingAtOpen;
  @override
  final DailyContinuationDto continuation;

  @override
  String toString() {
    return 'DailyOpenDto(runId: $runId, editionDate: $editionDate, status: $status, closesAt: $closesAt, graceEndsAt: $graceEndsAt, requiredCount: $requiredCount, resolvedCount: $resolvedCount, ratingAtOpen: $ratingAtOpen, continuation: $continuation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyOpenDtoImpl &&
            (identical(other.runId, runId) || other.runId == runId) &&
            (identical(other.editionDate, editionDate) ||
                other.editionDate == editionDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.closesAt, closesAt) ||
                other.closesAt == closesAt) &&
            (identical(other.graceEndsAt, graceEndsAt) ||
                other.graceEndsAt == graceEndsAt) &&
            (identical(other.requiredCount, requiredCount) ||
                other.requiredCount == requiredCount) &&
            (identical(other.resolvedCount, resolvedCount) ||
                other.resolvedCount == resolvedCount) &&
            (identical(other.ratingAtOpen, ratingAtOpen) ||
                other.ratingAtOpen == ratingAtOpen) &&
            (identical(other.continuation, continuation) ||
                other.continuation == continuation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      runId,
      editionDate,
      status,
      closesAt,
      graceEndsAt,
      requiredCount,
      resolvedCount,
      ratingAtOpen,
      continuation);

  /// Create a copy of DailyOpenDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyOpenDtoImplCopyWith<_$DailyOpenDtoImpl> get copyWith =>
      __$$DailyOpenDtoImplCopyWithImpl<_$DailyOpenDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyOpenDtoImplToJson(
      this,
    );
  }
}

abstract class _DailyOpenDto implements DailyOpenDto {
  const factory _DailyOpenDto(
      {@JsonKey(name: 'run_id') required final String runId,
      @JsonKey(name: 'edition_date') required final String editionDate,
      required final String status,
      @JsonKey(name: 'closes_at') required final DateTime closesAt,
      @JsonKey(name: 'grace_ends_at') required final DateTime graceEndsAt,
      @JsonKey(name: 'required_count') required final int requiredCount,
      @JsonKey(name: 'resolved_count') required final int resolvedCount,
      @JsonKey(name: 'rating_at_open') required final int ratingAtOpen,
      required final DailyContinuationDto continuation}) = _$DailyOpenDtoImpl;

  factory _DailyOpenDto.fromJson(Map<String, dynamic> json) =
      _$DailyOpenDtoImpl.fromJson;

  @override
  @JsonKey(name: 'run_id')
  String get runId;
  @override
  @JsonKey(name: 'edition_date')
  String get editionDate;
  @override
  String get status;
  @override
  @JsonKey(name: 'closes_at')
  DateTime get closesAt;
  @override
  @JsonKey(name: 'grace_ends_at')
  DateTime get graceEndsAt;
  @override
  @JsonKey(name: 'required_count')
  int get requiredCount;
  @override
  @JsonKey(name: 'resolved_count')
  int get resolvedCount;
  @override
  @JsonKey(name: 'rating_at_open')
  int get ratingAtOpen;
  @override
  DailyContinuationDto get continuation;

  /// Create a copy of DailyOpenDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyOpenDtoImplCopyWith<_$DailyOpenDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyAssignmentAnswerDto _$DailyAssignmentAnswerDtoFromJson(
    Map<String, dynamic> json) {
  return _DailyAssignmentAnswerDto.fromJson(json);
}

/// @nodoc
mixin _$DailyAssignmentAnswerDto {
  String get id => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;

  /// Serializes this DailyAssignmentAnswerDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyAssignmentAnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyAssignmentAnswerDtoCopyWith<DailyAssignmentAnswerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyAssignmentAnswerDtoCopyWith<$Res> {
  factory $DailyAssignmentAnswerDtoCopyWith(DailyAssignmentAnswerDto value,
          $Res Function(DailyAssignmentAnswerDto) then) =
      _$DailyAssignmentAnswerDtoCopyWithImpl<$Res, DailyAssignmentAnswerDto>;
  @useResult
  $Res call({String id, String? text});
}

/// @nodoc
class _$DailyAssignmentAnswerDtoCopyWithImpl<$Res,
        $Val extends DailyAssignmentAnswerDto>
    implements $DailyAssignmentAnswerDtoCopyWith<$Res> {
  _$DailyAssignmentAnswerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyAssignmentAnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyAssignmentAnswerDtoImplCopyWith<$Res>
    implements $DailyAssignmentAnswerDtoCopyWith<$Res> {
  factory _$$DailyAssignmentAnswerDtoImplCopyWith(
          _$DailyAssignmentAnswerDtoImpl value,
          $Res Function(_$DailyAssignmentAnswerDtoImpl) then) =
      __$$DailyAssignmentAnswerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? text});
}

/// @nodoc
class __$$DailyAssignmentAnswerDtoImplCopyWithImpl<$Res>
    extends _$DailyAssignmentAnswerDtoCopyWithImpl<$Res,
        _$DailyAssignmentAnswerDtoImpl>
    implements _$$DailyAssignmentAnswerDtoImplCopyWith<$Res> {
  __$$DailyAssignmentAnswerDtoImplCopyWithImpl(
      _$DailyAssignmentAnswerDtoImpl _value,
      $Res Function(_$DailyAssignmentAnswerDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyAssignmentAnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = freezed,
  }) {
    return _then(_$DailyAssignmentAnswerDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyAssignmentAnswerDtoImpl implements _DailyAssignmentAnswerDto {
  const _$DailyAssignmentAnswerDtoImpl({required this.id, this.text});

  factory _$DailyAssignmentAnswerDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyAssignmentAnswerDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String? text;

  @override
  String toString() {
    return 'DailyAssignmentAnswerDto(id: $id, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyAssignmentAnswerDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, text);

  /// Create a copy of DailyAssignmentAnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyAssignmentAnswerDtoImplCopyWith<_$DailyAssignmentAnswerDtoImpl>
      get copyWith => __$$DailyAssignmentAnswerDtoImplCopyWithImpl<
          _$DailyAssignmentAnswerDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyAssignmentAnswerDtoImplToJson(
      this,
    );
  }
}

abstract class _DailyAssignmentAnswerDto implements DailyAssignmentAnswerDto {
  const factory _DailyAssignmentAnswerDto(
      {required final String id,
      final String? text}) = _$DailyAssignmentAnswerDtoImpl;

  factory _DailyAssignmentAnswerDto.fromJson(Map<String, dynamic> json) =
      _$DailyAssignmentAnswerDtoImpl.fromJson;

  @override
  String get id;
  @override
  String? get text;

  /// Create a copy of DailyAssignmentAnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyAssignmentAnswerDtoImplCopyWith<_$DailyAssignmentAnswerDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DailyAssignmentDto _$DailyAssignmentDtoFromJson(Map<String, dynamic> json) {
  return _DailyAssignmentDto.fromJson(json);
}

/// @nodoc
mixin _$DailyAssignmentDto {
  @JsonKey(name: 'assignment_id')
  String get assignmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_id')
  String get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_version_id')
  String get questionVersionId => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  String get kind => throw _privateConstructorUsedError;
  String? get topic => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  List<DailyAssignmentAnswerDto> get answers =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'hint_used')
  bool get hintUsed => throw _privateConstructorUsedError;

  /// Serializes this DailyAssignmentDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyAssignmentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyAssignmentDtoCopyWith<DailyAssignmentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyAssignmentDtoCopyWith<$Res> {
  factory $DailyAssignmentDtoCopyWith(
          DailyAssignmentDto value, $Res Function(DailyAssignmentDto) then) =
      _$DailyAssignmentDtoCopyWithImpl<$Res, DailyAssignmentDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'assignment_id') String assignmentId,
      @JsonKey(name: 'question_id') String questionId,
      @JsonKey(name: 'question_version_id') String questionVersionId,
      int position,
      String kind,
      String? topic,
      String? text,
      List<DailyAssignmentAnswerDto> answers,
      @JsonKey(name: 'hint_used') bool hintUsed});
}

/// @nodoc
class _$DailyAssignmentDtoCopyWithImpl<$Res, $Val extends DailyAssignmentDto>
    implements $DailyAssignmentDtoCopyWith<$Res> {
  _$DailyAssignmentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyAssignmentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignmentId = null,
    Object? questionId = null,
    Object? questionVersionId = null,
    Object? position = null,
    Object? kind = null,
    Object? topic = freezed,
    Object? text = freezed,
    Object? answers = null,
    Object? hintUsed = null,
  }) {
    return _then(_value.copyWith(
      assignmentId: null == assignmentId
          ? _value.assignmentId
          : assignmentId // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      questionVersionId: null == questionVersionId
          ? _value.questionVersionId
          : questionVersionId // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<DailyAssignmentAnswerDto>,
      hintUsed: null == hintUsed
          ? _value.hintUsed
          : hintUsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyAssignmentDtoImplCopyWith<$Res>
    implements $DailyAssignmentDtoCopyWith<$Res> {
  factory _$$DailyAssignmentDtoImplCopyWith(_$DailyAssignmentDtoImpl value,
          $Res Function(_$DailyAssignmentDtoImpl) then) =
      __$$DailyAssignmentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'assignment_id') String assignmentId,
      @JsonKey(name: 'question_id') String questionId,
      @JsonKey(name: 'question_version_id') String questionVersionId,
      int position,
      String kind,
      String? topic,
      String? text,
      List<DailyAssignmentAnswerDto> answers,
      @JsonKey(name: 'hint_used') bool hintUsed});
}

/// @nodoc
class __$$DailyAssignmentDtoImplCopyWithImpl<$Res>
    extends _$DailyAssignmentDtoCopyWithImpl<$Res, _$DailyAssignmentDtoImpl>
    implements _$$DailyAssignmentDtoImplCopyWith<$Res> {
  __$$DailyAssignmentDtoImplCopyWithImpl(_$DailyAssignmentDtoImpl _value,
      $Res Function(_$DailyAssignmentDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyAssignmentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignmentId = null,
    Object? questionId = null,
    Object? questionVersionId = null,
    Object? position = null,
    Object? kind = null,
    Object? topic = freezed,
    Object? text = freezed,
    Object? answers = null,
    Object? hintUsed = null,
  }) {
    return _then(_$DailyAssignmentDtoImpl(
      assignmentId: null == assignmentId
          ? _value.assignmentId
          : assignmentId // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      questionVersionId: null == questionVersionId
          ? _value.questionVersionId
          : questionVersionId // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<DailyAssignmentAnswerDto>,
      hintUsed: null == hintUsed
          ? _value.hintUsed
          : hintUsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyAssignmentDtoImpl implements _DailyAssignmentDto {
  const _$DailyAssignmentDtoImpl(
      {@JsonKey(name: 'assignment_id') required this.assignmentId,
      @JsonKey(name: 'question_id') required this.questionId,
      @JsonKey(name: 'question_version_id') required this.questionVersionId,
      required this.position,
      required this.kind,
      this.topic,
      this.text,
      required final List<DailyAssignmentAnswerDto> answers,
      @JsonKey(name: 'hint_used') required this.hintUsed})
      : _answers = answers;

  factory _$DailyAssignmentDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyAssignmentDtoImplFromJson(json);

  @override
  @JsonKey(name: 'assignment_id')
  final String assignmentId;
  @override
  @JsonKey(name: 'question_id')
  final String questionId;
  @override
  @JsonKey(name: 'question_version_id')
  final String questionVersionId;
  @override
  final int position;
  @override
  final String kind;
  @override
  final String? topic;
  @override
  final String? text;
  final List<DailyAssignmentAnswerDto> _answers;
  @override
  List<DailyAssignmentAnswerDto> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  @JsonKey(name: 'hint_used')
  final bool hintUsed;

  @override
  String toString() {
    return 'DailyAssignmentDto(assignmentId: $assignmentId, questionId: $questionId, questionVersionId: $questionVersionId, position: $position, kind: $kind, topic: $topic, text: $text, answers: $answers, hintUsed: $hintUsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyAssignmentDtoImpl &&
            (identical(other.assignmentId, assignmentId) ||
                other.assignmentId == assignmentId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.questionVersionId, questionVersionId) ||
                other.questionVersionId == questionVersionId) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.hintUsed, hintUsed) ||
                other.hintUsed == hintUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      assignmentId,
      questionId,
      questionVersionId,
      position,
      kind,
      topic,
      text,
      const DeepCollectionEquality().hash(_answers),
      hintUsed);

  /// Create a copy of DailyAssignmentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyAssignmentDtoImplCopyWith<_$DailyAssignmentDtoImpl> get copyWith =>
      __$$DailyAssignmentDtoImplCopyWithImpl<_$DailyAssignmentDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyAssignmentDtoImplToJson(
      this,
    );
  }
}

abstract class _DailyAssignmentDto implements DailyAssignmentDto {
  const factory _DailyAssignmentDto(
          {@JsonKey(name: 'assignment_id') required final String assignmentId,
          @JsonKey(name: 'question_id') required final String questionId,
          @JsonKey(name: 'question_version_id')
          required final String questionVersionId,
          required final int position,
          required final String kind,
          final String? topic,
          final String? text,
          required final List<DailyAssignmentAnswerDto> answers,
          @JsonKey(name: 'hint_used') required final bool hintUsed}) =
      _$DailyAssignmentDtoImpl;

  factory _DailyAssignmentDto.fromJson(Map<String, dynamic> json) =
      _$DailyAssignmentDtoImpl.fromJson;

  @override
  @JsonKey(name: 'assignment_id')
  String get assignmentId;
  @override
  @JsonKey(name: 'question_id')
  String get questionId;
  @override
  @JsonKey(name: 'question_version_id')
  String get questionVersionId;
  @override
  int get position;
  @override
  String get kind;
  @override
  String? get topic;
  @override
  String? get text;
  @override
  List<DailyAssignmentAnswerDto> get answers;
  @override
  @JsonKey(name: 'hint_used')
  bool get hintUsed;

  /// Create a copy of DailyAssignmentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyAssignmentDtoImplCopyWith<_$DailyAssignmentDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PartnerRecommendationDto _$PartnerRecommendationDtoFromJson(
    Map<String, dynamic> json) {
  return _PartnerRecommendationDto.fromJson(json);
}

/// @nodoc
mixin _$PartnerRecommendationDto {
  @JsonKey(name: 'campaign_id')
  String get campaignId => throw _privateConstructorUsedError;
  String get disclosure => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get cta => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this PartnerRecommendationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PartnerRecommendationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PartnerRecommendationDtoCopyWith<PartnerRecommendationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartnerRecommendationDtoCopyWith<$Res> {
  factory $PartnerRecommendationDtoCopyWith(PartnerRecommendationDto value,
          $Res Function(PartnerRecommendationDto) then) =
      _$PartnerRecommendationDtoCopyWithImpl<$Res, PartnerRecommendationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'campaign_id') String campaignId,
      String disclosure,
      String title,
      String body,
      String cta,
      String url});
}

/// @nodoc
class _$PartnerRecommendationDtoCopyWithImpl<$Res,
        $Val extends PartnerRecommendationDto>
    implements $PartnerRecommendationDtoCopyWith<$Res> {
  _$PartnerRecommendationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PartnerRecommendationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? campaignId = null,
    Object? disclosure = null,
    Object? title = null,
    Object? body = null,
    Object? cta = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      campaignId: null == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String,
      disclosure: null == disclosure
          ? _value.disclosure
          : disclosure // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      cta: null == cta
          ? _value.cta
          : cta // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartnerRecommendationDtoImplCopyWith<$Res>
    implements $PartnerRecommendationDtoCopyWith<$Res> {
  factory _$$PartnerRecommendationDtoImplCopyWith(
          _$PartnerRecommendationDtoImpl value,
          $Res Function(_$PartnerRecommendationDtoImpl) then) =
      __$$PartnerRecommendationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'campaign_id') String campaignId,
      String disclosure,
      String title,
      String body,
      String cta,
      String url});
}

/// @nodoc
class __$$PartnerRecommendationDtoImplCopyWithImpl<$Res>
    extends _$PartnerRecommendationDtoCopyWithImpl<$Res,
        _$PartnerRecommendationDtoImpl>
    implements _$$PartnerRecommendationDtoImplCopyWith<$Res> {
  __$$PartnerRecommendationDtoImplCopyWithImpl(
      _$PartnerRecommendationDtoImpl _value,
      $Res Function(_$PartnerRecommendationDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PartnerRecommendationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? campaignId = null,
    Object? disclosure = null,
    Object? title = null,
    Object? body = null,
    Object? cta = null,
    Object? url = null,
  }) {
    return _then(_$PartnerRecommendationDtoImpl(
      campaignId: null == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String,
      disclosure: null == disclosure
          ? _value.disclosure
          : disclosure // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      cta: null == cta
          ? _value.cta
          : cta // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartnerRecommendationDtoImpl implements _PartnerRecommendationDto {
  const _$PartnerRecommendationDtoImpl(
      {@JsonKey(name: 'campaign_id') required this.campaignId,
      required this.disclosure,
      required this.title,
      required this.body,
      required this.cta,
      required this.url});

  factory _$PartnerRecommendationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartnerRecommendationDtoImplFromJson(json);

  @override
  @JsonKey(name: 'campaign_id')
  final String campaignId;
  @override
  final String disclosure;
  @override
  final String title;
  @override
  final String body;
  @override
  final String cta;
  @override
  final String url;

  @override
  String toString() {
    return 'PartnerRecommendationDto(campaignId: $campaignId, disclosure: $disclosure, title: $title, body: $body, cta: $cta, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartnerRecommendationDtoImpl &&
            (identical(other.campaignId, campaignId) ||
                other.campaignId == campaignId) &&
            (identical(other.disclosure, disclosure) ||
                other.disclosure == disclosure) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.cta, cta) || other.cta == cta) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, campaignId, disclosure, title, body, cta, url);

  /// Create a copy of PartnerRecommendationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PartnerRecommendationDtoImplCopyWith<_$PartnerRecommendationDtoImpl>
      get copyWith => __$$PartnerRecommendationDtoImplCopyWithImpl<
          _$PartnerRecommendationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartnerRecommendationDtoImplToJson(
      this,
    );
  }
}

abstract class _PartnerRecommendationDto implements PartnerRecommendationDto {
  const factory _PartnerRecommendationDto(
      {@JsonKey(name: 'campaign_id') required final String campaignId,
      required final String disclosure,
      required final String title,
      required final String body,
      required final String cta,
      required final String url}) = _$PartnerRecommendationDtoImpl;

  factory _PartnerRecommendationDto.fromJson(Map<String, dynamic> json) =
      _$PartnerRecommendationDtoImpl.fromJson;

  @override
  @JsonKey(name: 'campaign_id')
  String get campaignId;
  @override
  String get disclosure;
  @override
  String get title;
  @override
  String get body;
  @override
  String get cta;
  @override
  String get url;

  /// Create a copy of PartnerRecommendationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PartnerRecommendationDtoImplCopyWith<_$PartnerRecommendationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DailyAttemptDto _$DailyAttemptDtoFromJson(Map<String, dynamic> json) {
  return _DailyAttemptDto.fromJson(json);
}

/// @nodoc
mixin _$DailyAttemptDto {
  @JsonKey(name: 'client_event_id')
  String get clientEventId => throw _privateConstructorUsedError;
  @JsonKey(name: 'attempt_id')
  String get attemptId => throw _privateConstructorUsedError;
  @JsonKey(name: 'assignment_id')
  String get assignmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_version_id')
  String get questionVersionId => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  bool get correct => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_id')
  String? get answerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_answer_id')
  String? get correctAnswerId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'hint_used')
  bool get hintUsed => throw _privateConstructorUsedError;
  @JsonKey(name: 'xp_awarded')
  int get xpAwarded => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating_before')
  int? get ratingBefore => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating_after')
  int? get ratingAfter => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating_delta')
  int? get ratingDelta => throw _privateConstructorUsedError;
  bool get provisional => throw _privateConstructorUsedError;
  @JsonKey(name: 'run_completed')
  bool get runCompleted => throw _privateConstructorUsedError;
  PartnerRecommendationDto? get partner => throw _privateConstructorUsedError;

  /// Serializes this DailyAttemptDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyAttemptDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyAttemptDtoCopyWith<DailyAttemptDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyAttemptDtoCopyWith<$Res> {
  factory $DailyAttemptDtoCopyWith(
          DailyAttemptDto value, $Res Function(DailyAttemptDto) then) =
      _$DailyAttemptDtoCopyWithImpl<$Res, DailyAttemptDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'client_event_id') String clientEventId,
      @JsonKey(name: 'attempt_id') String attemptId,
      @JsonKey(name: 'assignment_id') String assignmentId,
      @JsonKey(name: 'question_version_id') String questionVersionId,
      String action,
      bool correct,
      @JsonKey(name: 'answer_id') String? answerId,
      @JsonKey(name: 'correct_answer_id') String? correctAnswerId,
      String? description,
      @JsonKey(name: 'hint_used') bool hintUsed,
      @JsonKey(name: 'xp_awarded') int xpAwarded,
      @JsonKey(name: 'rating_before') int? ratingBefore,
      @JsonKey(name: 'rating_after') int? ratingAfter,
      @JsonKey(name: 'rating_delta') int? ratingDelta,
      bool provisional,
      @JsonKey(name: 'run_completed') bool runCompleted,
      PartnerRecommendationDto? partner});

  $PartnerRecommendationDtoCopyWith<$Res>? get partner;
}

/// @nodoc
class _$DailyAttemptDtoCopyWithImpl<$Res, $Val extends DailyAttemptDto>
    implements $DailyAttemptDtoCopyWith<$Res> {
  _$DailyAttemptDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyAttemptDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientEventId = null,
    Object? attemptId = null,
    Object? assignmentId = null,
    Object? questionVersionId = null,
    Object? action = null,
    Object? correct = null,
    Object? answerId = freezed,
    Object? correctAnswerId = freezed,
    Object? description = freezed,
    Object? hintUsed = null,
    Object? xpAwarded = null,
    Object? ratingBefore = freezed,
    Object? ratingAfter = freezed,
    Object? ratingDelta = freezed,
    Object? provisional = null,
    Object? runCompleted = null,
    Object? partner = freezed,
  }) {
    return _then(_value.copyWith(
      clientEventId: null == clientEventId
          ? _value.clientEventId
          : clientEventId // ignore: cast_nullable_to_non_nullable
              as String,
      attemptId: null == attemptId
          ? _value.attemptId
          : attemptId // ignore: cast_nullable_to_non_nullable
              as String,
      assignmentId: null == assignmentId
          ? _value.assignmentId
          : assignmentId // ignore: cast_nullable_to_non_nullable
              as String,
      questionVersionId: null == questionVersionId
          ? _value.questionVersionId
          : questionVersionId // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      correct: null == correct
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as bool,
      answerId: freezed == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String?,
      correctAnswerId: freezed == correctAnswerId
          ? _value.correctAnswerId
          : correctAnswerId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      hintUsed: null == hintUsed
          ? _value.hintUsed
          : hintUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      xpAwarded: null == xpAwarded
          ? _value.xpAwarded
          : xpAwarded // ignore: cast_nullable_to_non_nullable
              as int,
      ratingBefore: freezed == ratingBefore
          ? _value.ratingBefore
          : ratingBefore // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingAfter: freezed == ratingAfter
          ? _value.ratingAfter
          : ratingAfter // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingDelta: freezed == ratingDelta
          ? _value.ratingDelta
          : ratingDelta // ignore: cast_nullable_to_non_nullable
              as int?,
      provisional: null == provisional
          ? _value.provisional
          : provisional // ignore: cast_nullable_to_non_nullable
              as bool,
      runCompleted: null == runCompleted
          ? _value.runCompleted
          : runCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      partner: freezed == partner
          ? _value.partner
          : partner // ignore: cast_nullable_to_non_nullable
              as PartnerRecommendationDto?,
    ) as $Val);
  }

  /// Create a copy of DailyAttemptDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PartnerRecommendationDtoCopyWith<$Res>? get partner {
    if (_value.partner == null) {
      return null;
    }

    return $PartnerRecommendationDtoCopyWith<$Res>(_value.partner!, (value) {
      return _then(_value.copyWith(partner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DailyAttemptDtoImplCopyWith<$Res>
    implements $DailyAttemptDtoCopyWith<$Res> {
  factory _$$DailyAttemptDtoImplCopyWith(_$DailyAttemptDtoImpl value,
          $Res Function(_$DailyAttemptDtoImpl) then) =
      __$$DailyAttemptDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'client_event_id') String clientEventId,
      @JsonKey(name: 'attempt_id') String attemptId,
      @JsonKey(name: 'assignment_id') String assignmentId,
      @JsonKey(name: 'question_version_id') String questionVersionId,
      String action,
      bool correct,
      @JsonKey(name: 'answer_id') String? answerId,
      @JsonKey(name: 'correct_answer_id') String? correctAnswerId,
      String? description,
      @JsonKey(name: 'hint_used') bool hintUsed,
      @JsonKey(name: 'xp_awarded') int xpAwarded,
      @JsonKey(name: 'rating_before') int? ratingBefore,
      @JsonKey(name: 'rating_after') int? ratingAfter,
      @JsonKey(name: 'rating_delta') int? ratingDelta,
      bool provisional,
      @JsonKey(name: 'run_completed') bool runCompleted,
      PartnerRecommendationDto? partner});

  @override
  $PartnerRecommendationDtoCopyWith<$Res>? get partner;
}

/// @nodoc
class __$$DailyAttemptDtoImplCopyWithImpl<$Res>
    extends _$DailyAttemptDtoCopyWithImpl<$Res, _$DailyAttemptDtoImpl>
    implements _$$DailyAttemptDtoImplCopyWith<$Res> {
  __$$DailyAttemptDtoImplCopyWithImpl(
      _$DailyAttemptDtoImpl _value, $Res Function(_$DailyAttemptDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyAttemptDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientEventId = null,
    Object? attemptId = null,
    Object? assignmentId = null,
    Object? questionVersionId = null,
    Object? action = null,
    Object? correct = null,
    Object? answerId = freezed,
    Object? correctAnswerId = freezed,
    Object? description = freezed,
    Object? hintUsed = null,
    Object? xpAwarded = null,
    Object? ratingBefore = freezed,
    Object? ratingAfter = freezed,
    Object? ratingDelta = freezed,
    Object? provisional = null,
    Object? runCompleted = null,
    Object? partner = freezed,
  }) {
    return _then(_$DailyAttemptDtoImpl(
      clientEventId: null == clientEventId
          ? _value.clientEventId
          : clientEventId // ignore: cast_nullable_to_non_nullable
              as String,
      attemptId: null == attemptId
          ? _value.attemptId
          : attemptId // ignore: cast_nullable_to_non_nullable
              as String,
      assignmentId: null == assignmentId
          ? _value.assignmentId
          : assignmentId // ignore: cast_nullable_to_non_nullable
              as String,
      questionVersionId: null == questionVersionId
          ? _value.questionVersionId
          : questionVersionId // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      correct: null == correct
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as bool,
      answerId: freezed == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String?,
      correctAnswerId: freezed == correctAnswerId
          ? _value.correctAnswerId
          : correctAnswerId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      hintUsed: null == hintUsed
          ? _value.hintUsed
          : hintUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      xpAwarded: null == xpAwarded
          ? _value.xpAwarded
          : xpAwarded // ignore: cast_nullable_to_non_nullable
              as int,
      ratingBefore: freezed == ratingBefore
          ? _value.ratingBefore
          : ratingBefore // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingAfter: freezed == ratingAfter
          ? _value.ratingAfter
          : ratingAfter // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingDelta: freezed == ratingDelta
          ? _value.ratingDelta
          : ratingDelta // ignore: cast_nullable_to_non_nullable
              as int?,
      provisional: null == provisional
          ? _value.provisional
          : provisional // ignore: cast_nullable_to_non_nullable
              as bool,
      runCompleted: null == runCompleted
          ? _value.runCompleted
          : runCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      partner: freezed == partner
          ? _value.partner
          : partner // ignore: cast_nullable_to_non_nullable
              as PartnerRecommendationDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyAttemptDtoImpl implements _DailyAttemptDto {
  const _$DailyAttemptDtoImpl(
      {@JsonKey(name: 'client_event_id') required this.clientEventId,
      @JsonKey(name: 'attempt_id') required this.attemptId,
      @JsonKey(name: 'assignment_id') required this.assignmentId,
      @JsonKey(name: 'question_version_id') required this.questionVersionId,
      required this.action,
      required this.correct,
      @JsonKey(name: 'answer_id') this.answerId,
      @JsonKey(name: 'correct_answer_id') this.correctAnswerId,
      this.description,
      @JsonKey(name: 'hint_used') required this.hintUsed,
      @JsonKey(name: 'xp_awarded') required this.xpAwarded,
      @JsonKey(name: 'rating_before') this.ratingBefore,
      @JsonKey(name: 'rating_after') this.ratingAfter,
      @JsonKey(name: 'rating_delta') this.ratingDelta,
      required this.provisional,
      @JsonKey(name: 'run_completed') required this.runCompleted,
      this.partner});

  factory _$DailyAttemptDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyAttemptDtoImplFromJson(json);

  @override
  @JsonKey(name: 'client_event_id')
  final String clientEventId;
  @override
  @JsonKey(name: 'attempt_id')
  final String attemptId;
  @override
  @JsonKey(name: 'assignment_id')
  final String assignmentId;
  @override
  @JsonKey(name: 'question_version_id')
  final String questionVersionId;
  @override
  final String action;
  @override
  final bool correct;
  @override
  @JsonKey(name: 'answer_id')
  final String? answerId;
  @override
  @JsonKey(name: 'correct_answer_id')
  final String? correctAnswerId;
  @override
  final String? description;
  @override
  @JsonKey(name: 'hint_used')
  final bool hintUsed;
  @override
  @JsonKey(name: 'xp_awarded')
  final int xpAwarded;
  @override
  @JsonKey(name: 'rating_before')
  final int? ratingBefore;
  @override
  @JsonKey(name: 'rating_after')
  final int? ratingAfter;
  @override
  @JsonKey(name: 'rating_delta')
  final int? ratingDelta;
  @override
  final bool provisional;
  @override
  @JsonKey(name: 'run_completed')
  final bool runCompleted;
  @override
  final PartnerRecommendationDto? partner;

  @override
  String toString() {
    return 'DailyAttemptDto(clientEventId: $clientEventId, attemptId: $attemptId, assignmentId: $assignmentId, questionVersionId: $questionVersionId, action: $action, correct: $correct, answerId: $answerId, correctAnswerId: $correctAnswerId, description: $description, hintUsed: $hintUsed, xpAwarded: $xpAwarded, ratingBefore: $ratingBefore, ratingAfter: $ratingAfter, ratingDelta: $ratingDelta, provisional: $provisional, runCompleted: $runCompleted, partner: $partner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyAttemptDtoImpl &&
            (identical(other.clientEventId, clientEventId) ||
                other.clientEventId == clientEventId) &&
            (identical(other.attemptId, attemptId) ||
                other.attemptId == attemptId) &&
            (identical(other.assignmentId, assignmentId) ||
                other.assignmentId == assignmentId) &&
            (identical(other.questionVersionId, questionVersionId) ||
                other.questionVersionId == questionVersionId) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.correct, correct) || other.correct == correct) &&
            (identical(other.answerId, answerId) ||
                other.answerId == answerId) &&
            (identical(other.correctAnswerId, correctAnswerId) ||
                other.correctAnswerId == correctAnswerId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.hintUsed, hintUsed) ||
                other.hintUsed == hintUsed) &&
            (identical(other.xpAwarded, xpAwarded) ||
                other.xpAwarded == xpAwarded) &&
            (identical(other.ratingBefore, ratingBefore) ||
                other.ratingBefore == ratingBefore) &&
            (identical(other.ratingAfter, ratingAfter) ||
                other.ratingAfter == ratingAfter) &&
            (identical(other.ratingDelta, ratingDelta) ||
                other.ratingDelta == ratingDelta) &&
            (identical(other.provisional, provisional) ||
                other.provisional == provisional) &&
            (identical(other.runCompleted, runCompleted) ||
                other.runCompleted == runCompleted) &&
            (identical(other.partner, partner) || other.partner == partner));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clientEventId,
      attemptId,
      assignmentId,
      questionVersionId,
      action,
      correct,
      answerId,
      correctAnswerId,
      description,
      hintUsed,
      xpAwarded,
      ratingBefore,
      ratingAfter,
      ratingDelta,
      provisional,
      runCompleted,
      partner);

  /// Create a copy of DailyAttemptDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyAttemptDtoImplCopyWith<_$DailyAttemptDtoImpl> get copyWith =>
      __$$DailyAttemptDtoImplCopyWithImpl<_$DailyAttemptDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyAttemptDtoImplToJson(
      this,
    );
  }
}

abstract class _DailyAttemptDto implements DailyAttemptDto {
  const factory _DailyAttemptDto(
      {@JsonKey(name: 'client_event_id') required final String clientEventId,
      @JsonKey(name: 'attempt_id') required final String attemptId,
      @JsonKey(name: 'assignment_id') required final String assignmentId,
      @JsonKey(name: 'question_version_id')
      required final String questionVersionId,
      required final String action,
      required final bool correct,
      @JsonKey(name: 'answer_id') final String? answerId,
      @JsonKey(name: 'correct_answer_id') final String? correctAnswerId,
      final String? description,
      @JsonKey(name: 'hint_used') required final bool hintUsed,
      @JsonKey(name: 'xp_awarded') required final int xpAwarded,
      @JsonKey(name: 'rating_before') final int? ratingBefore,
      @JsonKey(name: 'rating_after') final int? ratingAfter,
      @JsonKey(name: 'rating_delta') final int? ratingDelta,
      required final bool provisional,
      @JsonKey(name: 'run_completed') required final bool runCompleted,
      final PartnerRecommendationDto? partner}) = _$DailyAttemptDtoImpl;

  factory _DailyAttemptDto.fromJson(Map<String, dynamic> json) =
      _$DailyAttemptDtoImpl.fromJson;

  @override
  @JsonKey(name: 'client_event_id')
  String get clientEventId;
  @override
  @JsonKey(name: 'attempt_id')
  String get attemptId;
  @override
  @JsonKey(name: 'assignment_id')
  String get assignmentId;
  @override
  @JsonKey(name: 'question_version_id')
  String get questionVersionId;
  @override
  String get action;
  @override
  bool get correct;
  @override
  @JsonKey(name: 'answer_id')
  String? get answerId;
  @override
  @JsonKey(name: 'correct_answer_id')
  String? get correctAnswerId;
  @override
  String? get description;
  @override
  @JsonKey(name: 'hint_used')
  bool get hintUsed;
  @override
  @JsonKey(name: 'xp_awarded')
  int get xpAwarded;
  @override
  @JsonKey(name: 'rating_before')
  int? get ratingBefore;
  @override
  @JsonKey(name: 'rating_after')
  int? get ratingAfter;
  @override
  @JsonKey(name: 'rating_delta')
  int? get ratingDelta;
  @override
  bool get provisional;
  @override
  @JsonKey(name: 'run_completed')
  bool get runCompleted;
  @override
  PartnerRecommendationDto? get partner;

  /// Create a copy of DailyAttemptDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyAttemptDtoImplCopyWith<_$DailyAttemptDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyAttemptRequestDto _$DailyAttemptRequestDtoFromJson(
    Map<String, dynamic> json) {
  return _DailyAttemptRequestDto.fromJson(json);
}

/// @nodoc
mixin _$DailyAttemptRequestDto {
  @JsonKey(name: 'client_event_id')
  String get clientEventId => throw _privateConstructorUsedError;
  @JsonKey(name: 'assignment_id')
  String get assignmentId => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_id', includeIfNull: false)
  String? get answerId => throw _privateConstructorUsedError;

  /// Serializes this DailyAttemptRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyAttemptRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyAttemptRequestDtoCopyWith<DailyAttemptRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyAttemptRequestDtoCopyWith<$Res> {
  factory $DailyAttemptRequestDtoCopyWith(DailyAttemptRequestDto value,
          $Res Function(DailyAttemptRequestDto) then) =
      _$DailyAttemptRequestDtoCopyWithImpl<$Res, DailyAttemptRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'client_event_id') String clientEventId,
      @JsonKey(name: 'assignment_id') String assignmentId,
      String action,
      @JsonKey(name: 'answer_id', includeIfNull: false) String? answerId});
}

/// @nodoc
class _$DailyAttemptRequestDtoCopyWithImpl<$Res,
        $Val extends DailyAttemptRequestDto>
    implements $DailyAttemptRequestDtoCopyWith<$Res> {
  _$DailyAttemptRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyAttemptRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientEventId = null,
    Object? assignmentId = null,
    Object? action = null,
    Object? answerId = freezed,
  }) {
    return _then(_value.copyWith(
      clientEventId: null == clientEventId
          ? _value.clientEventId
          : clientEventId // ignore: cast_nullable_to_non_nullable
              as String,
      assignmentId: null == assignmentId
          ? _value.assignmentId
          : assignmentId // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      answerId: freezed == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyAttemptRequestDtoImplCopyWith<$Res>
    implements $DailyAttemptRequestDtoCopyWith<$Res> {
  factory _$$DailyAttemptRequestDtoImplCopyWith(
          _$DailyAttemptRequestDtoImpl value,
          $Res Function(_$DailyAttemptRequestDtoImpl) then) =
      __$$DailyAttemptRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'client_event_id') String clientEventId,
      @JsonKey(name: 'assignment_id') String assignmentId,
      String action,
      @JsonKey(name: 'answer_id', includeIfNull: false) String? answerId});
}

/// @nodoc
class __$$DailyAttemptRequestDtoImplCopyWithImpl<$Res>
    extends _$DailyAttemptRequestDtoCopyWithImpl<$Res,
        _$DailyAttemptRequestDtoImpl>
    implements _$$DailyAttemptRequestDtoImplCopyWith<$Res> {
  __$$DailyAttemptRequestDtoImplCopyWithImpl(
      _$DailyAttemptRequestDtoImpl _value,
      $Res Function(_$DailyAttemptRequestDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyAttemptRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientEventId = null,
    Object? assignmentId = null,
    Object? action = null,
    Object? answerId = freezed,
  }) {
    return _then(_$DailyAttemptRequestDtoImpl(
      clientEventId: null == clientEventId
          ? _value.clientEventId
          : clientEventId // ignore: cast_nullable_to_non_nullable
              as String,
      assignmentId: null == assignmentId
          ? _value.assignmentId
          : assignmentId // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      answerId: freezed == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyAttemptRequestDtoImpl implements _DailyAttemptRequestDto {
  const _$DailyAttemptRequestDtoImpl(
      {@JsonKey(name: 'client_event_id') required this.clientEventId,
      @JsonKey(name: 'assignment_id') required this.assignmentId,
      required this.action,
      @JsonKey(name: 'answer_id', includeIfNull: false) this.answerId});

  factory _$DailyAttemptRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyAttemptRequestDtoImplFromJson(json);

  @override
  @JsonKey(name: 'client_event_id')
  final String clientEventId;
  @override
  @JsonKey(name: 'assignment_id')
  final String assignmentId;
  @override
  final String action;
  @override
  @JsonKey(name: 'answer_id', includeIfNull: false)
  final String? answerId;

  @override
  String toString() {
    return 'DailyAttemptRequestDto(clientEventId: $clientEventId, assignmentId: $assignmentId, action: $action, answerId: $answerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyAttemptRequestDtoImpl &&
            (identical(other.clientEventId, clientEventId) ||
                other.clientEventId == clientEventId) &&
            (identical(other.assignmentId, assignmentId) ||
                other.assignmentId == assignmentId) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.answerId, answerId) ||
                other.answerId == answerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clientEventId, assignmentId, action, answerId);

  /// Create a copy of DailyAttemptRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyAttemptRequestDtoImplCopyWith<_$DailyAttemptRequestDtoImpl>
      get copyWith => __$$DailyAttemptRequestDtoImplCopyWithImpl<
          _$DailyAttemptRequestDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyAttemptRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _DailyAttemptRequestDto implements DailyAttemptRequestDto {
  const factory _DailyAttemptRequestDto(
      {@JsonKey(name: 'client_event_id') required final String clientEventId,
      @JsonKey(name: 'assignment_id') required final String assignmentId,
      required final String action,
      @JsonKey(name: 'answer_id', includeIfNull: false)
      final String? answerId}) = _$DailyAttemptRequestDtoImpl;

  factory _DailyAttemptRequestDto.fromJson(Map<String, dynamic> json) =
      _$DailyAttemptRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'client_event_id')
  String get clientEventId;
  @override
  @JsonKey(name: 'assignment_id')
  String get assignmentId;
  @override
  String get action;
  @override
  @JsonKey(name: 'answer_id', includeIfNull: false)
  String? get answerId;

  /// Create a copy of DailyAttemptRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyAttemptRequestDtoImplCopyWith<_$DailyAttemptRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DailyHintDto _$DailyHintDtoFromJson(Map<String, dynamic> json) {
  return _DailyHintDto.fromJson(json);
}

/// @nodoc
mixin _$DailyHintDto {
  @JsonKey(name: 'assignment_id')
  String get assignmentId => throw _privateConstructorUsedError;
  String? get hint => throw _privateConstructorUsedError;

  /// Serializes this DailyHintDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyHintDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyHintDtoCopyWith<DailyHintDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyHintDtoCopyWith<$Res> {
  factory $DailyHintDtoCopyWith(
          DailyHintDto value, $Res Function(DailyHintDto) then) =
      _$DailyHintDtoCopyWithImpl<$Res, DailyHintDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'assignment_id') String assignmentId, String? hint});
}

/// @nodoc
class _$DailyHintDtoCopyWithImpl<$Res, $Val extends DailyHintDto>
    implements $DailyHintDtoCopyWith<$Res> {
  _$DailyHintDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyHintDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignmentId = null,
    Object? hint = freezed,
  }) {
    return _then(_value.copyWith(
      assignmentId: null == assignmentId
          ? _value.assignmentId
          : assignmentId // ignore: cast_nullable_to_non_nullable
              as String,
      hint: freezed == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyHintDtoImplCopyWith<$Res>
    implements $DailyHintDtoCopyWith<$Res> {
  factory _$$DailyHintDtoImplCopyWith(
          _$DailyHintDtoImpl value, $Res Function(_$DailyHintDtoImpl) then) =
      __$$DailyHintDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'assignment_id') String assignmentId, String? hint});
}

/// @nodoc
class __$$DailyHintDtoImplCopyWithImpl<$Res>
    extends _$DailyHintDtoCopyWithImpl<$Res, _$DailyHintDtoImpl>
    implements _$$DailyHintDtoImplCopyWith<$Res> {
  __$$DailyHintDtoImplCopyWithImpl(
      _$DailyHintDtoImpl _value, $Res Function(_$DailyHintDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyHintDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignmentId = null,
    Object? hint = freezed,
  }) {
    return _then(_$DailyHintDtoImpl(
      assignmentId: null == assignmentId
          ? _value.assignmentId
          : assignmentId // ignore: cast_nullable_to_non_nullable
              as String,
      hint: freezed == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyHintDtoImpl implements _DailyHintDto {
  const _$DailyHintDtoImpl(
      {@JsonKey(name: 'assignment_id') required this.assignmentId, this.hint});

  factory _$DailyHintDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyHintDtoImplFromJson(json);

  @override
  @JsonKey(name: 'assignment_id')
  final String assignmentId;
  @override
  final String? hint;

  @override
  String toString() {
    return 'DailyHintDto(assignmentId: $assignmentId, hint: $hint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyHintDtoImpl &&
            (identical(other.assignmentId, assignmentId) ||
                other.assignmentId == assignmentId) &&
            (identical(other.hint, hint) || other.hint == hint));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, assignmentId, hint);

  /// Create a copy of DailyHintDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyHintDtoImplCopyWith<_$DailyHintDtoImpl> get copyWith =>
      __$$DailyHintDtoImplCopyWithImpl<_$DailyHintDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyHintDtoImplToJson(
      this,
    );
  }
}

abstract class _DailyHintDto implements DailyHintDto {
  const factory _DailyHintDto(
      {@JsonKey(name: 'assignment_id') required final String assignmentId,
      final String? hint}) = _$DailyHintDtoImpl;

  factory _DailyHintDto.fromJson(Map<String, dynamic> json) =
      _$DailyHintDtoImpl.fromJson;

  @override
  @JsonKey(name: 'assignment_id')
  String get assignmentId;
  @override
  String? get hint;

  /// Create a copy of DailyHintDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyHintDtoImplCopyWith<_$DailyHintDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailySummaryDto _$DailySummaryDtoFromJson(Map<String, dynamic> json) {
  return _DailySummaryDto.fromJson(json);
}

/// @nodoc
mixin _$DailySummaryDto {
  @JsonKey(name: 'run_id')
  String get runId => throw _privateConstructorUsedError;
  @JsonKey(name: 'edition_date')
  String get editionDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'required_count')
  int get requiredCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'resolved_count')
  int get resolvedCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_count')
  int get correctCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'skipped_count')
  int get skippedCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'hint_count')
  int get hintCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_xp')
  int get answerXp => throw _privateConstructorUsedError;
  @JsonKey(name: 'completion_xp')
  int get completionXp => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_xp')
  int get totalXp => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonus_granted')
  int get bonusGranted => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonus_served')
  int get bonusServed => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating_before')
  int? get ratingBefore => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating_after')
  int? get ratingAfter => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating_delta')
  int? get ratingDelta => throw _privateConstructorUsedError;
  double? get accuracy => throw _privateConstructorUsedError;
  double? get percentile => throw _privateConstructorUsedError;
  @JsonKey(name: 'streak_before')
  int? get streakBefore => throw _privateConstructorUsedError;
  @JsonKey(name: 'streak_after')
  int? get streakAfter => throw _privateConstructorUsedError;
  @JsonKey(name: 'streak_delta')
  int? get streakDelta => throw _privateConstructorUsedError;
  @JsonKey(name: 'season_rank_before')
  int? get seasonRankBefore => throw _privateConstructorUsedError;
  @JsonKey(name: 'season_rank_after')
  int? get seasonRankAfter => throw _privateConstructorUsedError;
  @JsonKey(name: 'season_rank_delta')
  int? get seasonRankDelta => throw _privateConstructorUsedError;
  DailyContinuationDto get continuation => throw _privateConstructorUsedError;

  /// Serializes this DailySummaryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailySummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailySummaryDtoCopyWith<DailySummaryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailySummaryDtoCopyWith<$Res> {
  factory $DailySummaryDtoCopyWith(
          DailySummaryDto value, $Res Function(DailySummaryDto) then) =
      _$DailySummaryDtoCopyWithImpl<$Res, DailySummaryDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'run_id') String runId,
      @JsonKey(name: 'edition_date') String editionDate,
      String status,
      @JsonKey(name: 'required_count') int requiredCount,
      @JsonKey(name: 'resolved_count') int resolvedCount,
      @JsonKey(name: 'correct_count') int correctCount,
      @JsonKey(name: 'skipped_count') int skippedCount,
      @JsonKey(name: 'hint_count') int hintCount,
      @JsonKey(name: 'answer_xp') int answerXp,
      @JsonKey(name: 'completion_xp') int completionXp,
      @JsonKey(name: 'total_xp') int totalXp,
      @JsonKey(name: 'bonus_granted') int bonusGranted,
      @JsonKey(name: 'bonus_served') int bonusServed,
      @JsonKey(name: 'rating_before') int? ratingBefore,
      @JsonKey(name: 'rating_after') int? ratingAfter,
      @JsonKey(name: 'rating_delta') int? ratingDelta,
      double? accuracy,
      double? percentile,
      @JsonKey(name: 'streak_before') int? streakBefore,
      @JsonKey(name: 'streak_after') int? streakAfter,
      @JsonKey(name: 'streak_delta') int? streakDelta,
      @JsonKey(name: 'season_rank_before') int? seasonRankBefore,
      @JsonKey(name: 'season_rank_after') int? seasonRankAfter,
      @JsonKey(name: 'season_rank_delta') int? seasonRankDelta,
      DailyContinuationDto continuation});

  $DailyContinuationDtoCopyWith<$Res> get continuation;
}

/// @nodoc
class _$DailySummaryDtoCopyWithImpl<$Res, $Val extends DailySummaryDto>
    implements $DailySummaryDtoCopyWith<$Res> {
  _$DailySummaryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailySummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runId = null,
    Object? editionDate = null,
    Object? status = null,
    Object? requiredCount = null,
    Object? resolvedCount = null,
    Object? correctCount = null,
    Object? skippedCount = null,
    Object? hintCount = null,
    Object? answerXp = null,
    Object? completionXp = null,
    Object? totalXp = null,
    Object? bonusGranted = null,
    Object? bonusServed = null,
    Object? ratingBefore = freezed,
    Object? ratingAfter = freezed,
    Object? ratingDelta = freezed,
    Object? accuracy = freezed,
    Object? percentile = freezed,
    Object? streakBefore = freezed,
    Object? streakAfter = freezed,
    Object? streakDelta = freezed,
    Object? seasonRankBefore = freezed,
    Object? seasonRankAfter = freezed,
    Object? seasonRankDelta = freezed,
    Object? continuation = null,
  }) {
    return _then(_value.copyWith(
      runId: null == runId
          ? _value.runId
          : runId // ignore: cast_nullable_to_non_nullable
              as String,
      editionDate: null == editionDate
          ? _value.editionDate
          : editionDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      requiredCount: null == requiredCount
          ? _value.requiredCount
          : requiredCount // ignore: cast_nullable_to_non_nullable
              as int,
      resolvedCount: null == resolvedCount
          ? _value.resolvedCount
          : resolvedCount // ignore: cast_nullable_to_non_nullable
              as int,
      correctCount: null == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int,
      skippedCount: null == skippedCount
          ? _value.skippedCount
          : skippedCount // ignore: cast_nullable_to_non_nullable
              as int,
      hintCount: null == hintCount
          ? _value.hintCount
          : hintCount // ignore: cast_nullable_to_non_nullable
              as int,
      answerXp: null == answerXp
          ? _value.answerXp
          : answerXp // ignore: cast_nullable_to_non_nullable
              as int,
      completionXp: null == completionXp
          ? _value.completionXp
          : completionXp // ignore: cast_nullable_to_non_nullable
              as int,
      totalXp: null == totalXp
          ? _value.totalXp
          : totalXp // ignore: cast_nullable_to_non_nullable
              as int,
      bonusGranted: null == bonusGranted
          ? _value.bonusGranted
          : bonusGranted // ignore: cast_nullable_to_non_nullable
              as int,
      bonusServed: null == bonusServed
          ? _value.bonusServed
          : bonusServed // ignore: cast_nullable_to_non_nullable
              as int,
      ratingBefore: freezed == ratingBefore
          ? _value.ratingBefore
          : ratingBefore // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingAfter: freezed == ratingAfter
          ? _value.ratingAfter
          : ratingAfter // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingDelta: freezed == ratingDelta
          ? _value.ratingDelta
          : ratingDelta // ignore: cast_nullable_to_non_nullable
              as int?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      percentile: freezed == percentile
          ? _value.percentile
          : percentile // ignore: cast_nullable_to_non_nullable
              as double?,
      streakBefore: freezed == streakBefore
          ? _value.streakBefore
          : streakBefore // ignore: cast_nullable_to_non_nullable
              as int?,
      streakAfter: freezed == streakAfter
          ? _value.streakAfter
          : streakAfter // ignore: cast_nullable_to_non_nullable
              as int?,
      streakDelta: freezed == streakDelta
          ? _value.streakDelta
          : streakDelta // ignore: cast_nullable_to_non_nullable
              as int?,
      seasonRankBefore: freezed == seasonRankBefore
          ? _value.seasonRankBefore
          : seasonRankBefore // ignore: cast_nullable_to_non_nullable
              as int?,
      seasonRankAfter: freezed == seasonRankAfter
          ? _value.seasonRankAfter
          : seasonRankAfter // ignore: cast_nullable_to_non_nullable
              as int?,
      seasonRankDelta: freezed == seasonRankDelta
          ? _value.seasonRankDelta
          : seasonRankDelta // ignore: cast_nullable_to_non_nullable
              as int?,
      continuation: null == continuation
          ? _value.continuation
          : continuation // ignore: cast_nullable_to_non_nullable
              as DailyContinuationDto,
    ) as $Val);
  }

  /// Create a copy of DailySummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyContinuationDtoCopyWith<$Res> get continuation {
    return $DailyContinuationDtoCopyWith<$Res>(_value.continuation, (value) {
      return _then(_value.copyWith(continuation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DailySummaryDtoImplCopyWith<$Res>
    implements $DailySummaryDtoCopyWith<$Res> {
  factory _$$DailySummaryDtoImplCopyWith(_$DailySummaryDtoImpl value,
          $Res Function(_$DailySummaryDtoImpl) then) =
      __$$DailySummaryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'run_id') String runId,
      @JsonKey(name: 'edition_date') String editionDate,
      String status,
      @JsonKey(name: 'required_count') int requiredCount,
      @JsonKey(name: 'resolved_count') int resolvedCount,
      @JsonKey(name: 'correct_count') int correctCount,
      @JsonKey(name: 'skipped_count') int skippedCount,
      @JsonKey(name: 'hint_count') int hintCount,
      @JsonKey(name: 'answer_xp') int answerXp,
      @JsonKey(name: 'completion_xp') int completionXp,
      @JsonKey(name: 'total_xp') int totalXp,
      @JsonKey(name: 'bonus_granted') int bonusGranted,
      @JsonKey(name: 'bonus_served') int bonusServed,
      @JsonKey(name: 'rating_before') int? ratingBefore,
      @JsonKey(name: 'rating_after') int? ratingAfter,
      @JsonKey(name: 'rating_delta') int? ratingDelta,
      double? accuracy,
      double? percentile,
      @JsonKey(name: 'streak_before') int? streakBefore,
      @JsonKey(name: 'streak_after') int? streakAfter,
      @JsonKey(name: 'streak_delta') int? streakDelta,
      @JsonKey(name: 'season_rank_before') int? seasonRankBefore,
      @JsonKey(name: 'season_rank_after') int? seasonRankAfter,
      @JsonKey(name: 'season_rank_delta') int? seasonRankDelta,
      DailyContinuationDto continuation});

  @override
  $DailyContinuationDtoCopyWith<$Res> get continuation;
}

/// @nodoc
class __$$DailySummaryDtoImplCopyWithImpl<$Res>
    extends _$DailySummaryDtoCopyWithImpl<$Res, _$DailySummaryDtoImpl>
    implements _$$DailySummaryDtoImplCopyWith<$Res> {
  __$$DailySummaryDtoImplCopyWithImpl(
      _$DailySummaryDtoImpl _value, $Res Function(_$DailySummaryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailySummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runId = null,
    Object? editionDate = null,
    Object? status = null,
    Object? requiredCount = null,
    Object? resolvedCount = null,
    Object? correctCount = null,
    Object? skippedCount = null,
    Object? hintCount = null,
    Object? answerXp = null,
    Object? completionXp = null,
    Object? totalXp = null,
    Object? bonusGranted = null,
    Object? bonusServed = null,
    Object? ratingBefore = freezed,
    Object? ratingAfter = freezed,
    Object? ratingDelta = freezed,
    Object? accuracy = freezed,
    Object? percentile = freezed,
    Object? streakBefore = freezed,
    Object? streakAfter = freezed,
    Object? streakDelta = freezed,
    Object? seasonRankBefore = freezed,
    Object? seasonRankAfter = freezed,
    Object? seasonRankDelta = freezed,
    Object? continuation = null,
  }) {
    return _then(_$DailySummaryDtoImpl(
      runId: null == runId
          ? _value.runId
          : runId // ignore: cast_nullable_to_non_nullable
              as String,
      editionDate: null == editionDate
          ? _value.editionDate
          : editionDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      requiredCount: null == requiredCount
          ? _value.requiredCount
          : requiredCount // ignore: cast_nullable_to_non_nullable
              as int,
      resolvedCount: null == resolvedCount
          ? _value.resolvedCount
          : resolvedCount // ignore: cast_nullable_to_non_nullable
              as int,
      correctCount: null == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int,
      skippedCount: null == skippedCount
          ? _value.skippedCount
          : skippedCount // ignore: cast_nullable_to_non_nullable
              as int,
      hintCount: null == hintCount
          ? _value.hintCount
          : hintCount // ignore: cast_nullable_to_non_nullable
              as int,
      answerXp: null == answerXp
          ? _value.answerXp
          : answerXp // ignore: cast_nullable_to_non_nullable
              as int,
      completionXp: null == completionXp
          ? _value.completionXp
          : completionXp // ignore: cast_nullable_to_non_nullable
              as int,
      totalXp: null == totalXp
          ? _value.totalXp
          : totalXp // ignore: cast_nullable_to_non_nullable
              as int,
      bonusGranted: null == bonusGranted
          ? _value.bonusGranted
          : bonusGranted // ignore: cast_nullable_to_non_nullable
              as int,
      bonusServed: null == bonusServed
          ? _value.bonusServed
          : bonusServed // ignore: cast_nullable_to_non_nullable
              as int,
      ratingBefore: freezed == ratingBefore
          ? _value.ratingBefore
          : ratingBefore // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingAfter: freezed == ratingAfter
          ? _value.ratingAfter
          : ratingAfter // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingDelta: freezed == ratingDelta
          ? _value.ratingDelta
          : ratingDelta // ignore: cast_nullable_to_non_nullable
              as int?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      percentile: freezed == percentile
          ? _value.percentile
          : percentile // ignore: cast_nullable_to_non_nullable
              as double?,
      streakBefore: freezed == streakBefore
          ? _value.streakBefore
          : streakBefore // ignore: cast_nullable_to_non_nullable
              as int?,
      streakAfter: freezed == streakAfter
          ? _value.streakAfter
          : streakAfter // ignore: cast_nullable_to_non_nullable
              as int?,
      streakDelta: freezed == streakDelta
          ? _value.streakDelta
          : streakDelta // ignore: cast_nullable_to_non_nullable
              as int?,
      seasonRankBefore: freezed == seasonRankBefore
          ? _value.seasonRankBefore
          : seasonRankBefore // ignore: cast_nullable_to_non_nullable
              as int?,
      seasonRankAfter: freezed == seasonRankAfter
          ? _value.seasonRankAfter
          : seasonRankAfter // ignore: cast_nullable_to_non_nullable
              as int?,
      seasonRankDelta: freezed == seasonRankDelta
          ? _value.seasonRankDelta
          : seasonRankDelta // ignore: cast_nullable_to_non_nullable
              as int?,
      continuation: null == continuation
          ? _value.continuation
          : continuation // ignore: cast_nullable_to_non_nullable
              as DailyContinuationDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailySummaryDtoImpl implements _DailySummaryDto {
  const _$DailySummaryDtoImpl(
      {@JsonKey(name: 'run_id') required this.runId,
      @JsonKey(name: 'edition_date') required this.editionDate,
      required this.status,
      @JsonKey(name: 'required_count') required this.requiredCount,
      @JsonKey(name: 'resolved_count') required this.resolvedCount,
      @JsonKey(name: 'correct_count') required this.correctCount,
      @JsonKey(name: 'skipped_count') required this.skippedCount,
      @JsonKey(name: 'hint_count') required this.hintCount,
      @JsonKey(name: 'answer_xp') required this.answerXp,
      @JsonKey(name: 'completion_xp') required this.completionXp,
      @JsonKey(name: 'total_xp') required this.totalXp,
      @JsonKey(name: 'bonus_granted') required this.bonusGranted,
      @JsonKey(name: 'bonus_served') required this.bonusServed,
      @JsonKey(name: 'rating_before') this.ratingBefore,
      @JsonKey(name: 'rating_after') this.ratingAfter,
      @JsonKey(name: 'rating_delta') this.ratingDelta,
      this.accuracy,
      this.percentile,
      @JsonKey(name: 'streak_before') this.streakBefore,
      @JsonKey(name: 'streak_after') this.streakAfter,
      @JsonKey(name: 'streak_delta') this.streakDelta,
      @JsonKey(name: 'season_rank_before') this.seasonRankBefore,
      @JsonKey(name: 'season_rank_after') this.seasonRankAfter,
      @JsonKey(name: 'season_rank_delta') this.seasonRankDelta,
      required this.continuation});

  factory _$DailySummaryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailySummaryDtoImplFromJson(json);

  @override
  @JsonKey(name: 'run_id')
  final String runId;
  @override
  @JsonKey(name: 'edition_date')
  final String editionDate;
  @override
  final String status;
  @override
  @JsonKey(name: 'required_count')
  final int requiredCount;
  @override
  @JsonKey(name: 'resolved_count')
  final int resolvedCount;
  @override
  @JsonKey(name: 'correct_count')
  final int correctCount;
  @override
  @JsonKey(name: 'skipped_count')
  final int skippedCount;
  @override
  @JsonKey(name: 'hint_count')
  final int hintCount;
  @override
  @JsonKey(name: 'answer_xp')
  final int answerXp;
  @override
  @JsonKey(name: 'completion_xp')
  final int completionXp;
  @override
  @JsonKey(name: 'total_xp')
  final int totalXp;
  @override
  @JsonKey(name: 'bonus_granted')
  final int bonusGranted;
  @override
  @JsonKey(name: 'bonus_served')
  final int bonusServed;
  @override
  @JsonKey(name: 'rating_before')
  final int? ratingBefore;
  @override
  @JsonKey(name: 'rating_after')
  final int? ratingAfter;
  @override
  @JsonKey(name: 'rating_delta')
  final int? ratingDelta;
  @override
  final double? accuracy;
  @override
  final double? percentile;
  @override
  @JsonKey(name: 'streak_before')
  final int? streakBefore;
  @override
  @JsonKey(name: 'streak_after')
  final int? streakAfter;
  @override
  @JsonKey(name: 'streak_delta')
  final int? streakDelta;
  @override
  @JsonKey(name: 'season_rank_before')
  final int? seasonRankBefore;
  @override
  @JsonKey(name: 'season_rank_after')
  final int? seasonRankAfter;
  @override
  @JsonKey(name: 'season_rank_delta')
  final int? seasonRankDelta;
  @override
  final DailyContinuationDto continuation;

  @override
  String toString() {
    return 'DailySummaryDto(runId: $runId, editionDate: $editionDate, status: $status, requiredCount: $requiredCount, resolvedCount: $resolvedCount, correctCount: $correctCount, skippedCount: $skippedCount, hintCount: $hintCount, answerXp: $answerXp, completionXp: $completionXp, totalXp: $totalXp, bonusGranted: $bonusGranted, bonusServed: $bonusServed, ratingBefore: $ratingBefore, ratingAfter: $ratingAfter, ratingDelta: $ratingDelta, accuracy: $accuracy, percentile: $percentile, streakBefore: $streakBefore, streakAfter: $streakAfter, streakDelta: $streakDelta, seasonRankBefore: $seasonRankBefore, seasonRankAfter: $seasonRankAfter, seasonRankDelta: $seasonRankDelta, continuation: $continuation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailySummaryDtoImpl &&
            (identical(other.runId, runId) || other.runId == runId) &&
            (identical(other.editionDate, editionDate) ||
                other.editionDate == editionDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.requiredCount, requiredCount) ||
                other.requiredCount == requiredCount) &&
            (identical(other.resolvedCount, resolvedCount) ||
                other.resolvedCount == resolvedCount) &&
            (identical(other.correctCount, correctCount) ||
                other.correctCount == correctCount) &&
            (identical(other.skippedCount, skippedCount) ||
                other.skippedCount == skippedCount) &&
            (identical(other.hintCount, hintCount) ||
                other.hintCount == hintCount) &&
            (identical(other.answerXp, answerXp) ||
                other.answerXp == answerXp) &&
            (identical(other.completionXp, completionXp) ||
                other.completionXp == completionXp) &&
            (identical(other.totalXp, totalXp) || other.totalXp == totalXp) &&
            (identical(other.bonusGranted, bonusGranted) ||
                other.bonusGranted == bonusGranted) &&
            (identical(other.bonusServed, bonusServed) ||
                other.bonusServed == bonusServed) &&
            (identical(other.ratingBefore, ratingBefore) ||
                other.ratingBefore == ratingBefore) &&
            (identical(other.ratingAfter, ratingAfter) ||
                other.ratingAfter == ratingAfter) &&
            (identical(other.ratingDelta, ratingDelta) ||
                other.ratingDelta == ratingDelta) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.percentile, percentile) ||
                other.percentile == percentile) &&
            (identical(other.streakBefore, streakBefore) ||
                other.streakBefore == streakBefore) &&
            (identical(other.streakAfter, streakAfter) ||
                other.streakAfter == streakAfter) &&
            (identical(other.streakDelta, streakDelta) ||
                other.streakDelta == streakDelta) &&
            (identical(other.seasonRankBefore, seasonRankBefore) ||
                other.seasonRankBefore == seasonRankBefore) &&
            (identical(other.seasonRankAfter, seasonRankAfter) ||
                other.seasonRankAfter == seasonRankAfter) &&
            (identical(other.seasonRankDelta, seasonRankDelta) ||
                other.seasonRankDelta == seasonRankDelta) &&
            (identical(other.continuation, continuation) ||
                other.continuation == continuation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        runId,
        editionDate,
        status,
        requiredCount,
        resolvedCount,
        correctCount,
        skippedCount,
        hintCount,
        answerXp,
        completionXp,
        totalXp,
        bonusGranted,
        bonusServed,
        ratingBefore,
        ratingAfter,
        ratingDelta,
        accuracy,
        percentile,
        streakBefore,
        streakAfter,
        streakDelta,
        seasonRankBefore,
        seasonRankAfter,
        seasonRankDelta,
        continuation
      ]);

  /// Create a copy of DailySummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailySummaryDtoImplCopyWith<_$DailySummaryDtoImpl> get copyWith =>
      __$$DailySummaryDtoImplCopyWithImpl<_$DailySummaryDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailySummaryDtoImplToJson(
      this,
    );
  }
}

abstract class _DailySummaryDto implements DailySummaryDto {
  const factory _DailySummaryDto(
          {@JsonKey(name: 'run_id') required final String runId,
          @JsonKey(name: 'edition_date') required final String editionDate,
          required final String status,
          @JsonKey(name: 'required_count') required final int requiredCount,
          @JsonKey(name: 'resolved_count') required final int resolvedCount,
          @JsonKey(name: 'correct_count') required final int correctCount,
          @JsonKey(name: 'skipped_count') required final int skippedCount,
          @JsonKey(name: 'hint_count') required final int hintCount,
          @JsonKey(name: 'answer_xp') required final int answerXp,
          @JsonKey(name: 'completion_xp') required final int completionXp,
          @JsonKey(name: 'total_xp') required final int totalXp,
          @JsonKey(name: 'bonus_granted') required final int bonusGranted,
          @JsonKey(name: 'bonus_served') required final int bonusServed,
          @JsonKey(name: 'rating_before') final int? ratingBefore,
          @JsonKey(name: 'rating_after') final int? ratingAfter,
          @JsonKey(name: 'rating_delta') final int? ratingDelta,
          final double? accuracy,
          final double? percentile,
          @JsonKey(name: 'streak_before') final int? streakBefore,
          @JsonKey(name: 'streak_after') final int? streakAfter,
          @JsonKey(name: 'streak_delta') final int? streakDelta,
          @JsonKey(name: 'season_rank_before') final int? seasonRankBefore,
          @JsonKey(name: 'season_rank_after') final int? seasonRankAfter,
          @JsonKey(name: 'season_rank_delta') final int? seasonRankDelta,
          required final DailyContinuationDto continuation}) =
      _$DailySummaryDtoImpl;

  factory _DailySummaryDto.fromJson(Map<String, dynamic> json) =
      _$DailySummaryDtoImpl.fromJson;

  @override
  @JsonKey(name: 'run_id')
  String get runId;
  @override
  @JsonKey(name: 'edition_date')
  String get editionDate;
  @override
  String get status;
  @override
  @JsonKey(name: 'required_count')
  int get requiredCount;
  @override
  @JsonKey(name: 'resolved_count')
  int get resolvedCount;
  @override
  @JsonKey(name: 'correct_count')
  int get correctCount;
  @override
  @JsonKey(name: 'skipped_count')
  int get skippedCount;
  @override
  @JsonKey(name: 'hint_count')
  int get hintCount;
  @override
  @JsonKey(name: 'answer_xp')
  int get answerXp;
  @override
  @JsonKey(name: 'completion_xp')
  int get completionXp;
  @override
  @JsonKey(name: 'total_xp')
  int get totalXp;
  @override
  @JsonKey(name: 'bonus_granted')
  int get bonusGranted;
  @override
  @JsonKey(name: 'bonus_served')
  int get bonusServed;
  @override
  @JsonKey(name: 'rating_before')
  int? get ratingBefore;
  @override
  @JsonKey(name: 'rating_after')
  int? get ratingAfter;
  @override
  @JsonKey(name: 'rating_delta')
  int? get ratingDelta;
  @override
  double? get accuracy;
  @override
  double? get percentile;
  @override
  @JsonKey(name: 'streak_before')
  int? get streakBefore;
  @override
  @JsonKey(name: 'streak_after')
  int? get streakAfter;
  @override
  @JsonKey(name: 'streak_delta')
  int? get streakDelta;
  @override
  @JsonKey(name: 'season_rank_before')
  int? get seasonRankBefore;
  @override
  @JsonKey(name: 'season_rank_after')
  int? get seasonRankAfter;
  @override
  @JsonKey(name: 'season_rank_delta')
  int? get seasonRankDelta;
  @override
  DailyContinuationDto get continuation;

  /// Create a copy of DailySummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailySummaryDtoImplCopyWith<_$DailySummaryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
