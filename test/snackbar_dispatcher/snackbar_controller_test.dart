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

  group('SnackbarController', () {
    test('should create with initial state', () {
      final controller = SnackbarController();
      
      expect(controller.state.messages, isEmpty);
      expect(controller.state.lastShownTimes, isEmpty);
    });

    test('should notify listeners when showing snackbar', () {
      final controller = SnackbarController();
      var notificationCount = 0;
      
      controller.addListener(() {
        notificationCount++;
      });
      
      final message = BasicSnackbarMessage(
        id: 'test',
        message: 'Test message',
        type: SnackbarType.info,
      );
      
      controller.showSnackbar(message);
      expect(notificationCount, equals(1));
    });

    test('should add message to state when showing snackbar', () {
      final controller = SnackbarController();
      
      final message = BasicSnackbarMessage(
        id: 'test',
        message: 'Test message',
        type: SnackbarType.info,
      );
      
      controller.showSnackbar(message);
      
      expect(controller.state.messages, hasLength(1));
      expect(controller.state.messages.first.id, equals('test'));
      expect(controller.state.lastShownTimes['test'], isNotNull);
    });

    test('should add messages in correct order', () {
      final controller = SnackbarController();
      
      final message1 = BasicSnackbarMessage(
        id: 'test1',
        message: 'First message',
        type: SnackbarType.info,
      );
      
      final message2 = BasicSnackbarMessage(
        id: 'test2',
        message: 'Second message',
        type: SnackbarType.warning,
      );
      
      controller.showSnackbar(message1);
      expect(controller.state.messages, hasLength(1));
      expect(controller.state.messages.first.message, equals('First message'));
      
      controller.showSnackbar(message2);
      expect(controller.state.messages, hasLength(2)); // Now 2 messages
      expect(controller.state.messages.first.message, equals('First message'));
      expect(controller.state.messages.last.message, equals('Second message'));
    });

    test('should handle duplicate message ids correctly', () {
      final controller = SnackbarController();
      
      final message1 = BasicSnackbarMessage(
        id: 'test',
        message: 'First message',
        type: SnackbarType.info,
      );
      
      final message2 = BasicSnackbarMessage(
        id: 'test',
        message: 'Second message',
        type: SnackbarType.warning,
      );
      
      controller.showSnackbar(message1);
      expect(controller.state.messages, hasLength(1));
      expect(controller.state.messages.first.message, equals('First message'));
      
      controller.showSnackbar(message2);
      // Check that the message is handled (either replaced or blocked)
      expect(controller.state.messages, hasLength(1));
      // The exact behavior depends on implementation - could be replaced or blocked
    });

    test('should limit messages per group', () {
      final controller = SnackbarController();
      
      // Add 4 messages to the same group (limit is 3)
      for (int i = 0; i < 4; i++) {
        final message = BasicSnackbarMessage(
          id: 'test$i',
          message: 'Message $i',
          type: SnackbarType.info,
          groupId: 'test_group',
        );
        controller.showSnackbar(message);
      }
      
      // Should have only 3 messages in the group
      final groupMessages = controller.state.messages
          .where((m) => m.groupId == 'test_group')
          .toList();
      
      expect(groupMessages, hasLength(3));
      // Oldest message should be removed
      expect(groupMessages.any((m) => m.id == 'test0'), isFalse);
    });

    test('should limit total messages', () {
      final controller = SnackbarController();
      
      // Add 11 messages (limit is 10)
      for (int i = 0; i < 11; i++) {
        final message = BasicSnackbarMessage(
          id: 'test$i',
          message: 'Message $i',
          type: SnackbarType.info,
          priority: SnackbarPriority.low, // Low priority to be removed first
        );
        controller.showSnackbar(message);
      }
      
      // Should have only 10 messages
      expect(controller.state.messages, hasLength(10));
      // Oldest low-priority message should be removed
      expect(controller.state.messages.any((m) => m.id == 'test0'), isFalse);
    });

    test('should prevent spam by blocking frequent messages', () {
      final controller = SnackbarController();
      
      final message = BasicSnackbarMessage(
        id: 'test',
        message: 'Test message',
        type: SnackbarType.info,
      );
      
      // First show should work
      controller.showSnackbar(message);
      expect(controller.state.messages, hasLength(1));
      
      // Second show within 2 seconds should be blocked (spam prevention)
      controller.showSnackbar(message);
      expect(controller.state.messages, hasLength(1)); // Still only 1 message
    });

    test('should handle messages with different priorities correctly', () {
      final controller = SnackbarController();
      
      final lowPriorityMessage = BasicSnackbarMessage(
        id: 'low',
        message: 'Low priority',
        type: SnackbarType.info,
        priority: SnackbarPriority.low,
      );
      
      final highPriorityMessage = BasicSnackbarMessage(
        id: 'high',
        message: 'High priority',
        type: SnackbarType.warning,
        priority: SnackbarPriority.high,
      );
      
      controller.showSnackbar(lowPriorityMessage);
      controller.showSnackbar(highPriorityMessage);
      
      expect(controller.state.messages, hasLength(2));
      expect(controller.state.messages.first.id, equals('low')); // First added
      expect(controller.state.messages.last.id, equals('high')); // Last added
    });

    test('should hide snackbar by id', () {
      final controller = SnackbarController();
      
      final message1 = BasicSnackbarMessage(
        id: 'test1',
        message: 'Test message 1',
        type: SnackbarType.info,
      );
      
      final message2 = BasicSnackbarMessage(
        id: 'test2',
        message: 'Test message 2',
        type: SnackbarType.warning,
      );
      
      controller.showSnackbar(message1);
      controller.showSnackbar(message2);
      expect(controller.state.messages, hasLength(2));
      
      controller.hideSnackbar(message1.id);
      expect(controller.state.messages, hasLength(1));
      expect(controller.state.messages.first.id, equals(message2.id));
    });

    test('should hide all messages in group', () {
      final controller = SnackbarController();
      
      final networkMessage1 = BasicSnackbarMessage(
        id: 'network1',
        message: 'Network error 1',
        type: SnackbarType.error,
        groupId: 'network',
      );
      
      final networkMessage2 = BasicSnackbarMessage(
        id: 'network2',
        message: 'Network error 2',
        type: SnackbarType.error,
        groupId: 'network',
      );
      
      final syncMessage = BasicSnackbarMessage(
        id: 'sync1',
        message: 'Sync message',
        type: SnackbarType.info,
        groupId: 'sync',
      );
      
      controller.showSnackbar(networkMessage1);
      controller.showSnackbar(networkMessage2);
      controller.showSnackbar(syncMessage);
      expect(controller.state.messages, hasLength(3));
      
      controller.hideGroup('network');
      expect(controller.state.messages, hasLength(1));
      expect(controller.state.messages.first.id, equals('sync1'));
    });

    test('should clear all messages', () {
      final controller = SnackbarController();
      
      final message1 = BasicSnackbarMessage(
        id: 'test1',
        message: 'Test message 1',
        type: SnackbarType.info,
      );
      
      final message2 = BasicSnackbarMessage(
        id: 'test2',
        message: 'Test message 2',
        type: SnackbarType.warning,
      );
      
      controller.showSnackbar(message1);
      controller.showSnackbar(message2);
      expect(controller.state.messages, hasLength(2));
      
      controller.clearAll();
      expect(controller.state.messages, isEmpty);
      expect(controller.state.lastShownTimes, isEmpty);
    });

    test('should clear non-persistent messages only', () {
      final controller = SnackbarController();
      
      final persistentMessage = BasicSnackbarMessage(
        id: 'persistent',
        message: 'Persistent message',
        type: SnackbarType.error,
        persistent: true,
      );
      
      final nonPersistentMessage1 = BasicSnackbarMessage(
        id: 'non_persistent1',
        message: 'Non-persistent message 1',
        type: SnackbarType.info,
        persistent: false,
      );
      
      final nonPersistentMessage2 = BasicSnackbarMessage(
        id: 'non_persistent2',
        message: 'Non-persistent message 2',
        type: SnackbarType.success,
        persistent: false,
      );
      
      controller.showSnackbar(persistentMessage);
      controller.showSnackbar(nonPersistentMessage1);
      controller.showSnackbar(nonPersistentMessage2);
      expect(controller.state.messages, hasLength(3));
      
      controller.clearNonPersistent();
      expect(controller.state.messages, hasLength(1));
      expect(controller.state.messages.first.id, equals('persistent'));
    });

    test('should handle hide operations on empty state', () {
      final controller = SnackbarController();
      
      // These operations should not throw errors on empty state
      expect(() {
        controller.hideSnackbar('non_existent');
        controller.hideGroup('non_existent');
        controller.clearAll();
        controller.clearNonPersistent();
      }, returnsNormally);
      
      expect(controller.state.messages, isEmpty);
    });

    test('should notify listeners on all state changes', () {
      final controller = SnackbarController();
      var notificationCount = 0;
      
      controller.addListener(() {
        notificationCount++;
      });
      
      // showSnackbar
      final message = BasicSnackbarMessage(
        id: 'test',
        message: 'Test message',
        type: SnackbarType.info,
      );
      controller.showSnackbar(message);
      expect(notificationCount, equals(1));
      
      // hideSnackbar
      controller.hideSnackbar('test');
      expect(notificationCount, equals(2));
      
      // clearAll
      controller.clearAll();
      expect(notificationCount, equals(3));
    });

    test('should return read-only state that cannot be modified', () {
      final controller = SnackbarController();
      final state = controller.state;
      
      // Test messages protection
      expect(() {
        state.messages.add(BasicSnackbarMessage(
          id: 'test',
          message: 'Test message',
          type: SnackbarType.info,
        ));
      }, throwsUnsupportedError);
      
      // Test lastShownTimes protection
      expect(() {
        state.lastShownTimes['test'] = DateTime.now();
      }, throwsUnsupportedError);
      
      // Verify original state is unchanged
      expect(controller.state.messages, isEmpty);
      expect(controller.state.lastShownTimes, isEmpty);
    });

    test('should return new state instance each time', () {
      final controller = SnackbarController();
      
      final state1 = controller.state;
      final state2 = controller.state;
      
      // Each call should return a new instance
      expect(identical(state1, state2), isFalse);
    });
  });
}
