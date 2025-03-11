import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/app/application.dart';
import 'package:quiz/app/config/firebase/firebase_options.dart';
import 'package:quiz/gen/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    TranslationProvider(
      child: const Application(),
    ),
  );
}
