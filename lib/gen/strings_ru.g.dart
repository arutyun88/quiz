///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsRu implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
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

	// Translations
	@override Map<String, String> get languages => {
		'en': 'English',
		'ru': 'Русский',
	};
	@override late final _TranslationsTextFieldRu text_field = _TranslationsTextFieldRu._(_root);
	@override late final _TranslationsProfileRu profile = _TranslationsProfileRu._(_root);
	@override late final _TranslationsAuthenticationRu authentication = _TranslationsAuthenticationRu._(_root);
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
	@override late final _TranslationsProfileThemeRu theme = _TranslationsProfileThemeRu._(_root);
	@override late final _TranslationsProfileLanguageRu language = _TranslationsProfileLanguageRu._(_root);
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

// Path: profile.theme
class _TranslationsProfileThemeRu implements TranslationsProfileThemeEn {
	_TranslationsProfileThemeRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Тема оформления';
	@override late final _TranslationsProfileThemeSwitcherRu switcher = _TranslationsProfileThemeSwitcherRu._(_root);
}

// Path: profile.language
class _TranslationsProfileLanguageRu implements TranslationsProfileLanguageEn {
	_TranslationsProfileLanguageRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get change => 'Изменить язык';
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

// Path: profile.theme.switcher
class _TranslationsProfileThemeSwitcherRu implements TranslationsProfileThemeSwitcherEn {
	_TranslationsProfileThemeSwitcherRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get as_system => 'Как в системе';
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

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'languages.en': return 'English';
			case 'languages.ru': return 'Русский';
			case 'text_field.email.label': return 'Email';
			case 'text_field.email.hint': return 'Введите ваш email-адрес';
			case 'text_field.email.validation_message': return 'Неверный формат электронной почты';
			case 'text_field.password.label': return 'Пароль';
			case 'text_field.password.hint': return 'Минимум 8 символов, буквы и цифры';
			case 'text_field.password.validation_message': return '8+ символов: 1 заглавная, 1 строчная, 1 цифра';
			case 'text_field.confirm_password.label': return 'Подтвердите пароль';
			case 'text_field.confirm_password.hint': return 'Повторите введенный пароль';
			case 'profile.theme.title': return 'Тема оформления';
			case 'profile.theme.switcher.as_system': return 'Как в системе';
			case 'profile.language.change': return 'Изменить язык';
			case 'profile.settings.title': return 'Настройки';
			case 'profile.settings.user.title': return 'Настройки';
			case 'profile.settings.user.go_to_edit': return 'Редактировать профиль';
			case 'profile.settings.user.go_to_notifications_settings': return 'Настройки уведомлений';
			case 'profile.settings.user.go_to_subscriptions': return 'Управление подпиской';
			case 'profile.settings.application.title': return 'Приложение';
			case 'profile.settings.application.go_to_storage_manager': return 'Менеджер памяти';
			case 'profile.settings.application.go_to_about_app': return 'О приложении';
			case 'profile.settings.sign_out': return 'Выйти из профиля';
			case 'profile.settings.sign_in': return 'Войти или зарегистрироваться';
			case 'profile.edit.title': return 'Редактировать профиль';
			case 'profile.edit.password.title': return 'Изменить пароль';
			case 'profile.edit.password.old_password_hint': return 'Введите старый пароль';
			case 'profile.edit.password.new_password_hint': return 'Введите новый пароль';
			case 'profile.edit.password.new_confirm_password_hint': return 'Повторите новый пароль';
			case 'profile.edit.password.confirm_password_validation_message': return 'Пароли не совпадают';
			case 'profile.edit.password.button': return 'Сохранить';
			case 'profile.edit.password.result.success': return 'Пароль успешно изменен';
			case 'profile.edit.password.result.failed': return 'Не удалось изменить пароль. Пожалуйста, проверьте введенные данные и попробуйте снова';
			case 'profile.edit.main.title': return 'Основная информация';
			case 'profile.edit.main.name.label': return 'Имя';
			case 'profile.edit.main.name.hint': return 'Введите ваше имя';
			case 'profile.edit.main.date.hint': return 'Укажите дату вашего рождения';
			case 'profile.edit.main.date.picker.title': return 'Дата рождения';
			case 'profile.edit.main.date.picker.button.cancel': return 'Отмена';
			case 'profile.edit.main.date.picker.button.apply': return 'Готово';
			case 'profile.edit.main.result.success': return 'Информация успешно изменена';
			case 'profile.edit.main.result.failed': return 'Не удалось изменить информацию. Пожалуйста, проверьте введенные данные и попробуйте снова';
			case 'authentication.failure.invalid_credentials': return 'Неверные учетные данные. Проверьте правильность введенного email и пароля.';
			case 'authentication.failure.too_many_requests': return 'Слишком много попыток входа. Попробуйте позже или сбросьте пароль.';
			case 'authentication.failure.already_exist': return 'Этот email уже используется другим аккаунтом.';
			case 'authentication.failure.unknown': return 'Произошла ошибка при аутентификации. Пожалуйста, попробуйте снова.';
			case 'authentication.sign_in.no_account.text': return 'Нет аккаунта?';
			case 'authentication.sign_in.no_account.sign_up': return 'Зарегистрироваться';
			case 'authentication.sign_in.button': return 'Войти';
			case 'authentication.sign_in.title': return 'Войти в аккаунт';
			case 'authentication.sign_in.forget_password.button': return 'Не помню пароль';
			case 'authentication.sign_in.forget_password.dialog.title': return 'Восстановление пароля';
			case 'authentication.sign_in.forget_password.dialog.valid.accept': return 'Сбросить';
			case 'authentication.sign_in.forget_password.dialog.valid.cancel': return 'Отмена';
			case 'authentication.sign_in.forget_password.dialog.valid.description': return 'Вы действительно хотите сбросить пароль?';
			case 'authentication.sign_in.forget_password.dialog.invalid.button': return 'Хорошо';
			case 'authentication.sign_in.forget_password.dialog.invalid.description': return 'Введите корректный адрес электронной почты.';
			case 'authentication.sign_in.forget_password.dialog.result.success': return 'Ссылка на сброс пароля отправлена на вашу почту. Ссылка действительна в течение 1 часа.';
			case 'authentication.sign_in.forget_password.dialog.result.failed': return 'Не удалось отправить ссылку для сброса пароля. Пожалуйста, попробуйте позже.';
			case 'authentication.sign_up.have_account.text': return 'Есть аккаунт?';
			case 'authentication.sign_up.have_account.sign_in': return 'Войти';
			case 'authentication.sign_up.confirm_password.label': return 'Подтверждение пароля';
			case 'authentication.sign_up.confirm_password.hint': return 'Повторите пароль';
			case 'authentication.sign_up.confirm_password.validation_message': return 'Пароли не совпадают';
			case 'authentication.sign_up.button': return 'Зарегистрироваться';
			case 'authentication.sign_up.title': return 'Зарегистрироваться';
			case 'authentication.agreement': return ({required InlineSpanBuilder link}) => TextSpan(children: [
				const TextSpan(text: 'Используя приложение, вы соглашаетесь на обработку персональных данных согласно '),
				link('Пользовательскому соглашению'),
			]);
			default: return null;
		}
	}
}

