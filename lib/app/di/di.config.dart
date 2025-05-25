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
import '../../features/authentication/di/di.dart' as _i415;
import '../../features/authentication/domain/repository/authentication_repository.dart'
    as _i797;
import '../../features/authentication/domain/repository/password_reset_gateway.dart'
    as _i959;
import '../../features/question/data/converter/answer_converter.dart' as _i498;
import '../../features/question/data/converter/answer_db_converter.dart'
    as _i692;
import '../../features/question/data/converter/answered_question_db_converter.dart'
    as _i988;
import '../../features/question/data/converter/answered_statistics_dto_converter.dart'
    as _i1012;
import '../../features/question/data/converter/question_converter.dart'
    as _i622;
import '../../features/question/data/converter/question_db_converter.dart'
    as _i813;
import '../../features/question/data/converter/question_state_dto_converter.dart'
    as _i122;
import '../../features/question/data/converter/topic_converter.dart' as _i625;
import '../../features/question/data/converter/topic_db_converter.dart'
    as _i952;
import '../../features/question/data/service/question_id_service_prefs.dart'
    as _i129;
import '../../features/question/di/di.dart' as _i906;
import '../../features/question/domain/repository/answer_repository.dart'
    as _i209;
import '../../features/question/domain/repository/question_repository.dart'
    as _i240;
import '../../features/question/domain/service/cached_question_service.dart'
    as _i847;
import '../../features/question/domain/service/question_id_service.dart'
    as _i841;
import '../../features/question/domain/use_case/check_question_state_use_case.dart'
    as _i137;
import '../../features/question/domain/use_case/fetch_question_use_case.dart'
    as _i1068;
import '../../features/question/domain/use_case/send_answer_use_case.dart'
    as _i694;
import '../../features/user/data/converter/user_converter.dart' as _i11;
import '../../features/user/data/converter/user_dao_converter.dart' as _i812;
import '../../features/user/data/converter/user_statistics_converter.dart'
    as _i740;
import '../../features/user/di/di.dart' as _i527;
import '../../features/user/domain/repository/change_password_gateway.dart'
    as _i885;
import '../../features/user/domain/repository/change_user_info_gateway.dart'
    as _i482;
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
import '../../features/user/domain/repository/user_statistics_repository.dart'
    as _i632;
