import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/daily_edition/data/service/shared_preferences_daily_attempt_outbox.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_edition/domain/entity/pending_daily_attempt_entity.dart';
import 'package:quiz/features/daily_edition/domain/service/daily_attempt_outbox.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  const accountId = 'account-1';
  const storageKey = 'daily_attempt_outbox_v1:account-1';
  final createdAt = DateTime.parse('2026-08-26T00:00:00Z');

  PendingDailyAttemptEntity pending({
    String account = accountId,
    String eventId = 'event-1',
  }) =>
      PendingDailyAttemptEntity(
        accountId: account,
        runId: 'run-1',
        assignmentId: 'assignment-1',
        clientEventId: eventId,
        action: DailyAttemptAction.answer,
        answerId: 'answer-1',
        createdAt: createdAt,
      );

  Future<DailyAttemptOutbox> createOutbox() async =>
      SharedPreferencesDailyAttemptOutbox(
        preferences: await SharedPreferences.getInstance(),
      );

  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('restores the same event envelope after a new service instance',
      () async {
    final first = await createOutbox();
    await first.save(pending());

    final restored = await (await createOutbox()).load(accountId: accountId);

    expect(restored?.runId, 'run-1');
    expect(restored?.assignmentId, 'assignment-1');
    expect(restored?.clientEventId, 'event-1');
    expect(restored?.action, DailyAttemptAction.answer);
    expect(restored?.answerId, 'answer-1');
    expect(restored?.createdAt, createdAt);
  });

  test('keeps pending attempts isolated by account', () async {
    final outbox = await createOutbox();
    await outbox.save(pending());
    await outbox.save(pending(account: 'account-2', eventId: 'event-2'));

    final first = await outbox.load(accountId: accountId);
    final second = await outbox.load(accountId: 'account-2');

    expect(first?.clientEventId, 'event-1');
    expect(second?.clientEventId, 'event-2');
  });

  test('clears only the event acknowledged by the server', () async {
    final outbox = await createOutbox();
    await outbox.save(pending());

    await outbox.clear(accountId: accountId, clientEventId: 'older-event');
    expect(await outbox.load(accountId: accountId), isNotNull);

    await outbox.clear(accountId: accountId, clientEventId: 'event-1');
    expect(await outbox.load(accountId: accountId), isNull);
  });

  test('drops malformed versioned data without reading legacy cache', () async {
    SharedPreferences.setMockInitialValues({
      storageKey: '{broken',
      'current_question_id': 'legacy-question',
    });
    final preferences = await SharedPreferences.getInstance();
    final outbox = SharedPreferencesDailyAttemptOutbox(
      preferences: preferences,
    );

    expect(await outbox.load(accountId: accountId), isNull);
    expect(preferences.containsKey(storageKey), isFalse);
    expect(preferences.getString('current_question_id'), 'legacy-question');
  });

  test('drops an envelope written for a different account', () async {
    SharedPreferences.setMockInitialValues({
      storageKey: jsonEncode({
        'schema_version': 1,
        'account_id': 'account-2',
        'run_id': 'run-1',
        'assignment_id': 'assignment-1',
        'client_event_id': 'event-1',
        'action': 'ANSWER',
        'answer_id': 'answer-1',
        'created_at': createdAt.toIso8601String(),
      }),
    });
    final outbox = await createOutbox();

    expect(await outbox.load(accountId: accountId), isNull);
  });

  test('preserves an envelope from a future schema version', () async {
    SharedPreferences.setMockInitialValues({
      storageKey: jsonEncode({
        'schema_version': 2,
        'account_id': accountId,
      }),
    });
    final preferences = await SharedPreferences.getInstance();
    final outbox = SharedPreferencesDailyAttemptOutbox(
      preferences: preferences,
    );

    expect(await outbox.load(accountId: accountId), isNull);
    expect(preferences.containsKey(storageKey), isTrue);
  });

  test('rejects locally manufactured invalid action payloads', () async {
    final outbox = await createOutbox();
    final invalid = PendingDailyAttemptEntity(
      accountId: accountId,
      runId: 'run-1',
      assignmentId: 'assignment-1',
      clientEventId: 'event-1',
      action: DailyAttemptAction.skip,
      answerId: 'answer-1',
      createdAt: createdAt,
    );

    expect(() => outbox.save(invalid), throwsArgumentError);
  });
}
