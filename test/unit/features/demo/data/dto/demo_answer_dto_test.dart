import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/demo/data/dto/demo_answer_dto.dart';

void main() {
  test('decodes the stateless answer result without reward fields', () {
    final dto = DemoAnswerDto.fromJson({
      'is_correct': true,
      'answer_id': 'answer-1',
      'correct_answer_id': 'answer-1',
      'description': 'Explanation',
    });

    expect(dto.isCorrect, isTrue);
    expect(dto.answerId, 'answer-1');
    expect(dto.correctAnswerId, 'answer-1');
    expect(dto.description, 'Explanation');
  });
}
