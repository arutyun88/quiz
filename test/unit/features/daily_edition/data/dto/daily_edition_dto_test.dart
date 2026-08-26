import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/daily_edition/data/converter/daily_edition_converter.dart';
import 'package:quiz/features/daily_edition/data/dto/daily_edition_dto.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';

void main() {
  test('parses the server open contract without applying device-local dates',
      () {
    final dto = DailyOpenDto.fromJson({
      'run_id': 'run-1',
      'edition_date': '2026-08-25',
      'status': 'IN_PROGRESS',
      'closes_at': '2026-08-25T23:00:00Z',
      'grace_ends_at': '2026-08-25T23:30:00Z',
      'required_count': 10,
      'resolved_count': 2,
      'rating_at_open': 1000,
      'continuation': _continuationJson(nextAction: 'COMPLETE_MAIN'),
    });

    final entity = dto.toEntity();

    expect(entity.editionDate, '2026-08-25');
    expect(entity.status, DailyRunStatus.inProgress);
    expect(entity.closesAt, DateTime.parse('2026-08-25T23:00:00Z'));
    expect(entity.requiredCount, 10);
    expect(entity.resolvedCount, 2);
  });

  test('parses assignment identity and exact question version', () {
    final entity = DailyAssignmentDto.fromJson({
      'assignment_id': 'assignment-1',
      'question_id': 'question-1',
      'question_version_id': 'version-3',
      'position': 4,
      'kind': 'MAIN',
      'topic': 'Science',
      'text': 'Question?',
      'answers': [
        {'id': 'answer-1', 'text': 'Answer'},
      ],
      'hint_used': false,
    }).toEntity();

    expect(entity.assignmentId, 'assignment-1');
    expect(entity.questionVersionId, 'version-3');
    expect(entity.kind, DailyAssignmentKind.main);
    expect(entity.answers.single.id, 'answer-1');
  });

  test('parses skipped attempt with nullable answer and authoritative rewards',
      () {
    final entity = DailyAttemptDto.fromJson({
      'client_event_id': 'event-1',
      'attempt_id': 'attempt-1',
      'assignment_id': 'assignment-1',
      'question_version_id': 'version-3',
      'action': 'SKIP',
      'correct': false,
      'answer_id': null,
      'correct_answer_id': 'answer-2',
      'description': 'Explanation',
      'hint_used': true,
      'xp_awarded': 2,
      'rating_before': 1000,
      'rating_after': 992,
      'rating_delta': -8,
      'provisional': true,
      'run_completed': false,
      'partner': null,
    }).toEntity();

    expect(entity.action, DailyAttemptAction.skip);
    expect(entity.answerId, isNull);
    expect(entity.xpAwarded, 2);
    expect(entity.ratingDelta, -8);
    expect(entity.hintUsed, isTrue);
  });

  test('keeps age-redacted reveal nullable during attempt restore', () {
    final entity = DailyAttemptDto.fromJson({
      'client_event_id': 'event-1',
      'attempt_id': 'attempt-1',
      'assignment_id': 'assignment-1',
      'question_version_id': 'version-3',
      'action': 'ANSWER',
      'correct': false,
      'answer_id': 'answer-1',
      'correct_answer_id': null,
      'description': null,
      'hint_used': false,
      'xp_awarded': 0,
      'rating_before': null,
      'rating_after': null,
      'rating_delta': null,
      'provisional': false,
      'run_completed': false,
      'partner': null,
    }).toEntity();

    expect(entity.correctAnswerId, isNull);
    expect(entity.description, isNull);
    expect(entity.ratingBefore, isNull);
    expect(entity.ratingAfter, isNull);
    expect(entity.ratingDelta, isNull);
    expect(entity.partner, isNull);
  });

  test('keeps a missing localized hint nullable', () {
    final entity = DailyHintDto.fromJson({
      'assignment_id': 'assignment-1',
      'hint': null,
    }).toEntity();

    expect(entity.assignmentId, 'assignment-1');
    expect(entity.hint, isNull);
  });

  test('keeps localized assignment fields nullable', () {
    final entity = DailyAssignmentDto.fromJson({
      'assignment_id': 'assignment-1',
      'question_id': 'question-1',
      'question_version_id': 'version-3',
      'position': 1,
      'kind': 'MAIN',
      'topic': null,
      'text': null,
      'answers': [
        {'id': 'answer-1', 'text': null},
      ],
      'hint_used': false,
    }).toEntity();

    expect(entity.topic, isNull);
    expect(entity.text, isNull);
    expect(entity.answers.single.text, isNull);
  });

  test('skip request omits answer_id and keeps the stable client event id', () {
    final json = const DailyAttemptRequestDto(
      clientEventId: 'event-1',
      assignmentId: 'assignment-1',
      action: 'SKIP',
    ).toJson();

    expect(json, containsPair('client_event_id', 'event-1'));
    expect(json, containsPair('assignment_id', 'assignment-1'));
    expect(json, containsPair('action', 'SKIP'));
    expect(json, isNot(contains('answer_id')));
  });

  test('unknown server states stay representable for safe rollout', () {
    final entity = DailyOpenDto.fromJson({
      'run_id': 'run-1',
      'edition_date': '2026-08-25',
      'status': 'FUTURE_STATUS',
      'closes_at': '2026-08-25T23:00:00Z',
      'grace_ends_at': '2026-08-25T23:30:00Z',
      'required_count': 0,
      'resolved_count': 0,
      'rating_at_open': 1000,
      'continuation': _continuationJson(nextAction: 'FUTURE_ACTION'),
    }).toEntity();

    expect(entity.status, DailyRunStatus.unknown);
    expect(
      entity.continuation.nextAction,
      DailyContinuationAction.unknown,
    );
  });

  test('unknown assignment kinds stay representable for safe rollout', () {
    final entity = DailyAssignmentDto.fromJson({
      'assignment_id': 'assignment-1',
      'question_id': 'question-1',
      'question_version_id': 'version-1',
      'position': 1,
      'kind': 'FUTURE_KIND',
      'topic': null,
      'text': null,
      'answers': <Map<String, dynamic>>[],
      'hint_used': false,
    }).toEntity();

    expect(entity.kind, DailyAssignmentKind.unknown);
  });

  test('parses summary counters and keeps unknown states representable', () {
    final entity = DailySummaryDto.fromJson({
      'run_id': 'run-1',
      'edition_date': '2026-08-25',
      'status': 'FUTURE_STATUS',
      'required_count': 10,
      'resolved_count': 10,
      'correct_count': 8,
      'skipped_count': 1,
      'hint_count': 2,
      'answer_xp': 84,
      'completion_xp': 25,
      'total_xp': 109,
      'bonus_granted': 0,
      'bonus_served': 0,
      'rating_before': 1000,
      'rating_after': 1018,
      'rating_delta': 18,
      'accuracy': 0.8,
      'percentile': null,
      'streak_before': 4,
      'streak_after': 5,
      'streak_delta': 1,
      'season_rank_before': null,
      'season_rank_after': null,
      'season_rank_delta': null,
      'continuation': _continuationJson(nextAction: 'FUTURE_ACTION'),
    }).toEntity();

    expect(entity.status, DailyRunStatus.unknown);
    expect(entity.requiredCount, 10);
    expect(entity.correctCount, 8);
    expect(entity.totalXp, 109);
    expect(entity.bonusGranted, 0);
    expect(entity.bonusServed, 0);
    expect(entity.ratingDelta, 18);
    expect(entity.accuracy, 0.8);
    expect(entity.streakAfter, 5);
    expect(entity.percentile, isNull);
    expect(entity.seasonRankDelta, isNull);
  });

  test('accepts an unfinished summary without completion metrics', () {
    final entity = DailySummaryDto.fromJson({
      'run_id': 'run-1',
      'edition_date': '2026-08-25',
      'status': 'ABANDONED',
      'required_count': 10,
      'resolved_count': 3,
      'correct_count': 2,
      'skipped_count': 1,
      'hint_count': 0,
      'answer_xp': 10,
      'completion_xp': 0,
      'total_xp': 10,
      'bonus_granted': 0,
      'bonus_served': 0,
      'continuation': _continuationJson(nextAction: 'CLOSED'),
    }).toEntity();

    expect(entity.ratingDelta, isNull);
    expect(entity.accuracy, isNull);
    expect(entity.streakAfter, isNull);
  });

  test('unknown attempt action never becomes an answer', () {
    final entity = DailyAttemptDto.fromJson({
      'client_event_id': 'event-1',
      'attempt_id': 'attempt-1',
      'assignment_id': 'assignment-1',
      'question_version_id': 'version-1',
      'action': 'FUTURE_ACTION',
      'correct': false,
      'answer_id': null,
      'correct_answer_id': null,
      'description': null,
      'hint_used': false,
      'xp_awarded': 0,
      'provisional': false,
      'run_completed': false,
      'partner': null,
    }).toEntity();

    expect(entity.action, DailyAttemptAction.unknown);
    expect(() => entity.action.apiValue, throwsStateError);
  });

  test('parses the authoritative rewarded-ad grant', () {
    final entity = RewardedAdDto.fromJson({
      'client_event_id': 'event-1',
      'granted_questions': 5,
      'continuation': _continuationJson(
        nextAction: 'PLAY_QUESTION',
        bonusRemaining: 5,
      ),
    }).toEntity();

    expect(entity.clientEventId, 'event-1');
    expect(entity.grantedQuestions, 5);
    expect(
      entity.continuation.nextAction,
      DailyContinuationAction.playQuestion,
    );
  });
}

Map<String, dynamic> _continuationJson({
  required String nextAction,
  int bonusRemaining = 0,
}) =>
    {
      'run_id': 'run-1',
      'server_time': '2026-08-25T12:00:00Z',
      'closes_at': '2026-08-25T23:00:00Z',
      'next_action': nextAction,
      'quiz_plus': false,
      'bonus_questions_granted': bonusRemaining,
      'bonus_questions_served': 0,
      'bonus_questions_remaining': bonusRemaining,
      'questions_per_reward': 5,
      'rewarded_videos_used': 0,
      'rewarded_videos_max': 6,
      'rewarded_videos_remaining': 6,
      'rolling_videos_used': 0,
      'rolling_videos_max': 2,
      'rewarded_ad_available': false,
      'rewarded_ad_next_available_at': null,
    };
