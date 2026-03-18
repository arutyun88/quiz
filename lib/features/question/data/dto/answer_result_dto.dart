import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_result_dto.freezed.dart';
part 'answer_result_dto.g.dart';

@freezed
class AnswerResultDto with _$AnswerResultDto {
  const factory AnswerResultDto({
    @JsonKey(name: 'answer_id') required String userAnswerId,
    @JsonKey(name: 'correct_answer_id') required String correctAnswerId,
    required String description,
    @JsonKey(name: 'is_correct') required bool isCorrect,
  }) = _AnswerResultDto;

  factory AnswerResultDto.fromJson(Map<String, dynamic> json) => _$AnswerResultDtoFromJson(json);
}
