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

import '../../features/authentication/data/converter/token_converter.dart'
    as _i1062;
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
import '../../features/user/domain/repository/fetch_current_user_gateway.dart'
    as _i678;
import '../../features/user/domain/repository/local_user_repository.dart'
    as _i799;
import '../../features/user/domain/repository/sign_in_with_email_gateway.dart'
    as _i547;
import '../../features/user/domain/repository/sign_up_with_email_gateway.dart'
    as _i803;
import '../../features/user/domain/repository/user_logout_gateway.dart'
    as _i1052;
import '../../features/user/domain/repository/user_repository.dart' as _i450;
import '../core/client/api_client.dart' as _i782;
import '../core/database/app_database.dart' as _i935;
import '../core/localization/gateway/change_locale_gateway.dart' as _i309;
import '../core/services/auth_token_service.dart' as _i422;
import '../core/services/device_id_service.dart' as _i709;
import '../core/services/firebase_remote_config_service.dart' as _i307;
import '../core/services/firestore_doc_service.dart' as _i141;
import '../core/services/settings_local_storage_service.dart' as _i218;
import 'di.dart' as _i913;
import 'network_module.dart' as _i567;

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
    final databaseModule = _$DatabaseModule();
    final profileModule = _$ProfileModule();
    final authenticationModule = _$AuthenticationModule();
    final networkModule = _$NetworkModule();
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
    gh.lazySingleton<_i935.AppDatabase>(() => databaseModule.database());
    gh.lazySingleton<_i141.FirestoreDocService>(
        () => firebaseConfigModule.firestoreDocService());
    gh.lazySingleton<_i422.UserUpdateRepository>(
        () => profileModule.userUpdateRepository());
    gh.lazySingleton<_i646.ChangePasswordGateway>(
        () => profileModule.changePasswordGateway());
    gh.lazySingleton<_i432.ChangeUserInfoGateway>(
        () => profileModule.changeUserInfoGateway());
    gh.lazySingleton<_i959.PasswordResetGateway>(
        () => authenticationModule.passwordResetGateway());
    await gh.factoryAsync<_i307.FirebaseRemoteConfigService>(
      () => firebaseConfigModule
          .remoteConfigService(gh<_i627.FirebaseRemoteConfig>()),
      preResolve: true,
    );
    gh.lazySingleton<_i218.SettingsLocalStorageService>(() => localStorageModule
        .settingsLocalStorageService(gh<_i460.SharedPreferences>()));
    await gh.factoryAsync<_i709.DeviceIdService>(
      () => networkModule.deviceService(gh<_i460.SharedPreferences>()),
      preResolve: true,
    );
    gh.factory<_i1062.TokenConverter>(() => _i1062.TokenConverterImpl());
    gh.factory<_i252.UserConverter>(() => _i252.UserConverterImpl());
    gh.lazySingleton<_i799.LocalUserRepository>(
        () => userModule.cachedUserRepository(
              gh<_i460.SharedPreferences>(),
              gh<_i252.UserConverter>(),
            ));
    gh.singleton<_i422.AuthTokenService>(() =>
        _i422.AuthTokenServicePrefs(prefs: gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i678.FetchCurrentUserGateway>(
        () => userModule.fetchUserGateway(
              gh<_i450.UserRepository>(),
              gh<_i799.LocalUserRepository>(),
            ));
    gh.singleton<_i782.ApiClient>(() => networkModule.apiClient(
          gh<_i709.DeviceIdService>(),
          gh<_i422.AuthTokenService>(),
          gh<_i1062.TokenConverter>(),
        ));
    gh.lazySingleton<_i309.ChangeLocaleGateway>(() => appSettingsModule
        .changeLocaleGateway(gh<_i218.SettingsLocalStorageService>()));
    gh.lazySingleton<_i797.AuthenticationRepository>(
        () => authenticationModule.repository(
              client: gh<_i782.ApiClient>(),
              tokenConverter: gh<_i1062.TokenConverter>(),
            ));
    gh.lazySingleton<_i547.SignInWithEmailGateway>(
        () => _i547.SignInWithEmailGateway(
              authenticationRepository: gh<_i797.AuthenticationRepository>(),
              tokenService: gh<_i422.AuthTokenService>(),
            ));
    gh.lazySingleton<_i803.SignUpWithEmailGateway>(
        () => _i803.SignUpWithEmailGateway(
              authenticationRepository: gh<_i797.AuthenticationRepository>(),
              tokenService: gh<_i422.AuthTokenService>(),
            ));
    gh.lazySingleton<_i1052.UserLogoutGateway>(() => _i1052.UserLogoutGateway(
          authenticationRepository: gh<_i797.AuthenticationRepository>(),
          tokenService: gh<_i422.AuthTokenService>(),
        ));
    return this;
  }
}

class _$FirebaseConfigModule extends _i913.FirebaseConfigModule {}

class _$LocalStorageModule extends _i913.LocalStorageModule {}

class _$UserModule extends _i527.UserModule {}

class _$DatabaseModule extends _i913.DatabaseModule {}

class _$ProfileModule extends _i1038.ProfileModule {}

class _$AuthenticationModule extends _i415.AuthenticationModule {}

class _$NetworkModule extends _i567.NetworkModule {}

class _$AppSettingsModule extends _i913.AppSettingsModule {}
