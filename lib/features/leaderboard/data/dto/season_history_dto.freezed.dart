// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'season_history_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SeasonHistoryDto _$SeasonHistoryDtoFromJson(Map<String, dynamic> json) {
  return _SeasonHistoryDto.fromJson(json);
}

/// @nodoc
mixin _$SeasonHistoryDto {
  @JsonKey(name: 'season_id')
  String get seasonId => throw _privateConstructorUsedError;
  @JsonKey(name: 'starts_at')
  DateTime get startsAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'ends_at')
  DateTime get endsAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_current')
  bool get isCurrent => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating_before')
  int get ratingBefore => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating_after')
  int get ratingAfter => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating_delta')
  int get ratingDelta => throw _privateConstructorUsedError;
  @JsonKey(name: 'best_rating')
  int get bestRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'official_answers')
  int get officialAnswers => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_answers')
  int get correctAnswers => throw _privateConstructorUsedError;
  double get accuracy => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;

  /// Serializes this SeasonHistoryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeasonHistoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeasonHistoryDtoCopyWith<SeasonHistoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeasonHistoryDtoCopyWith<$Res> {
  factory $SeasonHistoryDtoCopyWith(
          SeasonHistoryDto value, $Res Function(SeasonHistoryDto) then) =
      _$SeasonHistoryDtoCopyWithImpl<$Res, SeasonHistoryDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'season_id') String seasonId,
      @JsonKey(name: 'starts_at') DateTime startsAt,
      @JsonKey(name: 'ends_at') DateTime endsAt,
      @JsonKey(name: 'is_current') bool isCurrent,
      @JsonKey(name: 'rating_before') int ratingBefore,
      @JsonKey(name: 'rating_after') int ratingAfter,
      @JsonKey(name: 'rating_delta') int ratingDelta,
      @JsonKey(name: 'best_rating') int bestRating,
      @JsonKey(name: 'official_answers') int officialAnswers,
      @JsonKey(name: 'correct_answers') int correctAnswers,
      double accuracy,
      int? rank});
}

/// @nodoc
class _$SeasonHistoryDtoCopyWithImpl<$Res, $Val extends SeasonHistoryDto>
    implements $SeasonHistoryDtoCopyWith<$Res> {
  _$SeasonHistoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeasonHistoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seasonId = null,
    Object? startsAt = null,
    Object? endsAt = null,
    Object? isCurrent = null,
    Object? ratingBefore = null,
    Object? ratingAfter = null,
    Object? ratingDelta = null,
    Object? bestRating = null,
    Object? officialAnswers = null,
    Object? correctAnswers = null,
    Object? accuracy = null,
    Object? rank = freezed,
  }) {
    return _then(_value.copyWith(
      seasonId: null == seasonId
          ? _value.seasonId
          : seasonId // ignore: cast_nullable_to_non_nullable
              as String,
      startsAt: null == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endsAt: null == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCurrent: null == isCurrent
          ? _value.isCurrent
          : isCurrent // ignore: cast_nullable_to_non_nullable
              as bool,
      ratingBefore: null == ratingBefore
          ? _value.ratingBefore
          : ratingBefore // ignore: cast_nullable_to_non_nullable
              as int,
      ratingAfter: null == ratingAfter
          ? _value.ratingAfter
          : ratingAfter // ignore: cast_nullable_to_non_nullable
              as int,
      ratingDelta: null == ratingDelta
          ? _value.ratingDelta
          : ratingDelta // ignore: cast_nullable_to_non_nullable
              as int,
      bestRating: null == bestRating
          ? _value.bestRating
          : bestRating // ignore: cast_nullable_to_non_nullable
              as int,
      officialAnswers: null == officialAnswers
          ? _value.officialAnswers
          : officialAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswers: null == correctAnswers
          ? _value.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeasonHistoryDtoImplCopyWith<$Res>
    implements $SeasonHistoryDtoCopyWith<$Res> {
  factory _$$SeasonHistoryDtoImplCopyWith(_$SeasonHistoryDtoImpl value,
          $Res Function(_$SeasonHistoryDtoImpl) then) =
      __$$SeasonHistoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'season_id') String seasonId,
      @JsonKey(name: 'starts_at') DateTime startsAt,
      @JsonKey(name: 'ends_at') DateTime endsAt,
      @JsonKey(name: 'is_current') bool isCurrent,
      @JsonKey(name: 'rating_before') int ratingBefore,
      @JsonKey(name: 'rating_after') int ratingAfter,
      @JsonKey(name: 'rating_delta') int ratingDelta,
      @JsonKey(name: 'best_rating') int bestRating,
      @JsonKey(name: 'official_answers') int officialAnswers,
      @JsonKey(name: 'correct_answers') int correctAnswers,
      double accuracy,
      int? rank});
}

