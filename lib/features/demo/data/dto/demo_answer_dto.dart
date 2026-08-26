import 'package:quiz/app/core/model/json.dart';

final class DemoAnswerDto {
  final bool isCorrect;
  final String answerId;
  final String correctAnswerId;
  final String description;

  const DemoAnswerDto({
    required this.isCorrect,
    required this.answerId,
    required this.correctAnswerId,
    required this.description,
  });

  factory DemoAnswerDto.fromJson(Json json) => DemoAnswerDto(
        isCorrect: json['is_correct'] as bool,
        answerId: json['answer_id'] as String,
        correctAnswerId: json['correct_answer_id'] as String,
        description: json['description'] as String,
      );
}
