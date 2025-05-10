import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_state_dto.freezed.dart';
part 'question_state_dto.g.dart';

@freezed
class QuestionStateDto with _$QuestionStateDto {
  const factory QuestionStateDto({
    @JsonKey(name: 'question_id') required String questionId,
    @JsonKey(name: 'is_answered') required bool isAnswered,
  }) = _QuestionStateDto;

  factory QuestionStateDto.fromJson(Map<String, dynamic> json) => _$QuestionStateDtoFromJson(json);
}
