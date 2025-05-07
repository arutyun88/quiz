abstract interface class QuestionIdService {
  String? get questionId;

  Future<void> save(String id);

  Future<void> clean();
}
