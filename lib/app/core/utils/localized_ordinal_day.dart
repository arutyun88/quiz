String localizedOrdinalDay(int value, String languageCode) {
  if (languageCode == 'ru') return _russianOrdinal(value);
  return _englishOrdinal(value);
}

const _russianOrdinals = <int, String>{
  1: 'первый',
  2: 'второй',
  3: 'третий',
  4: 'четвёртый',
  5: 'пятый',
  6: 'шестой',
  7: 'седьмой',
  8: 'восьмой',
  9: 'девятый',
  10: 'десятый',
  11: 'одиннадцатый',
  12: 'двенадцатый',
  13: 'тринадцатый',
  14: 'четырнадцатый',
  15: 'пятнадцатый',
  16: 'шестнадцатый',
  17: 'семнадцатый',
  18: 'восемнадцатый',
  19: 'девятнадцатый',
  20: 'двадцатый',
  30: 'тридцатый',
  40: 'сороковой',
  50: 'пятидесятый',
  60: 'шестидесятый',
  70: 'семидесятый',
  80: 'восьмидесятый',
  90: 'девяностый',
};

const _russianTens = <int, String>{
  20: 'двадцать',
  30: 'тридцать',
  40: 'сорок',
  50: 'пятьдесят',
  60: 'шестьдесят',
  70: 'семьдесят',
  80: 'восемьдесят',
  90: 'девяносто',
};

String _russianOrdinal(int value) {
  if (_russianOrdinals[value] case final ordinal?) return ordinal;
  if (value > 20 && value < 100) {
    final tens = value ~/ 10 * 10;
    final units = value % 10;
    return '${_russianTens[tens]} ${_russianOrdinals[units]}';
  }
  return '$value-й';
}

const _englishOrdinals = <int, String>{
  1: 'first',
  2: 'second',
  3: 'third',
  4: 'fourth',
  5: 'fifth',
  6: 'sixth',
  7: 'seventh',
  8: 'eighth',
  9: 'ninth',
  10: 'tenth',
  11: 'eleventh',
  12: 'twelfth',
  13: 'thirteenth',
  14: 'fourteenth',
  15: 'fifteenth',
  16: 'sixteenth',
  17: 'seventeenth',
  18: 'eighteenth',
  19: 'nineteenth',
  20: 'twentieth',
  30: 'thirtieth',
  40: 'fortieth',
  50: 'fiftieth',
  60: 'sixtieth',
  70: 'seventieth',
  80: 'eightieth',
  90: 'ninetieth',
};

const _englishTens = <int, String>{
  20: 'twenty',
  30: 'thirty',
  40: 'forty',
  50: 'fifty',
  60: 'sixty',
  70: 'seventy',
  80: 'eighty',
  90: 'ninety',
};

String _englishOrdinal(int value) {
  if (_englishOrdinals[value] case final ordinal?) return ordinal;
  if (value > 20 && value < 100) {
    final tens = value ~/ 10 * 10;
    final units = value % 10;
    return '${_englishTens[tens]}-${_englishOrdinals[units]}';
  }
  final modulo100 = value.abs() % 100;
  final suffix = switch (modulo100) {
    11 || 12 || 13 => 'th',
    _ => switch (value.abs() % 10) {
        1 => 'st',
        2 => 'nd',
        3 => 'rd',
        _ => 'th',
      },
  };
  return '$value$suffix';
}
