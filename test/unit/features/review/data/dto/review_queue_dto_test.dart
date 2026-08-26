import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/review/data/dto/review_queue_dto.dart';

void main() {
  test('decodes the authoritative spaced-review queue', () {
    final dto = ReviewQueueDto.fromJson({
      'queued': [
        {
          'question': 'Question?',
          'topic': 'Science',
          'wrong_count': 2,
          'correct_count': 1,
          'due_in_days': 5,
        },
      ],
      'queued_total': 3,
      'mastered_total': 7,
    });

    expect(dto.queuedTotal, 3);
    expect(dto.masteredTotal, 7);
    expect(dto.queued.single.wrongCount, 2);
    expect(dto.queued.single.correctCount, 1);
    expect(dto.queued.single.dueInDays, 5);
  });
}
