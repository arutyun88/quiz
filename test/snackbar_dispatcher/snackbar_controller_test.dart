import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/packages/snackbar_dispatcher/snackbar_controller.dart';
import 'package:quiz/packages/snackbar_dispatcher/snackbar_message.dart';
import 'package:quiz/packages/snackbar_dispatcher/snackbar_priority.dart';
import 'package:quiz/packages/snackbar_dispatcher/snackbar_type.dart';

void main() {
  group('SnackbarState', () {
    test('should create with default values', () {
      final state = SnackbarState();
      
      expect(state.messages, isEmpty);
      expect(state.lastShownTimes, isEmpty);
    });

    test('should create with custom values', () {
      final messages = [
        BasicSnackbarMessage(
          id: 'test1',
          message: 'Test message 1',
          type: SnackbarType.info,
        ),
      ];
      final lastShownTimes = {'test1': DateTime.now()};
      
      final state = SnackbarState(
        messages: messages,
        lastShownTimes: lastShownTimes,
      );
      
      expect(state.messages, equals(messages));
      expect(state.lastShownTimes, equals(lastShownTimes));
    });

    test('should copy with new values', () {
      final initialState = SnackbarState();
      final newMessages = [
        BasicSnackbarMessage(
          id: 'test2',
          message: 'Test message 2',
          type: SnackbarType.info,
        ),
      ];
      final newLastShownTimes = {'test2': DateTime.now()};
      
      final copiedState = initialState.copyWith(
        messages: newMessages,
        lastShownTimes: newLastShownTimes,
      );
      
      expect(copiedState.messages, equals(newMessages));
      expect(copiedState.lastShownTimes, equals(newLastShownTimes));
      expect(copiedState.messages, isNot(equals(initialState.messages))); // immutability check
    });

    test('should sort messages by priority and insertion time', () {
      final messages = [
        BasicSnackbarMessage(
          id: 'low',
          message: 'Low priority',
          type: SnackbarType.info,
          priority: SnackbarPriority.low,
        ),
        BasicSnackbarMessage(
          id: 'high',
          message: 'High priority',
          type: SnackbarType.warning,
          priority: SnackbarPriority.high,
        ),
        BasicSnackbarMessage(
          id: 'critical',
          message: 'Critical priority',
          type: SnackbarType.error,
          priority: SnackbarPriority.critical,
        ),
        BasicSnackbarMessage(
          id: 'normal',
          message: 'Normal priority',
          type: SnackbarType.success,
          priority: SnackbarPriority.normal,
        ),
      ];
      
      final state = SnackbarState(messages: messages);
      final sorted = state.sortedMessages;
      
      // Check priority sorting (critical → high → normal → low)
      expect(sorted[0].id, equals('critical'));
      expect(sorted[1].id, equals('high'));
      expect(sorted[2].id, equals('normal'));
      expect(sorted[3].id, equals('low'));
      
      // Check that original list is unchanged
      expect(state.messages, equals(messages));
    });

    test('should group messages correctly', () {
      final messages = [
        BasicSnackbarMessage(
          id: 'network1',
          message: 'Network error 1',
          type: SnackbarType.error,
          groupId: 'network',
          priority: SnackbarPriority.high,
        ),
        BasicSnackbarMessage(
          id: 'network2',
          message: 'Network error 2',
          type: SnackbarType.error,
          groupId: 'network',
          priority: SnackbarPriority.low,
        ),
        BasicSnackbarMessage(
          id: 'sync1',
          message: 'Sync message',
          type: SnackbarType.info,
          groupId: 'sync',
        ),
        BasicSnackbarMessage(
          id: 'ungrouped',
          message: 'Ungrouped message',
          type: SnackbarType.info,
        ),
      ];
      
      final state = SnackbarState(messages: messages);
      final grouped = state.groupedMessages;
      
      // Check group counts
      expect(grouped['network'], hasLength(2));
      expect(grouped['sync'], hasLength(1));
      expect(grouped[null], hasLength(1));
      
      // Check that groups are sorted by priority
      final networkGroup = grouped['network']!;
      expect(networkGroup[0].priority, equals(SnackbarPriority.high)); // network1
      expect(networkGroup[1].priority, equals(SnackbarPriority.low));  // network2
    });
  });
}
