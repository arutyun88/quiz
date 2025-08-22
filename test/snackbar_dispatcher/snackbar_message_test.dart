import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/packages/snackbar_dispatcher/snackbar_action.dart';
import 'package:quiz/packages/snackbar_dispatcher/snackbar_message.dart';
import 'package:quiz/packages/snackbar_dispatcher/snackbar_priority.dart';
import 'package:quiz/packages/snackbar_dispatcher/snackbar_type.dart';

void main() {
  group('SnackbarMessage', () {
    group('constructor and properties', () {
      test('should create message with all custom values', () {
        final customIcon = const Icon(Icons.star);
        final actions = [
          SnackbarAction(label: 'Action', onPressed: () {}),
        ];

        final message = BasicSnackbarMessage(
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

        // Verify all properties
        expect(message.id, equals('test_id'));
        expect(message.message, equals('Test message'));
        expect(message.type, equals(SnackbarType.info));
        expect(message.priority, equals(SnackbarPriority.high));
        expect(message.persistent, isTrue);
        expect(message.actions, equals(actions));
        expect(message.groupId, equals('test_group'));
      });

      test('should use default values when not specified', () {
        const message = BasicSnackbarMessage(
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

    group('duration and icon getters', () {
      test('should return custom values when provided', () {
        const customDuration = Duration(seconds: 15);
        const customIcon = Icon(Icons.favorite);
        
        const message = BasicSnackbarMessage(
          id: 'test',
          message: 'Test',
          type: SnackbarType.info,
          duration: customDuration,
          icon: customIcon,
        );
        
        expect(message.duration, equals(customDuration));
        expect(message.icon, equals(customIcon));
      });

      test('should return default values for each type', () {
        const testCases = [
          (SnackbarType.info, Duration(seconds: 2), Icons.info),
          (SnackbarType.success, Duration(seconds: 2), Icons.check_circle),
          (SnackbarType.warning, Duration(seconds: 3), Icons.warning),
          (SnackbarType.error, Duration(seconds: 4), Icons.error),
          (SnackbarType.processing, null, null), // null duration, CircularProgressIndicator icon
        ];

        for (final (type, expectedDuration, expectedIconData) in testCases) {
          final message = BasicSnackbarMessage(
            id: 'test_${type.name}',
            message: 'Test message',
            type: type,
          );
          
          expect(message.duration, equals(expectedDuration));
          
          if (type == SnackbarType.processing) {
            expect(message.icon, isA<CircularProgressIndicator>());
          } else {
            expect(message.icon, isA<Icon>());
            final icon = message.icon as Icon;
            expect(icon.icon, equals(expectedIconData));
          }
        }
      });
    });

    group('real-world scenarios', () {
      test('should handle network error with actions and grouping', () {
        final actions = [
          SnackbarAction(label: 'Retry', onPressed: () {}),
          SnackbarAction(label: 'Cancel', onPressed: () {}),
        ];

        final message = BasicSnackbarMessage(
          id: 'network_error',
          message: 'Network connection failed',
          type: SnackbarType.error,
          priority: SnackbarPriority.high,
          actions: actions,
          groupId: 'network',
        );

        expect(message.actions, hasLength(2));
        expect(message.groupId, equals('network'));
        expect(message.priority, equals(SnackbarPriority.high));
        expect(message.type, equals(SnackbarType.error));
      });

      test('should handle processing message with persistence', () {
        const message = BasicSnackbarMessage(
          id: 'sync_progress',
          message: 'Syncing data...',
          type: SnackbarType.processing,
          persistent: true,
          groupId: 'sync',
        );

        expect(message.persistent, isTrue);
        expect(message.groupId, equals('sync'));
        expect(message.type, equals(SnackbarType.processing));
        expect(message.duration, isNull); // processing type has infinite duration
      });
    });
  });

  group('BasicSnackbarMessage', () {
    test('should inherit from SnackbarMessage and work correctly', () {
      const message = BasicSnackbarMessage(
        id: 'test',
        message: 'Test message',
        type: SnackbarType.info,
      );

      expect(message, isA<SnackbarMessage>());
      expect(message.id, equals('test'));
      expect(message.message, equals('Test message'));
      expect(message.type, equals(SnackbarType.info));
    });
  });
}
