import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/features/user/data/dto/user_statistics_dto.dart';

part 'answered_statistics_dto.freezed.dart';
part 'answered_statistics_dto.g.dart';

@freezed
class AnsweredStatisticsDto with _$AnsweredStatisticsDto {
  const factory AnsweredStatisticsDto({
    @JsonKey(name: 'last_is_correct') required bool lastIsCorrect,
    required UserStatisticsDto statistics,
  }) = _AnsweredStatisticsDto;

  factory AnsweredStatisticsDto.fromJson(Map<String, dynamic> json) => _$AnsweredStatisticsDtoFromJson(json);
}
