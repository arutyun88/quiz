import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/review/data/dto/review_history_dto.dart';

void main() {
  test('decodes an authoritative immutable review history item', () {
    final dto = ReviewHistoryItemDto.fromJson({
      'attempt_id': 'attempt-1',
      'question_id': 'question-1',
      'question_version_id': 'version-2',
      'edition_date': '2026-08-25',
      'answered_at': '2026-08-25T12:00:00Z',
      'action': 'ANSWER',
      'answer_id': 'answer-1',
      'correct_answer_id': 'answer-2',
      'question': 'Question?',
      'topic': 'Science',
      'answer': 'Wrong',
      'correct_answer': 'Correct',
      'description': 'Explanation',
      'hint': null,
      'hint_used': false,
      'version_status': 'UPDATED',
      'content_redacted': false,
    });

    expect(dto.attemptId, 'attempt-1');
    expect(dto.questionVersionId, 'version-2');
    expect(dto.correctAnswer, 'Correct');
    expect(dto.versionStatus, 'UPDATED');
    expect(dto.contentRedacted, isFalse);
  });
}
