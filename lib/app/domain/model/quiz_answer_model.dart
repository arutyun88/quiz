class QuizAnswerModel {
  final int id;
  final String variant;
  final String value;
  final bool isCorrect;

  const QuizAnswerModel({
    required this.id,
    required this.variant,
    required this.value,
    required this.isCorrect,
  });
}
