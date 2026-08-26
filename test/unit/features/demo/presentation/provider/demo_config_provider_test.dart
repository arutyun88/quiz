import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/demo/presentation/provider/demo_config_provider.dart';

void main() {
  test('uses a bounded remote demo length', () {
    expect(
      DemoConfig.fromRemote('{"question_count": "4"}').questionCount,
      4,
    );
  });

  test('falls back for malformed or unsafe demo lengths', () {
    expect(DemoConfig.fromRemote('').questionCount, 3);
    expect(DemoConfig.fromRemote('{"question_count": 0}').questionCount, 3);
    expect(DemoConfig.fromRemote('{"question_count": 11}').questionCount, 3);
    expect(DemoConfig.fromRemote('not-json').questionCount, 3);
  });
}
