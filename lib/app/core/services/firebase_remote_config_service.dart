import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;

  FirebaseRemoteConfigService(this._remoteConfig);

  Future<void> init() async {
    try {
      await _remoteConfig.fetchAndActivate();
    } on FirebaseException catch (e) {
      log('Remote Config is not activated: ${e.code}');
    }
  }

  String fetchByKey(String key) => _remoteConfig.getString(key);
}
