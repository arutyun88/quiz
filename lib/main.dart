import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/application.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/gen/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await configureDependencies();

  final container = ProviderContainer();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: TranslationProvider(
        child: const Application(),
      ),
    ),
  );
}
