import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@module
abstract class PushModule {
  @lazySingleton
  FirebaseMessaging messaging() => FirebaseMessaging.instance;
}
