import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_edition/domain/entity/pending_daily_attempt_entity.dart';
import 'package:quiz/features/daily_edition/domain/service/daily_attempt_outbox.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: DailyAttemptOutbox)
class SharedPreferencesDailyAttemptOutbox implements DailyAttemptOutbox {
  SharedPreferencesDailyAttemptOutbox({required SharedPreferences preferences})
      : _preferences = preferences;

  static const int _schemaVersion = 1;
  static const String _keyPrefix = 'daily_attempt_outbox_v1:';

  final SharedPreferences _preferences;

  @override
  Future<PendingDailyAttemptEntity?> load({required String accountId}) async {
    final key = _key(accountId);
    final value = _preferences.getString(key);
    if (value == null) return null;

    try {
      final decoded = jsonDecode(value);
      if (decoded is! Map<String, dynamic>) {
        await _remove(key);
        return null;
      }

      final schemaVersion = decoded['schema_version'];
      if (schemaVersion is int && schemaVersion > _schemaVersion) {
        return null;
      }

      final attempt = _decode(decoded, accountId: accountId);
      if (attempt == null) await _remove(key);
      return attempt;
    } on FormatException {
      await _remove(key);
      return null;
    }
  }

  @override
  Future<void> save(PendingDailyAttemptEntity attempt) async {
    _validate(attempt);
    final saved = await _preferences.setString(
      _key(attempt.accountId),
      jsonEncode({
        'schema_version': _schemaVersion,
        'account_id': attempt.accountId,
        'run_id': attempt.runId,
        'assignment_id': attempt.assignmentId,
        'client_event_id': attempt.clientEventId,
        'action': attempt.action.apiValue,
        if (attempt.answerId != null) 'answer_id': attempt.answerId,
        'created_at': attempt.createdAt.toUtc().toIso8601String(),
      }),
    );
    if (!saved) throw StateError('Could not persist pending Daily attempt');
  }

  @override
  Future<void> clear({
    required String accountId,
    required String clientEventId,
  }) async {
    final pending = await load(accountId: accountId);
    if (pending == null || pending.clientEventId != clientEventId) return;
    await _remove(_key(accountId));
  }

  PendingDailyAttemptEntity? _decode(
    Map<String, dynamic> json, {
    required String accountId,
  }) {
    if (json['schema_version'] != _schemaVersion ||
        json['account_id'] != accountId) {
      return null;
    }

    final runId = json['run_id'];
    final assignmentId = json['assignment_id'];
    final clientEventId = json['client_event_id'];
    final action = switch (json['action']) {
      'ANSWER' => DailyAttemptAction.answer,
      'SKIP' => DailyAttemptAction.skip,
      _ => null,
    };
    final answerId = json['answer_id'];
    final createdAtValue = json['created_at'];
    final createdAt = createdAtValue is String
        ? DateTime.tryParse(createdAtValue)?.toUtc()
        : null;

    if (runId is! String ||
        assignmentId is! String ||
        clientEventId is! String ||
        action == null ||
        answerId is! String? ||
        createdAt == null) {
      return null;
    }

    final attempt = PendingDailyAttemptEntity(
      accountId: accountId,
      runId: runId,
      assignmentId: assignmentId,
      clientEventId: clientEventId,
      action: action,
      answerId: answerId,
      createdAt: createdAt,
    );
    try {
      _validate(attempt);
      return attempt;
    } on ArgumentError {
      return null;
    }
  }

  void _validate(PendingDailyAttemptEntity attempt) {
    if (attempt.accountId.isEmpty ||
        attempt.runId.isEmpty ||
        attempt.assignmentId.isEmpty ||
        attempt.clientEventId.isEmpty) {
      throw ArgumentError('Pending Daily attempt identifiers cannot be empty');
    }
    switch (attempt.action) {
      case DailyAttemptAction.answer when attempt.answerId == null:
        throw ArgumentError('ANSWER requires answerId');
      case DailyAttemptAction.skip when attempt.answerId != null:
        throw ArgumentError('SKIP must not contain answerId');
      case DailyAttemptAction.unknown:
        throw ArgumentError('Unknown Daily attempt action cannot be persisted');
      default:
    }
  }

  String _key(String accountId) =>
      '$_keyPrefix${Uri.encodeComponent(accountId)}';

  Future<void> _remove(String key) async {
    final removed = await _preferences.remove(key);
    if (!removed && _preferences.containsKey(key)) {
      throw StateError('Could not remove pending Daily attempt');
    }
  }
}