/// @nodoc
class __$$SeasonHistoryDtoImplCopyWithImpl<$Res>
    extends _$SeasonHistoryDtoCopyWithImpl<$Res, _$SeasonHistoryDtoImpl>
    implements _$$SeasonHistoryDtoImplCopyWith<$Res> {
  __$$SeasonHistoryDtoImplCopyWithImpl(_$SeasonHistoryDtoImpl _value,
      $Res Function(_$SeasonHistoryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeasonHistoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seasonId = null,
    Object? startsAt = null,
    Object? endsAt = null,
    Object? isCurrent = null,
    Object? ratingBefore = null,
    Object? ratingAfter = null,
    Object? ratingDelta = null,
    Object? bestRating = null,
    Object? officialAnswers = null,
    Object? correctAnswers = null,
    Object? accuracy = null,
    Object? rank = freezed,
  }) {
    return _then(_$SeasonHistoryDtoImpl(
      seasonId: null == seasonId
          ? _value.seasonId
          : seasonId // ignore: cast_nullable_to_non_nullable
              as String,
      startsAt: null == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endsAt: null == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCurrent: null == isCurrent
          ? _value.isCurrent
          : isCurrent // ignore: cast_nullable_to_non_nullable
              as bool,
      ratingBefore: null == ratingBefore
          ? _value.ratingBefore
          : ratingBefore // ignore: cast_nullable_to_non_nullable
              as int,
      ratingAfter: null == ratingAfter
          ? _value.ratingAfter
          : ratingAfter // ignore: cast_nullable_to_non_nullable
              as int,
      ratingDelta: null == ratingDelta
          ? _value.ratingDelta
          : ratingDelta // ignore: cast_nullable_to_non_nullable
              as int,
      bestRating: null == bestRating
          ? _value.bestRating
          : bestRating // ignore: cast_nullable_to_non_nullable
              as int,
      officialAnswers: null == officialAnswers
          ? _value.officialAnswers
          : officialAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswers: null == correctAnswers
          ? _value.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeasonHistoryDtoImpl implements _SeasonHistoryDto {
  const _$SeasonHistoryDtoImpl(
      {@JsonKey(name: 'season_id') required this.seasonId,
      @JsonKey(name: 'starts_at') required this.startsAt,
      @JsonKey(name: 'ends_at') required this.endsAt,
      @JsonKey(name: 'is_current') required this.isCurrent,
      @JsonKey(name: 'rating_before') required this.ratingBefore,
      @JsonKey(name: 'rating_after') required this.ratingAfter,
      @JsonKey(name: 'rating_delta') required this.ratingDelta,
      @JsonKey(name: 'best_rating') required this.bestRating,
      @JsonKey(name: 'official_answers') required this.officialAnswers,
      @JsonKey(name: 'correct_answers') required this.correctAnswers,
      required this.accuracy,
      required this.rank});

  factory _$SeasonHistoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeasonHistoryDtoImplFromJson(json);

  @override
  @JsonKey(name: 'season_id')
  final String seasonId;
  @override
  @JsonKey(name: 'starts_at')
  final DateTime startsAt;
  @override
  @JsonKey(name: 'ends_at')
  final DateTime endsAt;
  @override
  @JsonKey(name: 'is_current')
  final bool isCurrent;
  @override
  @JsonKey(name: 'rating_before')
  final int ratingBefore;
  @override
  @JsonKey(name: 'rating_after')
  final int ratingAfter;
  @override
  @JsonKey(name: 'rating_delta')
  final int ratingDelta;
  @override
  @JsonKey(name: 'best_rating')
  final int bestRating;
  @override
  @JsonKey(name: 'official_answers')
  final int officialAnswers;
  @override
  @JsonKey(name: 'correct_answers')
  final int correctAnswers;
  @override
  final double accuracy;
  @override
  final int? rank;

  @override
  String toString() {
    return 'SeasonHistoryDto(seasonId: $seasonId, startsAt: $startsAt, endsAt: $endsAt, isCurrent: $isCurrent, ratingBefore: $ratingBefore, ratingAfter: $ratingAfter, ratingDelta: $ratingDelta, bestRating: $bestRating, officialAnswers: $officialAnswers, correctAnswers: $correctAnswers, accuracy: $accuracy, rank: $rank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeasonHistoryDtoImpl &&
            (identical(other.seasonId, seasonId) ||
                other.seasonId == seasonId) &&
            (identical(other.startsAt, startsAt) ||
                other.startsAt == startsAt) &&
            (identical(other.endsAt, endsAt) || other.endsAt == endsAt) &&
            (identical(other.isCurrent, isCurrent) ||
                other.isCurrent == isCurrent) &&
            (identical(other.ratingBefore, ratingBefore) ||
                other.ratingBefore == ratingBefore) &&
            (identical(other.ratingAfter, ratingAfter) ||
                other.ratingAfter == ratingAfter) &&
            (identical(other.ratingDelta, ratingDelta) ||
                other.ratingDelta == ratingDelta) &&
            (identical(other.bestRating, bestRating) ||
                other.bestRating == bestRating) &&
            (identical(other.officialAnswers, officialAnswers) ||
                other.officialAnswers == officialAnswers) &&
            (identical(other.correctAnswers, correctAnswers) ||
                other.correctAnswers == correctAnswers) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.rank, rank) || other.rank == rank));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      seasonId,
      startsAt,
      endsAt,
      isCurrent,
      ratingBefore,
      ratingAfter,
      ratingDelta,
      bestRating,
      officialAnswers,
      correctAnswers,
      accuracy,
      rank);

  /// Create a copy of SeasonHistoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeasonHistoryDtoImplCopyWith<_$SeasonHistoryDtoImpl> get copyWith =>
      __$$SeasonHistoryDtoImplCopyWithImpl<_$SeasonHistoryDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeasonHistoryDtoImplToJson(
      this,
    );
  }
}

