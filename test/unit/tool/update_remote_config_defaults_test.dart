import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import '../../../tool/update_remote_config_defaults.dart';

void main() {
  test('exports every default value from a Firebase template', () {
    final defaults = extractBundledDefaults({
      'parameters': {
        'guest_demo_question_count': {
          'defaultValue': {'value': '4'},
        },
        'app_launch_date': {
          'defaultValue': {'value': '2026-08-29'},
        },
        'daily_question_quota': {
          'defaultValue': {'value': '999'},
        },
      },
    });

    expect(defaults, {
      'app_launch_date': '2026-08-29',
      'daily_question_quota': '999',
      'guest_demo_question_count': 4,
    });
  });

  test('includes parameter groups and restores mobile emergency defaults', () {
    final defaults = extractBundledDefaults({
      'parameters': <String, dynamic>{},
      'parameterGroups': {
        'presentation': {
          'parameters': {
            'welcome_title': {
              'defaultValue': {'value': 'Hello'},
            },
          },
        },
      },
    });

    expect(defaults, {
      'app_launch_date': '',
      'guest_demo_question_count': 3,
      'welcome_title': 'Hello',
    });
  });

  test('replaces an existing bundled snapshot', () async {
    final directory = await Directory.systemTemp.createTemp(
      'quiz-remote-config-test-',
    );
    addTearDown(() => directory.delete(recursive: true));
    final input = File('${directory.path}/template.json');
    final output = File('${directory.path}/defaults.json');
    await input.writeAsString(jsonEncode({
      'parameters': {
        'guest_demo_question_count': {
          'defaultValue': {'value': '5'},
        },
        'app_launch_date': {
          'defaultValue': {'value': ''},
        },
      },
    }));
    await output.writeAsString('{"stale":true}');

    await updateBundledDefaults(input: input, output: output);

    expect(jsonDecode(await output.readAsString()), {
      'app_launch_date': '',
      'guest_demo_question_count': 5,
    });
  });
}
