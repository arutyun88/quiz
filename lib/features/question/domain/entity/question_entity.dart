import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';
import 'package:quiz/features/question/domain/entity/topic_entity.dart';

part 'question_entity.freezed.dart';

@freezed
class QuestionEntity with _$QuestionEntity {
  const factory QuestionEntity({
    required String id,
    required String question,
    required String description,
    required TopicEntity topic,
    required String hint,
    required List<AnswerEntity> answers,
  }) = _QuestionEntity;
}