import '../core/client/api_client.dart' as _i782;
import '../core/database/app_database.dart' as _i935;
import '../core/database/dao/answered_question_dao.dart' as _i426;
import '../core/database/dao/question_dao.dart' as _i265;
import '../core/localization/gateway/change_locale_gateway.dart' as _i309;
import '../core/model/data_page/page_info_converter.dart' as _i724;
import '../core/services/auth_token_service.dart' as _i422;
import '../core/services/device_id_service.dart' as _i709;
import '../core/services/firebase_remote_config_service.dart' as _i307;
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
    final databaseModule = _$DatabaseModule();
    final authenticationModule = _$AuthenticationModule();
    final networkModule = _$NetworkModule();
    final questionModule = _$QuestionModule();
    final userModule = _$UserModule();
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
    gh.lazySingleton<_i935.AppDatabase>(() => databaseModule.database());
    gh.lazySingleton<_i959.PasswordResetGateway>(
        () => authenticationModule.passwordResetGateway());
    gh.factory<_i625.TopicConverter>(() => _i625.TopicConverterImpl());
    gh.factory<_i498.AnswerConverter>(() => _i498.AnswerConverterImpl());
    await gh.factoryAsync<_i307.FirebaseRemoteConfigService>(
      () => firebaseConfigModule
          .remoteConfigService(gh<_i627.FirebaseRemoteConfig>()),
      preResolve: true,
    );
    gh.factory<_i988.AnsweredQuestionDbConverter>(
        () => const _i988.AnsweredQuestionDbConverterImpl());
    gh.lazySingleton<_i218.SettingsLocalStorageService>(() => localStorageModule
        .settingsLocalStorageService(gh<_i460.SharedPreferences>()));
    await gh.factoryAsync<_i709.DeviceIdService>(
      () => networkModule.deviceService(gh<_i460.SharedPreferences>()),
      preResolve: true,
    );
    gh.factory<_i952.TopicDbConverter>(() => _i952.TopicDbConverterImpl());
    gh.factory<_i740.UserStatisticsConverter>(
        () => _i740.UserStatisticsConverterImpl());
    gh.factory<_i1062.TokenConverter>(() => _i1062.TokenConverterImpl());
    gh.factory<_i622.QuestionConverter>(() => _i622.QuestionConverterImpl(
          topicConverter: gh<_i625.TopicConverter>(),
          answerConverter: gh<_i498.AnswerConverter>(),
        ));
    gh.factory<_i812.UserDaoConverter>(() => _i812.UserDaoConverterImpl());
    gh.factory<_i11.UserConverter>(() => _i11.UserConverterImpl());
    gh.factory<_i692.AnswerDbConverter>(() => _i692.AnswerDbConverterImpl());
    gh.factory<_i122.QuestionStateDtoConverter>(
        () => _i122.QuestionStateDtoConverterImpl());
    gh.singleton<_i724.PageInfoConverter>(() => _i724.PageInfoConverterImpl());
    gh.singleton<_i422.AuthTokenService>(() =>
        _i422.AuthTokenServicePrefs(prefs: gh<_i460.SharedPreferences>()));
    gh.singleton<_i841.QuestionIdService>(() =>
        _i129.QuestionIdServicePrefs(prefs: gh<_i460.SharedPreferences>()));
    gh.factory<_i622.QuestionPageConverter>(
        () => questionModule.questionpageConverter(
              gh<_i622.QuestionConverter>(),
              gh<_i724.PageInfoConverter>(),
            ));
    gh.lazySingleton<_i799.LocalUserRepository>(
        () => userModule.cachedUserRepository(
              gh<_i460.SharedPreferences>(),
              gh<_i812.UserDaoConverter>(),
            ));
    gh.factory<_i813.QuestionDbConverter>(() => _i813.QuestionDbConverterImpl(
          answerConverter: gh<_i692.AnswerDbConverter>(),
          topicConverter: gh<_i952.TopicDbConverter>(),
        ));
    gh.factory<_i426.AnsweredQuestionDao>(() => _i426.AnsweredQuestionDaoImpl(
          gh<_i935.AppDatabase>(),
          answeredQuestionDbConverter: gh<_i988.AnsweredQuestionDbConverter>(),
        ));
    gh.factory<_i1012.AnsweredStatisticsDtoConverter>(() =>
        _i1012.AnsweredStatisticsDtoConverterImpl(
            userStatisticsConverter: gh<_i740.UserStatisticsConverter>()));
    gh.lazySingleton<_i309.ChangeLocaleGateway>(() => appSettingsModule
        .changeLocaleGateway(gh<_i218.SettingsLocalStorageService>()));
    gh.singleton<_i782.ApiClient>(() => networkModule.apiClient(
          gh<_i709.DeviceIdService>(),
          gh<_i422.AuthTokenService>(),
          gh<_i1062.TokenConverter>(),
          gh<_i218.SettingsLocalStorageService>(),
        ));
    gh.lazySingleton<_i797.AuthenticationRepository>(
        () => authenticationModule.repository(
              client: gh<_i782.ApiClient>(),
              tokenConverter: gh<_i1062.TokenConverter>(),
            ));
    gh.lazySingleton<_i240.QuestionRepository>(
        () => questionModule.questionRepository(
              client: gh<_i782.ApiClient>(),
              questionpageConverter: gh<_i622.QuestionPageConverter>(),
              questionStateDtoConverter: gh<_i122.QuestionStateDtoConverter>(),
            ));
    gh.lazySingleton<_i209.AnswerRepository>(
        () => questionModule.answerRepository(
              client: gh<_i782.ApiClient>(),
              answerConverter: gh<_i1012.AnsweredStatisticsDtoConverter>(),
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
    gh.factory<_i450.UserRepository>(() => userModule.userRepository(
          client: gh<_i782.ApiClient>(),
          userConverter: gh<_i11.UserConverter>(),
        ));
    gh.factory<_i265.QuestionDao>(() => _i265.QuestionDaoImpl(
          gh<_i935.AppDatabase>(),
          questionConverter: gh<_i813.QuestionDbConverter>(),
        ));
    gh.lazySingleton<_i678.FetchCurrentUserGateway>(
        () => userModule.fetchUserGateway(
              gh<_i450.UserRepository>(),
              gh<_i799.LocalUserRepository>(),
            ));
    gh.factory<_i1068.FetchQuestionUseCase>(
        () => _i1068.FetchQuestionUseCaseImpl(
              questionRepository: gh<_i240.QuestionRepository>(),
              questionDao: gh<_i265.QuestionDao>(),
            ));
    gh.factory<_i847.CachedQuestionService>(
        () => _i847.CachedQuestionServiceImpl(
              database: gh<_i935.AppDatabase>(),
              questionDao: gh<_i265.QuestionDao>(),
              answeredQuestionDao: gh<_i426.AnsweredQuestionDao>(),
            ));
    gh.lazySingleton<_i632.UserStatisticsRepository>(
        () => userModule.userStatisticsRepository(
              gh<_i782.ApiClient>(),
              gh<_i740.UserStatisticsConverter>(),
            ));
    gh.lazySingleton<_i482.ChangeUserInfoGateway>(
        () => userModule.changeUserInfoGateway(gh<_i450.UserRepository>()));
    gh.lazySingleton<_i885.ChangePasswordGateway>(
        () => userModule.changePasswordGateway(gh<_i450.UserRepository>()));
    gh.factory<_i137.CheckQuestionStateUseCase>(
        () => _i137.CheckQuestionStateUseCaseImpl(
              questionRepository: gh<_i240.QuestionRepository>(),
              tokenService: gh<_i422.AuthTokenService>(),
              answeredQuestionDao: gh<_i426.AnsweredQuestionDao>(),
            ));
    gh.factory<_i694.SendAnswerUseCase>(() => _i694.SendAnswerUseCaseImpl(
          answerRepository: gh<_i209.AnswerRepository>(),
          tokenService: gh<_i422.AuthTokenService>(),
          cachedQuestionService: gh<_i847.CachedQuestionService>(),
        ));
    return this;
  }
}

class _$FirebaseConfigModule extends _i913.FirebaseConfigModule {}

class _$LocalStorageModule extends _i913.LocalStorageModule {}

class _$DatabaseModule extends _i913.DatabaseModule {}

class _$AuthenticationModule extends _i415.AuthenticationModule {}

class _$NetworkModule extends _i567.NetworkModule {}

class _$QuestionModule extends _i906.QuestionModule {}

class _$UserModule extends _i527.UserModule {}

class _$AppSettingsModule extends _i913.AppSettingsModule {}
