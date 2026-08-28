import 'dart:convert';
import 'dart:io';

import 'package:quiz/app/core/services/remote_config_defaults.dart';

const String defaultOutputPath = 'assets/config/remote_config_defaults.json';

Map<String, Object> extractBundledDefaults(Map<String, dynamic> template) {
  final parameters = template['parameters'];
  if (parameters is! Map<String, dynamic>) {
    throw const FormatException('Firebase template has no parameters object');
  }

  final values = <String, dynamic>{};

  void addParameters(Map<String, dynamic> source) {
    for (final entry in source.entries) {
      final parameter = entry.value;
      if (parameter is! Map<String, dynamic>) continue;
      final defaultValue = parameter['defaultValue'];
      if (defaultValue is! Map<String, dynamic>) continue;
      if (defaultValue.containsKey('value')) {
        values[entry.key] = defaultValue['value'];
      }
    }
  }

  addParameters(parameters);
  final groups = template['parameterGroups'];
  if (groups is Map<String, dynamic>) {
    for (final group in groups.values) {
      if (group is! Map<String, dynamic>) continue;
      final groupedParameters = group['parameters'];
      if (groupedParameters is Map<String, dynamic>) {
        addParameters(groupedParameters);
      }
    }
  }

  return normalizeRemoteConfigDefaults(values);
}

Future<void> updateBundledDefaults({
  required File input,
  required File output,
}) async {
  final decoded = jsonDecode(await input.readAsString());
  if (decoded is! Map<String, dynamic>) {
    throw const FormatException('Firebase template must be a JSON object');
  }

  final defaults = extractBundledDefaults(decoded);
  await output.parent.create(recursive: true);
  final temporaryOutput = File('${output.path}.$pid.tmp');
  try {
    await temporaryOutput.writeAsString(
      '${const JsonEncoder.withIndent('  ').convert(defaults)}\n',
    );
    await temporaryOutput.rename(output.path);
  } finally {
    if (await temporaryOutput.exists()) await temporaryOutput.delete();
  }
}

Future<void> main(List<String> arguments) async {
  if (arguments.isEmpty || arguments.length > 2) {
    stderr.writeln(
      'Usage: dart run tool/update_remote_config_defaults.dart '
      '<firebase-template.json> [output.json]',
    );
    exitCode = 64;
    return;
  }

  await updateBundledDefaults(
    input: File(arguments.first),
    output: File(
      arguments.length == 2 ? arguments[1] : defaultOutputPath,
    ),
  );
}
