import 'package:freezed_annotation/freezed_annotation.dart';

part 'answered_today_dto.freezed.dart';
part 'answered_today_dto.g.dart';

@freezed
class AnsweredTodayDto with _$AnsweredTodayDto {
  const factory AnsweredTodayDto({
    @JsonKey(name: 'answered_question_count') required int answeredQuestionCount,
  }) = _AnsweredTodayDto;

  factory AnsweredTodayDto.fromJson(Map<String, dynamic> json) => _$AnsweredTodayDtoFromJson(json);
}
