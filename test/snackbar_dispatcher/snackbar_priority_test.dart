import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/packages/snackbar_dispatcher/snackbar_priority.dart';

void main() {
  group('SnackbarPriority', () {
    test('should have correct structure and values', () {
      // Check enum structure
      expect(SnackbarPriority.values.length, equals(4));
      expect(SnackbarPriority.values, containsAll([
        SnackbarPriority.low,
        SnackbarPriority.normal,
        SnackbarPriority.high,
        SnackbarPriority.critical,
      ]));

      // Check numeric values
      expect(SnackbarPriority.low.value, equals(0));
      expect(SnackbarPriority.normal.value, equals(1));
      expect(SnackbarPriority.high.value, equals(2));
      expect(SnackbarPriority.critical.value, equals(3));
    });

    test('should convert from numeric values', () {
      expect(SnackbarPriority.fromValue(0), equals(SnackbarPriority.low));
      expect(SnackbarPriority.fromValue(3), equals(SnackbarPriority.critical));
      expect(() => SnackbarPriority.fromValue(-1), throwsStateError);
    });

    test('should support ordering operations', () {
      final priorities = [
        SnackbarPriority.normal,
        SnackbarPriority.critical,
        SnackbarPriority.low,
        SnackbarPriority.high,
      ];

      // Test sorting and filtering
      priorities.sort((a, b) => a.value.compareTo(b.value));
      expect(priorities.first, equals(SnackbarPriority.low));
      expect(priorities.last, equals(SnackbarPriority.critical));

      final highPriority = priorities.where((p) => p.value >= 2).toList();
      expect(highPriority.length, equals(2));
    });
  });
}
