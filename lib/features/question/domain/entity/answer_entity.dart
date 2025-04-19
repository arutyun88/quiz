import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_entity.freezed.dart';

@freezed
class AnswerEntity with _$AnswerEntity {
  const factory AnswerEntity({
    required String id,
    required bool isCorrect,
    required String text,
  }) = _AnswerEntity;
}
