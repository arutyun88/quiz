import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz/app/config/firebase/firebase_options.dart';
import 'package:quiz/app/core/localization/gateway/change_locale_gateway.dart';
import 'package:quiz/app/core/services/firestore_doc_service.dart';
import 'package:quiz/app/core/services/firebase_remote_config_service.dart';
import 'package:quiz/app/core/services/settings_local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: true)
Future<void> configureDependencies() async => await getIt.init();

@module
abstract class FirebaseConfigModule {
  @preResolve
  Future<FirebaseApp> firebase() async => await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  @preResolve
  Future<FirebaseRemoteConfig> remoteConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 10),
      ),
    );
    return remoteConfig;
  }

  @preResolve
  Future<FirebaseRemoteConfigService> remoteConfigService(FirebaseRemoteConfig config) async {
    final service = FirebaseRemoteConfigService(config);
    await service.init();
    return service;
  }

  @lazySingleton
  FirestoreDocService firestoreDocService() => FirestoreDocService(firestore: FirebaseFirestore.instance);
}

@module
abstract class LocalStorageModule {
  @preResolve
  Future<SharedPreferences> sharedPreferences() async => await SharedPreferences.getInstance();

  @lazySingleton
  SettingsLocalStorageService settingsLocalStorageService(SharedPreferences preferences) =>
      SettingsLocalStorageService(prefs: preferences);
}

@module
abstract class AppSettingsModule {
  @lazySingleton
  ChangeLocaleGateway changeLocaleGateway(SettingsLocalStorageService storageService) =>
      ChangeLocaleGateway(storageService: storageService);
}