abstract class _SeasonHistoryDto implements SeasonHistoryDto {
  const factory _SeasonHistoryDto(
      {@JsonKey(name: 'season_id') required final String seasonId,
      @JsonKey(name: 'starts_at') required final DateTime startsAt,
      @JsonKey(name: 'ends_at') required final DateTime endsAt,
      @JsonKey(name: 'is_current') required final bool isCurrent,
      @JsonKey(name: 'rating_before') required final int ratingBefore,
      @JsonKey(name: 'rating_after') required final int ratingAfter,
      @JsonKey(name: 'rating_delta') required final int ratingDelta,
      @JsonKey(name: 'best_rating') required final int bestRating,
      @JsonKey(name: 'official_answers') required final int officialAnswers,
      @JsonKey(name: 'correct_answers') required final int correctAnswers,
      required final double accuracy,
      required final int? rank}) = _$SeasonHistoryDtoImpl;

  factory _SeasonHistoryDto.fromJson(Map<String, dynamic> json) =
      _$SeasonHistoryDtoImpl.fromJson;

  @override
  @JsonKey(name: 'season_id')
  String get seasonId;
  @override
  @JsonKey(name: 'starts_at')
  DateTime get startsAt;
  @override
  @JsonKey(name: 'ends_at')
  DateTime get endsAt;
  @override
  @JsonKey(name: 'is_current')
  bool get isCurrent;
  @override
  @JsonKey(name: 'rating_before')
  int get ratingBefore;
  @override
  @JsonKey(name: 'rating_after')
  int get ratingAfter;
  @override
  @JsonKey(name: 'rating_delta')
  int get ratingDelta;
  @override
  @JsonKey(name: 'best_rating')
  int get bestRating;
  @override
  @JsonKey(name: 'official_answers')
  int get officialAnswers;
  @override
  @JsonKey(name: 'correct_answers')
  int get correctAnswers;
  @override
  double get accuracy;
  @override
  int? get rank;

  /// Create a copy of SeasonHistoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeasonHistoryDtoImplCopyWith<_$SeasonHistoryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
