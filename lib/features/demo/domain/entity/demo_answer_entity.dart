final class DemoAnswerEntity {
  final bool isCorrect;
  final String answerId;
  final String correctAnswerId;
  final String description;

  const DemoAnswerEntity({
    required this.isCorrect,
    required this.answerId,
    required this.correctAnswerId,
    required this.description,
  });
}
