///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsRu with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override Map<String, String> get languages => {
		'en': 'English',
		'ru': 'Русский',
	};
	@override late final _TranslationsTextFieldRu text_field = _TranslationsTextFieldRu._(_root);
	@override late final _TranslationsProfileRu profile = _TranslationsProfileRu._(_root);
	@override late final _TranslationsAuthenticationRu authentication = _TranslationsAuthenticationRu._(_root);
	@override late final _TranslationsLeaderboardRu leaderboard = _TranslationsLeaderboardRu._(_root);
	@override late final _TranslationsGamificationRu gamification = _TranslationsGamificationRu._(_root);
	@override late final _TranslationsAchievementsRu achievements = _TranslationsAchievementsRu._(_root);
	@override late final _TranslationsQuestionRu question = _TranslationsQuestionRu._(_root);
}

// Path: text_field
class _TranslationsTextFieldRu implements TranslationsTextFieldEn {
	_TranslationsTextFieldRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsTextFieldEmailRu email = _TranslationsTextFieldEmailRu._(_root);
	@override late final _TranslationsTextFieldPasswordRu password = _TranslationsTextFieldPasswordRu._(_root);
	@override late final _TranslationsTextFieldConfirmPasswordRu confirm_password = _TranslationsTextFieldConfirmPasswordRu._(_root);
}

// Path: profile
class _TranslationsProfileRu implements TranslationsProfileEn {
	_TranslationsProfileRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Профиль';
	@override late final _TranslationsProfileSettingsRu settings = _TranslationsProfileSettingsRu._(_root);
	@override late final _TranslationsProfileEditRu edit = _TranslationsProfileEditRu._(_root);
}

// Path: authentication
class _TranslationsAuthenticationRu implements TranslationsAuthenticationEn {
	_TranslationsAuthenticationRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsAuthenticationFailureRu failure = _TranslationsAuthenticationFailureRu._(_root);
	@override late final _TranslationsAuthenticationSignInRu sign_in = _TranslationsAuthenticationSignInRu._(_root);
	@override late final _TranslationsAuthenticationSignUpRu sign_up = _TranslationsAuthenticationSignUpRu._(_root);
	@override TextSpan agreement({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'Используя приложение, вы соглашаетесь на обработку персональных данных согласно '),
		link('Пользовательскому соглашению'),
	]);
}

// Path: leaderboard
class _TranslationsLeaderboardRu implements TranslationsLeaderboardEn {
	_TranslationsLeaderboardRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Рейтинг';
	@override String get my_position => 'Моя позиция';
	@override String get empty => 'Нет активности за этот период';
	@override late final _TranslationsLeaderboardPeriodsRu periods = _TranslationsLeaderboardPeriodsRu._(_root);
}

