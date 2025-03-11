// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_core/firebase_core.dart' as _i982;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i627;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/services/firebase_remote_config_service.dart' as _i307;
import '../core/services/firestore_doc_service.dart' as _i141;
import 'di.dart' as _i913;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseConfigModule = _$FirebaseConfigModule();
    await gh.factoryAsync<_i982.FirebaseApp>(
      () => firebaseConfigModule.firebase(),
      preResolve: true,
    );
    await gh.factoryAsync<_i627.FirebaseRemoteConfig>(
      () => firebaseConfigModule.remoteConfig(),
      preResolve: true,
    );
    gh.lazySingleton<_i141.FirestoreDocService>(
        () => firebaseConfigModule.firestoreDocService());
    await gh.factoryAsync<_i307.FirebaseRemoteConfigService>(
      () => firebaseConfigModule
          .remoteConfigService(gh<_i627.FirebaseRemoteConfig>()),
      preResolve: true,
    );
    return this;
  }
}

class _$FirebaseConfigModule extends _i913.FirebaseConfigModule {}
