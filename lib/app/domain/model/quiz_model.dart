
class QuizModel {
  final int id;
  final String targetQuiz;
  final String description;
  final QuizType type;

  const QuizModel({
    required this.id,
    required this.targetQuiz,
    required this.description,
    required this.type,
  });
}

enum QuizType { simple, video }

