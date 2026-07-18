import 'package:freezed_annotation/freezed_annotation.dart';

part 'mastery_dto.freezed.dart';
part 'mastery_dto.g.dart';

@freezed
class MasteryDto with _$MasteryDto {
  const factory MasteryDto({
    required List<MasteryTopicDto> topics,
    MasteryTopicDto? weakest,
    @JsonKey(name: 'weekly_accuracy_delta') double? weeklyAccuracyDelta,
    @JsonKey(name: 'best_day_of_week') int? bestDayOfWeek,
  }) = _MasteryDto;

  factory MasteryDto.fromJson(Map<String, dynamic> json) => _$MasteryDtoFromJson(json);
}

@freezed
class MasteryTopicDto with _$MasteryTopicDto {
  const factory MasteryTopicDto({
    required String name,
    required double accuracy,
    required int answers,
  }) = _MasteryTopicDto;

  factory MasteryTopicDto.fromJson(Map<String, dynamic> json) => _$MasteryTopicDtoFromJson(json);
}
