import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_state_entity.freezed.dart';

@freezed
class QuestionStateEntity with _$QuestionStateEntity {
  const factory QuestionStateEntity({
    required String questionId,
    required bool isAnswered,
  }) = _QuestionStateEntity;
}
