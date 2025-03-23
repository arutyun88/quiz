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
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/authentication/data/converter/user_converter.dart'
    as _i252;
import '../../features/authentication/di/di.dart' as _i415;
import '../../features/authentication/domain/repository/authentication_repository.dart'
    as _i797;
import '../../features/authentication/domain/repository/password_reset_gateway.dart'
    as _i959;
import '../../features/profile/di/di.dart' as _i1038;
import '../../features/profile/domain/repository/change_password_gateway.dart'
    as _i646;
import '../../features/profile/domain/repository/change_user_name_gateway.dart'
    as _i432;
import '../../features/profile/domain/repository/user_update_repository.dart'
    as _i422;
import '../../features/user/di/di.dart' as _i527;
import '../../features/user/domain/repository/user_repository.dart' as _i450;
import '../core/localization/gateway/change_locale_gateway.dart' as _i309;
import '../core/services/firebase_remote_config_service.dart' as _i307;
import '../core/services/firestore_doc_service.dart' as _i141;
import '../core/services/settings_local_storage_service.dart' as _i218;
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
    final localStorageModule = _$LocalStorageModule();
    final userModule = _$UserModule();
    final authenticationModule = _$AuthenticationModule();
    final profileModule = _$ProfileModule();
    final appSettingsModule = _$AppSettingsModule();
    await gh.factoryAsync<_i982.FirebaseApp>(
      () => firebaseConfigModule.firebase(),
      preResolve: true,
    );
    await gh.factoryAsync<_i627.FirebaseRemoteConfig>(
      () => firebaseConfigModule.remoteConfig(),
      preResolve: true,
    );
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => localStorageModule.sharedPreferences(),
      preResolve: true,
    );
    gh.factory<_i450.UserRepository>(() => userModule.userRepository());
    gh.lazySingleton<_i141.FirestoreDocService>(
        () => firebaseConfigModule.firestoreDocService());
    gh.lazySingleton<_i797.AuthenticationRepository>(
        () => authenticationModule.repository());
    gh.lazySingleton<_i959.PasswordResetGateway>(
        () => authenticationModule.passwordResetGateway());
    gh.lazySingleton<_i422.UserUpdateRepository>(
        () => profileModule.userUpdateRepository());
    gh.lazySingleton<_i646.ChangePasswordGateway>(
        () => profileModule.changePasswordGateway());
    gh.lazySingleton<_i432.ChangeUserNameGateway>(
        () => profileModule.changeUserNameGateway());
    await gh.factoryAsync<_i307.FirebaseRemoteConfigService>(
      () => firebaseConfigModule
          .remoteConfigService(gh<_i627.FirebaseRemoteConfig>()),
      preResolve: true,
    );
    gh.lazySingleton<_i218.SettingsLocalStorageService>(() => localStorageModule
        .settingsLocalStorageService(gh<_i460.SharedPreferences>()));
    gh.factory<_i252.UserConverter>(() => _i252.UserConverterImpl());
    gh.lazySingleton<_i309.ChangeLocaleGateway>(() => appSettingsModule
        .changeLocaleGateway(gh<_i218.SettingsLocalStorageService>()));
    return this;
  }
}

class _$FirebaseConfigModule extends _i913.FirebaseConfigModule {}

class _$LocalStorageModule extends _i913.LocalStorageModule {}

class _$UserModule extends _i527.UserModule {}

class _$AuthenticationModule extends _i415.AuthenticationModule {}

class _$ProfileModule extends _i1038.ProfileModule {}

class _$AppSettingsModule extends _i913.AppSettingsModule {}
