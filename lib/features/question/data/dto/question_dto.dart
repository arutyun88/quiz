import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/features/question/data/dto/answer_dto.dart';
import 'package:quiz/features/question/data/dto/topic_dto.dart';

part 'question_dto.freezed.dart';
part 'question_dto.g.dart';

@freezed
class QuestionDto with _$QuestionDto {
  const factory QuestionDto({
    required String id,
    required String question,
    required String description,
    required TopicDto topic,
    required String hint,
    required List<AnswerDto> answers,
  }) = _QuestionDto;

  factory QuestionDto.fromJson(Map<String, dynamic> json) => _$QuestionDtoFromJson(json);
}
