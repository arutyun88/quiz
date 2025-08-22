import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/packages/snackbar_dispatcher/snackbar_action.dart';
import 'package:quiz/packages/snackbar_dispatcher/snackbar_message.dart';
import 'package:quiz/packages/snackbar_dispatcher/snackbar_priority.dart';
import 'package:quiz/packages/snackbar_dispatcher/snackbar_type.dart';

void main() {
  group('SnackbarMessage', () {
    group('constructor and properties', () {
      test('should create message with custom values', () {
        final customIcon = const Icon(Icons.star);
        final actions = [
          SnackbarAction(label: 'Action', onPressed: () {}),
        ];

        final message = _TestSnackbarMessage(
          id: 'test_id',
          message: 'Test message',
          type: SnackbarType.info,
          duration: Duration(seconds: 10),
          icon: customIcon,
          priority: SnackbarPriority.high,
          persistent: true,
          actions: actions,
          groupId: 'test_group',
        );

        expect(message.id, equals('test_id'));
        expect(message.message, equals('Test message'));
        expect(message.type, equals(SnackbarType.info));
        expect(message.priority, equals(SnackbarPriority.high));
        expect(message.persistent, isTrue);
        expect(message.actions, equals(actions));
        expect(message.groupId, equals('test_group'));
      });

      test('should use default values when not specified', () {
        const message = _TestSnackbarMessage(
          id: 'default_test',
          message: 'Default message',
          type: SnackbarType.info,
        );

        expect(message.priority, equals(SnackbarPriority.normal));
        expect(message.persistent, isFalse);
        expect(message.actions, isNull);
        expect(message.groupId, isNull);
      });
    });

    group('duration getter', () {
      test('should return custom duration when provided', () {
        const customDuration = Duration(seconds: 15);
        const message = _TestSnackbarMessage(
          id: 'test',
          message: 'Test',
          type: SnackbarType.info,
          duration: customDuration,
        );
        expect(message.duration, equals(customDuration));
      });

      test('should return default duration for each type', () {
        const testCases = [
          (SnackbarType.info, Duration(seconds: 2)),
          (SnackbarType.success, Duration(seconds: 2)),
          (SnackbarType.warning, Duration(seconds: 3)),
          (SnackbarType.error, Duration(seconds: 4)),
          (SnackbarType.processing, null),
        ];

        for (final (type, expectedDuration) in testCases) {
          final message = _TestSnackbarMessage(
            id: 'test_${type.name}',
            message: 'Test message',
            type: type,
          );
          expect(message.duration, equals(expectedDuration));
        }
      });
    });

    group('icon getter', () {
      test('should return custom icon when provided', () {
        const customIcon = Icon(Icons.favorite);
        const message = _TestSnackbarMessage(
          id: 'test',
          message: 'Test',
          type: SnackbarType.info,
          icon: customIcon,
        );
        expect(message.icon, equals(customIcon));
      });

      test('should return default icon for each type', () {
        const iconTestCases = [
          (SnackbarType.info, Icons.info),
          (SnackbarType.success, Icons.check_circle),
          (SnackbarType.warning, Icons.warning),
          (SnackbarType.error, Icons.error),
        ];

        for (final (type, expectedIconData) in iconTestCases) {
          final message = _TestSnackbarMessage(
            id: 'test_${type.name}',
            message: 'Test message',
            type: type,
          );
          expect(message.icon, isA<Icon>());
          final icon = message.icon as Icon;
          expect(icon.icon, equals(expectedIconData));
        }

        // Processing type has CircularProgressIndicator
        const processingMessage = _TestSnackbarMessage(
          id: 'test_processing',
          message: 'Processing...',
          type: SnackbarType.processing,
        );
        expect(processingMessage.icon, isA<CircularProgressIndicator>());
      });
    });

    group('real-world usage', () {
      test('should handle network error with actions', () {
        final actions = [
          SnackbarAction(label: 'Retry', onPressed: () {}),
          SnackbarAction(label: 'Cancel', onPressed: () {}),
        ];

        final message = _TestSnackbarMessage(
          id: 'network_error',
          message: 'Network connection failed',
          type: SnackbarType.error,
          priority: SnackbarPriority.high,
          actions: actions,
          groupId: 'network',
        );

        expect(message.actions, hasLength(2));
        expect(message.groupId, equals('network'));
      });

      test('should handle processing message', () {
        const message = _TestSnackbarMessage(
          id: 'sync_progress',
          message: 'Syncing data...',
          type: SnackbarType.processing,
          persistent: true,
          groupId: 'sync',
        );

        expect(message.persistent, isTrue);
        expect(message.groupId, equals('sync'));
      });
    });
  });
}

/// Test implementation of SnackbarMessage for testing purposes
class _TestSnackbarMessage extends SnackbarMessage {
  const _TestSnackbarMessage({
    required super.id,
    required super.message,
    required super.type,
    super.duration,
    super.icon,
    super.priority = SnackbarPriority.normal,
    super.persistent = false,
    super.actions,
    super.groupId,
  });
}
