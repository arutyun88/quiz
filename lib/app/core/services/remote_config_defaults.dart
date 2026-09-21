import 'dart:convert';

const String guestDemoQuestionCountKey = 'guest_demo_question_count';
const String appLaunchDateKey = 'app_launch_date';
const String logLevelsKey = 'log_levels';
const String defaultLogLevelsValue = '{"production":400,"debug":0}';

typedef LogLevels = ({int production, int debug});

const LogLevels defaultLogLevels = (production: 400, debug: 0);

const Map<String, Object> emergencyRemoteConfigDefaults = {
  guestDemoQuestionCountKey: 3,
  appLaunchDateKey: '',
  logLevelsKey: defaultLogLevelsValue,
};

int? parseGuestDemoQuestionCount(Object? value) {
  final count = switch (value) {
    int value => value,
    String value => int.tryParse(value),
    _ => null,
  };
  return count != null && count >= 1 && count <= 10 ? count : null;
}

String? parseAppLaunchDate(Object? value) {
  if (value == '') return '';
  if (value is! String || value.length != 10) return null;
  final parsed = DateTime.tryParse(value);
  if (parsed == null) return null;
  final date = DateTime.utc(parsed.year, parsed.month, parsed.day);
  return date.toIso8601String().substring(0, 10) == value ? value : null;
}

LogLevels? parseLogLevels(Object? value) {
  Object? decoded = value;
  if (value is String) {
    try {
      decoded = jsonDecode(value);
    } on FormatException {
      return null;
    }
  }
  if (decoded is! Map) return null;

  final production = decoded['production'];
  final debug = decoded['debug'];
  if (production is! int || debug is! int) return null;
  if (production < 0 || production > 2000 || debug < 0 || debug > 2000) {
    return null;
  }
  return (production: production, debug: debug);
}

Map<String, Object> normalizeRemoteConfigDefaults(
  Map<String, dynamic> values,
) {
  final normalized = <String, Object>{};
  for (final entry in values.entries) {
    final value = entry.value;
    if (value is String || value is num || value is bool) {
      normalized[entry.key] = value as Object;
    } else if (value is Map || value is List) {
      normalized[entry.key] = jsonEncode(value);
    }
  }

  normalized[guestDemoQuestionCountKey] =
      parseGuestDemoQuestionCount(values[guestDemoQuestionCountKey]) ??
          emergencyRemoteConfigDefaults[guestDemoQuestionCountKey]!;
  normalized[appLaunchDateKey] = parseAppLaunchDate(values[appLaunchDateKey]) ??
      emergencyRemoteConfigDefaults[appLaunchDateKey]!;
  final logLevels = parseLogLevels(values[logLevelsKey]) ?? defaultLogLevels;
  normalized[logLevelsKey] = jsonEncode({
    'production': logLevels.production,
    'debug': logLevels.debug,
  });
  return normalized;
}