// Path: gamification
class _TranslationsGamificationRu implements TranslationsGamificationEn {
	_TranslationsGamificationRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String level({required Object level}) => 'Уровень ${level}';
	@override String level_short({required Object level}) => 'Ур. ${level}';
	@override String xp({required Object current, required Object total}) => '${current} / ${total} XP';
	@override String xp_remaining({required Object remaining}) => 'ещё ${remaining} XP';
	@override String streak({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		one: '${n} день подряд',
		few: '${n} дня подряд',
		many: '${n} дней подряд',
		other: '${n} дней подряд',
	);
	@override String points({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		one: '${n} очко',
		few: '${n} очка',
		many: '${n} очков',
		other: '${n} очков',
	);
	@override String accuracy({required Object value}) => '${value}% точность';
	@override String get achievements_link => 'Достижения';
	@override String get streak_days => 'Дней подряд';
	@override String get questions_answered => 'Вопросов';
	@override String get correct_answers => 'Правильных';
	@override String get points_label => 'Очков';
	@override String get accuracy_label => 'Точность';
}

// Path: achievements
class _TranslationsAchievementsRu implements TranslationsAchievementsEn {
	_TranslationsAchievementsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Достижения';
	@override late final _TranslationsAchievementsCategoriesRu categories = _TranslationsAchievementsCategoriesRu._(_root);
	@override String get error => 'Не удалось загрузить';
	@override String get retry => 'Повторить';
}

// Path: question
class _TranslationsQuestionRu implements TranslationsQuestionEn {
	_TranslationsQuestionRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsQuestionDialogRu dialog = _TranslationsQuestionDialogRu._(_root);
	@override late final _TranslationsQuestionErrorSnackbarRu error_snackbar = _TranslationsQuestionErrorSnackbarRu._(_root);
}

// Path: text_field.email
class _TranslationsTextFieldEmailRu implements TranslationsTextFieldEmailEn {
	_TranslationsTextFieldEmailRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Email';
	@override String get hint => 'Введите ваш email-адрес';
	@override String get validation_message => 'Неверный формат электронной почты';
}

// Path: text_field.password
class _TranslationsTextFieldPasswordRu implements TranslationsTextFieldPasswordEn {
	_TranslationsTextFieldPasswordRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Пароль';
	@override String get hint => 'Минимум 8 символов, буквы и цифры';
	@override String get validation_message => '8+ символов: 1 заглавная, 1 строчная, 1 цифра';
}

// Path: text_field.confirm_password
class _TranslationsTextFieldConfirmPasswordRu implements TranslationsTextFieldConfirmPasswordEn {
	_TranslationsTextFieldConfirmPasswordRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Подтвердите пароль';
	@override String get hint => 'Повторите введенный пароль';
}

// Path: profile.settings
class _TranslationsProfileSettingsRu implements TranslationsProfileSettingsEn {
	_TranslationsProfileSettingsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Настройки';
	@override late final _TranslationsProfileSettingsUserRu user = _TranslationsProfileSettingsUserRu._(_root);
	@override late final _TranslationsProfileSettingsApplicationRu application = _TranslationsProfileSettingsApplicationRu._(_root);
	@override String get sign_out => 'Выйти из профиля';
	@override String get sign_in => 'Войти или зарегистрироваться';
}

// Path: profile.edit
class _TranslationsProfileEditRu implements TranslationsProfileEditEn {
	_TranslationsProfileEditRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Редактировать профиль';
	@override late final _TranslationsProfileEditPasswordRu password = _TranslationsProfileEditPasswordRu._(_root);
	@override late final _TranslationsProfileEditMainRu main = _TranslationsProfileEditMainRu._(_root);
}

// Path: authentication.failure
class _TranslationsAuthenticationFailureRu implements TranslationsAuthenticationFailureEn {
	_TranslationsAuthenticationFailureRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get invalid_credentials => 'Неверные учетные данные. Проверьте правильность введенного email и пароля.';
	@override String get too_many_requests => 'Слишком много попыток входа. Попробуйте позже или сбросьте пароль.';
	@override String get already_exist => 'Этот email уже используется другим аккаунтом.';
	@override String get unknown => 'Произошла ошибка при аутентификации. Пожалуйста, попробуйте снова.';
}

// Path: authentication.sign_in
class _TranslationsAuthenticationSignInRu implements TranslationsAuthenticationSignInEn {
	_TranslationsAuthenticationSignInRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsAuthenticationSignInNoAccountRu no_account = _TranslationsAuthenticationSignInNoAccountRu._(_root);
	@override String get button => 'Войти';
	@override String get title => 'Войти в аккаунт';
	@override late final _TranslationsAuthenticationSignInForgetPasswordRu forget_password = _TranslationsAuthenticationSignInForgetPasswordRu._(_root);
}

// Path: authentication.sign_up
class _TranslationsAuthenticationSignUpRu implements TranslationsAuthenticationSignUpEn {
	_TranslationsAuthenticationSignUpRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsAuthenticationSignUpHaveAccountRu have_account = _TranslationsAuthenticationSignUpHaveAccountRu._(_root);
	@override late final _TranslationsAuthenticationSignUpConfirmPasswordRu confirm_password = _TranslationsAuthenticationSignUpConfirmPasswordRu._(_root);
	@override String get button => 'Зарегистрироваться';
	@override String get title => 'Зарегистрироваться';
}

// Path: leaderboard.periods
class _TranslationsLeaderboardPeriodsRu implements TranslationsLeaderboardPeriodsEn {
	_TranslationsLeaderboardPeriodsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get daily => 'дня';
	@override String get weekly => 'недели';
	@override String get monthly => 'месяца';
	@override String get yearly => 'года';
}

// Path: achievements.categories
class _TranslationsAchievementsCategoriesRu implements TranslationsAchievementsCategoriesEn {
	_TranslationsAchievementsCategoriesRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get beginner => 'Начинающий';
	@override String get progress => 'Прогресс';
	@override String get accuracy => 'Точность';
	@override String get streak => 'Серия';
	@override String get points => 'Очки';
}

// Path: question.dialog
class _TranslationsQuestionDialogRu implements TranslationsQuestionDialogEn {
	_TranslationsQuestionDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsQuestionDialogCorrectRu correct = _TranslationsQuestionDialogCorrectRu._(_root);
	@override late final _TranslationsQuestionDialogIncorrectRu incorrect = _TranslationsQuestionDialogIncorrectRu._(_root);
	@override String get button => 'Продолжить';
}

// Path: question.error_snackbar
class _TranslationsQuestionErrorSnackbarRu implements TranslationsQuestionErrorSnackbarEn {
	_TranslationsQuestionErrorSnackbarRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsQuestionErrorSnackbarAnsweredOnAnotherDeviceRu answered_on_another_device = _TranslationsQuestionErrorSnackbarAnsweredOnAnotherDeviceRu._(_root);
	@override late final _TranslationsQuestionErrorSnackbarAlreadyAnsweredRu already_answered = _TranslationsQuestionErrorSnackbarAlreadyAnsweredRu._(_root);
	@override late final _TranslationsQuestionErrorSnackbarSaveFailedRetryLaterRu save_failed_retry_later = _TranslationsQuestionErrorSnackbarSaveFailedRetryLaterRu._(_root);
}

// Path: profile.settings.user
class _TranslationsProfileSettingsUserRu implements TranslationsProfileSettingsUserEn {
	_TranslationsProfileSettingsUserRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Настройки';
	@override String get go_to_edit => 'Редактировать профиль';
	@override String get go_to_notifications_settings => 'Настройки уведомлений';
	@override String get go_to_subscriptions => 'Управление подпиской';
}

// Path: profile.settings.application
class _TranslationsProfileSettingsApplicationRu implements TranslationsProfileSettingsApplicationEn {
	_TranslationsProfileSettingsApplicationRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Приложение';
	@override late final _TranslationsProfileSettingsApplicationLanguageRu language = _TranslationsProfileSettingsApplicationLanguageRu._(_root);
	@override late final _TranslationsProfileSettingsApplicationThemeRu theme = _TranslationsProfileSettingsApplicationThemeRu._(_root);
	@override String get go_to_storage_manager => 'Менеджер памяти';
	@override String get go_to_about_app => 'О приложении';
}

// Path: profile.edit.password
class _TranslationsProfileEditPasswordRu implements TranslationsProfileEditPasswordEn {
	_TranslationsProfileEditPasswordRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Изменить пароль';
	@override String get old_password_hint => 'Введите старый пароль';
	@override String get new_password_hint => 'Введите новый пароль';
	@override String get new_confirm_password_hint => 'Повторите новый пароль';
	@override String get confirm_password_validation_message => 'Пароли не совпадают';
	@override String get button => 'Сохранить';
	@override late final _TranslationsProfileEditPasswordResultRu result = _TranslationsProfileEditPasswordResultRu._(_root);
}

// Path: profile.edit.main
class _TranslationsProfileEditMainRu implements TranslationsProfileEditMainEn {
	_TranslationsProfileEditMainRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Основная информация';
	@override late final _TranslationsProfileEditMainNameRu name = _TranslationsProfileEditMainNameRu._(_root);
	@override late final _TranslationsProfileEditMainDateRu date = _TranslationsProfileEditMainDateRu._(_root);
	@override late final _TranslationsProfileEditMainResultRu result = _TranslationsProfileEditMainResultRu._(_root);
}

// Path: authentication.sign_in.no_account
class _TranslationsAuthenticationSignInNoAccountRu implements TranslationsAuthenticationSignInNoAccountEn {
	_TranslationsAuthenticationSignInNoAccountRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get text => 'Нет аккаунта?';
	@override String get sign_up => 'Зарегистрироваться';
}

// Path: authentication.sign_in.forget_password
class _TranslationsAuthenticationSignInForgetPasswordRu implements TranslationsAuthenticationSignInForgetPasswordEn {
	_TranslationsAuthenticationSignInForgetPasswordRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get button => 'Не помню пароль';
	@override late final _TranslationsAuthenticationSignInForgetPasswordDialogRu dialog = _TranslationsAuthenticationSignInForgetPasswordDialogRu._(_root);
}

// Path: authentication.sign_up.have_account
class _TranslationsAuthenticationSignUpHaveAccountRu implements TranslationsAuthenticationSignUpHaveAccountEn {
	_TranslationsAuthenticationSignUpHaveAccountRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get text => 'Есть аккаунт?';
	@override String get sign_in => 'Войти';
}

// Path: authentication.sign_up.confirm_password
class _TranslationsAuthenticationSignUpConfirmPasswordRu implements TranslationsAuthenticationSignUpConfirmPasswordEn {
	_TranslationsAuthenticationSignUpConfirmPasswordRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Подтверждение пароля';
	@override String get hint => 'Повторите пароль';
	@override String get validation_message => 'Пароли не совпадают';
}

// Path: question.dialog.correct
class _TranslationsQuestionDialogCorrectRu implements TranslationsQuestionDialogCorrectEn {
	_TranslationsQuestionDialogCorrectRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override List<String> get header => [
		'Отлично, вы абсолютно правы',
		'Верно, так держать',
	];
	@override List<String> get prompt => [
		'Готовы продолжить?',
		'Переходим к следующему вопросу?',
	];
}

// Path: question.dialog.incorrect
class _TranslationsQuestionDialogIncorrectRu implements TranslationsQuestionDialogIncorrectEn {
	_TranslationsQuestionDialogIncorrectRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override List<String> get header => [
		'Правильный ответ:',
		'На самом деле:',
	];
	@override List<String> get prompt => [
		'Не переживайте!\nДавайте двигаться дальше?',
		'Переходим к следующему вопросу?',
	];
}

// Path: question.error_snackbar.answered_on_another_device
class _TranslationsQuestionErrorSnackbarAnsweredOnAnotherDeviceRu implements TranslationsQuestionErrorSnackbarAnsweredOnAnotherDeviceEn {
	_TranslationsQuestionErrorSnackbarAnsweredOnAnotherDeviceRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get text => 'Этот вопрос уже был отвечен на другом устройстве. Он больше не повторится.';
	@override String get button => 'Понятно';
}

// Path: question.error_snackbar.already_answered
class _TranslationsQuestionErrorSnackbarAlreadyAnsweredRu implements TranslationsQuestionErrorSnackbarAlreadyAnsweredEn {
	_TranslationsQuestionErrorSnackbarAlreadyAnsweredRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get text => 'Этот вопрос у вас уже в копилке ответов и не будет перезаписан';
	@override String get button => 'Понятно';
}

// Path: question.error_snackbar.save_failed_retry_later
class _TranslationsQuestionErrorSnackbarSaveFailedRetryLaterRu implements TranslationsQuestionErrorSnackbarSaveFailedRetryLaterEn {
	_TranslationsQuestionErrorSnackbarSaveFailedRetryLaterRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get text => 'Упс! Ответ не сохранился, но вопрос вернётся позже. У вас будет ещё шанс!';
	@override String get button => 'Попробую позже';
}

// Path: profile.settings.application.language
class _TranslationsProfileSettingsApplicationLanguageRu implements TranslationsProfileSettingsApplicationLanguageEn {
	_TranslationsProfileSettingsApplicationLanguageRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get change => 'Изменить язык';
}

// Path: profile.settings.application.theme
class _TranslationsProfileSettingsApplicationThemeRu implements TranslationsProfileSettingsApplicationThemeEn {
	_TranslationsProfileSettingsApplicationThemeRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Тема оформления';
	@override late final _TranslationsProfileSettingsApplicationThemeSwitcherRu switcher = _TranslationsProfileSettingsApplicationThemeSwitcherRu._(_root);
}

// Path: profile.edit.password.result
class _TranslationsProfileEditPasswordResultRu implements TranslationsProfileEditPasswordResultEn {
	_TranslationsProfileEditPasswordResultRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get success => 'Пароль успешно изменен';
	@override String get failed => 'Не удалось изменить пароль. Пожалуйста, проверьте введенные данные и попробуйте снова';
}

// Path: profile.edit.main.name
class _TranslationsProfileEditMainNameRu implements TranslationsProfileEditMainNameEn {
	_TranslationsProfileEditMainNameRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Имя';
	@override String get hint => 'Введите ваше имя';
}

// Path: profile.edit.main.date
class _TranslationsProfileEditMainDateRu implements TranslationsProfileEditMainDateEn {
	_TranslationsProfileEditMainDateRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get hint => 'Укажите дату вашего рождения';
	@override late final _TranslationsProfileEditMainDatePickerRu picker = _TranslationsProfileEditMainDatePickerRu._(_root);
}

// Path: profile.edit.main.result
class _TranslationsProfileEditMainResultRu implements TranslationsProfileEditMainResultEn {
	_TranslationsProfileEditMainResultRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get success => 'Информация успешно изменена';
	@override String get failed => 'Не удалось изменить информацию. Пожалуйста, проверьте введенные данные и попробуйте снова';
}

// Path: authentication.sign_in.forget_password.dialog
class _TranslationsAuthenticationSignInForgetPasswordDialogRu implements TranslationsAuthenticationSignInForgetPasswordDialogEn {
	_TranslationsAuthenticationSignInForgetPasswordDialogRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Восстановление пароля';
	@override late final _TranslationsAuthenticationSignInForgetPasswordDialogValidRu valid = _TranslationsAuthenticationSignInForgetPasswordDialogValidRu._(_root);
	@override late final _TranslationsAuthenticationSignInForgetPasswordDialogInvalidRu invalid = _TranslationsAuthenticationSignInForgetPasswordDialogInvalidRu._(_root);
	@override late final _TranslationsAuthenticationSignInForgetPasswordDialogResultRu result = _TranslationsAuthenticationSignInForgetPasswordDialogResultRu._(_root);
}

// Path: profile.settings.application.theme.switcher
class _TranslationsProfileSettingsApplicationThemeSwitcherRu implements TranslationsProfileSettingsApplicationThemeSwitcherEn {
	_TranslationsProfileSettingsApplicationThemeSwitcherRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get as_system => 'Как в системе';
}

// Path: profile.edit.main.date.picker
class _TranslationsProfileEditMainDatePickerRu implements TranslationsProfileEditMainDatePickerEn {
	_TranslationsProfileEditMainDatePickerRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Дата рождения';
	@override late final _TranslationsProfileEditMainDatePickerButtonRu button = _TranslationsProfileEditMainDatePickerButtonRu._(_root);
}

// Path: authentication.sign_in.forget_password.dialog.valid
class _TranslationsAuthenticationSignInForgetPasswordDialogValidRu implements TranslationsAuthenticationSignInForgetPasswordDialogValidEn {
	_TranslationsAuthenticationSignInForgetPasswordDialogValidRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Сбросить';
	@override String get cancel => 'Отмена';
	@override String get description => 'Вы действительно хотите сбросить пароль?';
}

// Path: authentication.sign_in.forget_password.dialog.invalid
class _TranslationsAuthenticationSignInForgetPasswordDialogInvalidRu implements TranslationsAuthenticationSignInForgetPasswordDialogInvalidEn {
	_TranslationsAuthenticationSignInForgetPasswordDialogInvalidRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get button => 'Хорошо';
	@override String get description => 'Введите корректный адрес электронной почты.';
}

// Path: authentication.sign_in.forget_password.dialog.result
class _TranslationsAuthenticationSignInForgetPasswordDialogResultRu implements TranslationsAuthenticationSignInForgetPasswordDialogResultEn {
	_TranslationsAuthenticationSignInForgetPasswordDialogResultRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get success => 'Ссылка на сброс пароля отправлена на вашу почту. Ссылка действительна в течение 1 часа.';
	@override String get failed => 'Не удалось отправить ссылку для сброса пароля. Пожалуйста, попробуйте позже.';
}

// Path: profile.edit.main.date.picker.button
class _TranslationsProfileEditMainDatePickerButtonRu implements TranslationsProfileEditMainDatePickerButtonEn {
	_TranslationsProfileEditMainDatePickerButtonRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Отмена';
	@override String get apply => 'Готово';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'languages.en' => 'English',
			'languages.ru' => 'Русский',
			'text_field.email.label' => 'Email',
			'text_field.email.hint' => 'Введите ваш email-адрес',
			'text_field.email.validation_message' => 'Неверный формат электронной почты',
			'text_field.password.label' => 'Пароль',
			'text_field.password.hint' => 'Минимум 8 символов, буквы и цифры',
			'text_field.password.validation_message' => '8+ символов: 1 заглавная, 1 строчная, 1 цифра',
			'text_field.confirm_password.label' => 'Подтвердите пароль',
			'text_field.confirm_password.hint' => 'Повторите введенный пароль',
			'profile.title' => 'Профиль',
			'profile.settings.title' => 'Настройки',
			'profile.settings.user.title' => 'Настройки',
			'profile.settings.user.go_to_edit' => 'Редактировать профиль',
			'profile.settings.user.go_to_notifications_settings' => 'Настройки уведомлений',
			'profile.settings.user.go_to_subscriptions' => 'Управление подпиской',
			'profile.settings.application.title' => 'Приложение',
			'profile.settings.application.language.change' => 'Изменить язык',
			'profile.settings.application.theme.title' => 'Тема оформления',
			'profile.settings.application.theme.switcher.as_system' => 'Как в системе',
			'profile.settings.application.go_to_storage_manager' => 'Менеджер памяти',
			'profile.settings.application.go_to_about_app' => 'О приложении',
			'profile.settings.sign_out' => 'Выйти из профиля',
			'profile.settings.sign_in' => 'Войти или зарегистрироваться',
			'profile.edit.title' => 'Редактировать профиль',
			'profile.edit.password.title' => 'Изменить пароль',
			'profile.edit.password.old_password_hint' => 'Введите старый пароль',
			'profile.edit.password.new_password_hint' => 'Введите новый пароль',
			'profile.edit.password.new_confirm_password_hint' => 'Повторите новый пароль',
			'profile.edit.password.confirm_password_validation_message' => 'Пароли не совпадают',
			'profile.edit.password.button' => 'Сохранить',
			'profile.edit.password.result.success' => 'Пароль успешно изменен',
			'profile.edit.password.result.failed' => 'Не удалось изменить пароль. Пожалуйста, проверьте введенные данные и попробуйте снова',
			'profile.edit.main.title' => 'Основная информация',
			'profile.edit.main.name.label' => 'Имя',
			'profile.edit.main.name.hint' => 'Введите ваше имя',
			'profile.edit.main.date.hint' => 'Укажите дату вашего рождения',
			'profile.edit.main.date.picker.title' => 'Дата рождения',
			'profile.edit.main.date.picker.button.cancel' => 'Отмена',
			'profile.edit.main.date.picker.button.apply' => 'Готово',
			'profile.edit.main.result.success' => 'Информация успешно изменена',
			'profile.edit.main.result.failed' => 'Не удалось изменить информацию. Пожалуйста, проверьте введенные данные и попробуйте снова',
			'authentication.failure.invalid_credentials' => 'Неверные учетные данные. Проверьте правильность введенного email и пароля.',
			'authentication.failure.too_many_requests' => 'Слишком много попыток входа. Попробуйте позже или сбросьте пароль.',
			'authentication.failure.already_exist' => 'Этот email уже используется другим аккаунтом.',
			'authentication.failure.unknown' => 'Произошла ошибка при аутентификации. Пожалуйста, попробуйте снова.',
			'authentication.sign_in.no_account.text' => 'Нет аккаунта?',
			'authentication.sign_in.no_account.sign_up' => 'Зарегистрироваться',
			'authentication.sign_in.button' => 'Войти',
			'authentication.sign_in.title' => 'Войти в аккаунт',
			'authentication.sign_in.forget_password.button' => 'Не помню пароль',
			'authentication.sign_in.forget_password.dialog.title' => 'Восстановление пароля',
			'authentication.sign_in.forget_password.dialog.valid.accept' => 'Сбросить',
			'authentication.sign_in.forget_password.dialog.valid.cancel' => 'Отмена',
			'authentication.sign_in.forget_password.dialog.valid.description' => 'Вы действительно хотите сбросить пароль?',
			'authentication.sign_in.forget_password.dialog.invalid.button' => 'Хорошо',
			'authentication.sign_in.forget_password.dialog.invalid.description' => 'Введите корректный адрес электронной почты.',
			'authentication.sign_in.forget_password.dialog.result.success' => 'Ссылка на сброс пароля отправлена на вашу почту. Ссылка действительна в течение 1 часа.',
			'authentication.sign_in.forget_password.dialog.result.failed' => 'Не удалось отправить ссылку для сброса пароля. Пожалуйста, попробуйте позже.',
			'authentication.sign_up.have_account.text' => 'Есть аккаунт?',
			'authentication.sign_up.have_account.sign_in' => 'Войти',
			'authentication.sign_up.confirm_password.label' => 'Подтверждение пароля',
			'authentication.sign_up.confirm_password.hint' => 'Повторите пароль',
			'authentication.sign_up.confirm_password.validation_message' => 'Пароли не совпадают',
			'authentication.sign_up.button' => 'Зарегистрироваться',
			'authentication.sign_up.title' => 'Зарегистрироваться',
			'authentication.agreement' => ({required InlineSpanBuilder link}) => TextSpan(children: [ const TextSpan(text: 'Используя приложение, вы соглашаетесь на обработку персональных данных согласно '), link('Пользовательскому соглашению'), ]), 
			'leaderboard.title' => 'Рейтинг',
			'leaderboard.my_position' => 'Моя позиция',
			'leaderboard.empty' => 'Нет активности за этот период',
			'leaderboard.periods.daily' => 'дня',
			'leaderboard.periods.weekly' => 'недели',
			'leaderboard.periods.monthly' => 'месяца',
			'leaderboard.periods.yearly' => 'года',
			'gamification.level' => ({required Object level}) => 'Уровень ${level}',
			'gamification.level_short' => ({required Object level}) => 'Ур. ${level}',
			'gamification.xp' => ({required Object current, required Object total}) => '${current} / ${total} XP',
			'gamification.xp_remaining' => ({required Object remaining}) => 'ещё ${remaining} XP',
			'gamification.streak' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n, one: '${n} день подряд', few: '${n} дня подряд', many: '${n} дней подряд', other: '${n} дней подряд', ), 
			'gamification.points' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n, one: '${n} очко', few: '${n} очка', many: '${n} очков', other: '${n} очков', ), 
			'gamification.accuracy' => ({required Object value}) => '${value}% точность',
			'gamification.achievements_link' => 'Достижения',
			'gamification.streak_days' => 'Дней подряд',
			'gamification.questions_answered' => 'Вопросов',
			'gamification.correct_answers' => 'Правильных',
			'gamification.points_label' => 'Очков',
			'gamification.accuracy_label' => 'Точность',
			'achievements.title' => 'Достижения',
			'achievements.categories.beginner' => 'Начинающий',
			'achievements.categories.progress' => 'Прогресс',
			'achievements.categories.accuracy' => 'Точность',
			'achievements.categories.streak' => 'Серия',
			'achievements.categories.points' => 'Очки',
			'achievements.error' => 'Не удалось загрузить',
			'achievements.retry' => 'Повторить',
			'question.dialog.correct.header.0' => 'Отлично, вы абсолютно правы',
			'question.dialog.correct.header.1' => 'Верно, так держать',
			'question.dialog.correct.prompt.0' => 'Готовы продолжить?',
			'question.dialog.correct.prompt.1' => 'Переходим к следующему вопросу?',
			'question.dialog.incorrect.header.0' => 'Правильный ответ:',
			'question.dialog.incorrect.header.1' => 'На самом деле:',
			'question.dialog.incorrect.prompt.0' => 'Не переживайте!\nДавайте двигаться дальше?',
			'question.dialog.incorrect.prompt.1' => 'Переходим к следующему вопросу?',
			'question.dialog.button' => 'Продолжить',
			'question.error_snackbar.answered_on_another_device.text' => 'Этот вопрос уже был отвечен на другом устройстве. Он больше не повторится.',
			'question.error_snackbar.answered_on_another_device.button' => 'Понятно',
			'question.error_snackbar.already_answered.text' => 'Этот вопрос у вас уже в копилке ответов и не будет перезаписан',
			'question.error_snackbar.already_answered.button' => 'Понятно',
			'question.error_snackbar.save_failed_retry_later.text' => 'Упс! Ответ не сохранился, но вопрос вернётся позже. У вас будет ещё шанс!',
			'question.error_snackbar.save_failed_retry_later.button' => 'Попробую позже',
			_ => null,
		};
	}
}
