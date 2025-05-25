import 'package:freezed_annotation/freezed_annotation.dart';

part 'answered_question_entity.freezed.dart';

@freezed
class AnsweredQuestionEntity with _$AnsweredQuestionEntity {
  const factory AnsweredQuestionEntity({
    required String questionId,
    required String question,
    required String answerId,
    required String answer,
    required bool isCorrect,
  }) = _AnsweredQuestionEntity;
}
