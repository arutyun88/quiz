import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;

  FirebaseRemoteConfigService(this._remoteConfig);

  Future<void> init() async => await _remoteConfig.fetchAndActivate();

  String fetchByKey(String key) => _remoteConfig.getString(key);
}
