import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_result_entity.freezed.dart';

@freezed
class AnswerResultEntity with _$AnswerResultEntity {
  const factory AnswerResultEntity({
    required String answerId,
    required String correctAnswerId,
    required String description,
    required bool isCorrect,
  }) = _AnswerResultEntity;
}
