import 'package:freezed_annotation/freezed_annotation.dart';

part 'answered_question_dto.freezed.dart';
part 'answered_question_dto.g.dart';

@freezed
class AnsweredQuestionDto with _$AnsweredQuestionDto {
  const factory AnsweredQuestionDto({
    @JsonKey(name: 'question_id') required String questionId,
    @JsonKey(name: 'answer_id') required String answerId,
  }) = _AnsweredQuestionDto;

  factory AnsweredQuestionDto.fromJson(Map<String, dynamic> json) => _$AnsweredQuestionDtoFromJson(json);
}
