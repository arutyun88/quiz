import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  if (arguments.length != 2) {
    stderr.writeln(
      'Usage: dart run tool/filter_release_android_plugins.dart input output',
    );
    exitCode = 64;
    return;
  }

  final input = File(arguments[0]);
  final output = File(arguments[1]);
  final root = jsonDecode(input.readAsStringSync()) as Map<String, dynamic>;
  final plugins = root['plugins'] as Map<String, dynamic>;
  final android = plugins['android'] as List<dynamic>;
  plugins['android'] = android.where((entry) {
    final plugin = entry as Map<String, dynamic>;
    return plugin['dev_dependency'] != true;
  }).toList(growable: false);
  output.writeAsStringSync(jsonEncode(root));
}
