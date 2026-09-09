import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/core/utils/localized_ordinal_day.dart';

void main() {
  group('localizedOrdinalDay', () {
    test('formats Russian simple and compound ordinals', () {
      expect(localizedOrdinalDay(1, 'ru'), 'первый');
      expect(localizedOrdinalDay(9, 'ru'), 'девятый');
      expect(localizedOrdinalDay(20, 'ru'), 'двадцатый');
      expect(localizedOrdinalDay(21, 'ru'), 'двадцать первый');
      expect(localizedOrdinalDay(99, 'ru'), 'девяносто девятый');
    });

    test('formats English simple and compound ordinals', () {
      expect(localizedOrdinalDay(1, 'en'), 'first');
      expect(localizedOrdinalDay(9, 'en'), 'ninth');
      expect(localizedOrdinalDay(20, 'en'), 'twentieth');
      expect(localizedOrdinalDay(21, 'en'), 'twenty-first');
      expect(localizedOrdinalDay(99, 'en'), 'ninety-ninth');
    });

    test('uses localized numeric fallback for large values', () {
      expect(localizedOrdinalDay(124, 'ru'), '124-й');
      expect(localizedOrdinalDay(111, 'en'), '111th');
      expect(localizedOrdinalDay(122, 'en'), '122nd');
    });
  });
}
