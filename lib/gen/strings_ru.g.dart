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
	@override String get application => 'Приложение';
	@override late final _TranslationsProfileLanguageRu language = _TranslationsProfileLanguageRu._(_root);
}

// Path: authentication
class _TranslationsAuthenticationRu implements TranslationsAuthenticationEn {
	_TranslationsAuthenticationRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsAuthenticationSignInRu sign_in = _TranslationsAuthenticationSignInRu._(_root);
	@override late final _TranslationsAuthenticationSignUpRu sign_up = _TranslationsAuthenticationSignUpRu._(_root);
	@override TextSpan agreement({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'Используя приложение, вы принимаете '),
		link('Пользовательское соглашение'),
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

// Path: authentication.sign_in
class _TranslationsAuthenticationSignInRu implements TranslationsAuthenticationSignInEn {
	_TranslationsAuthenticationSignInRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsAuthenticationSignInNoAccountRu no_account = _TranslationsAuthenticationSignInNoAccountRu._(_root);
	@override String get button => 'Войти';
	@override String get title => 'Войти в аккаунт';
	@override String get forget_password => 'Не помню пароль';
}

// Path: authentication.sign_up
class _TranslationsAuthenticationSignUpRu implements TranslationsAuthenticationSignUpEn {
	_TranslationsAuthenticationSignUpRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsAuthenticationSignUpNoAccountRu no_account = _TranslationsAuthenticationSignUpNoAccountRu._(_root);
}

// Path: profile.theme.switcher
class _TranslationsProfileThemeSwitcherRu implements TranslationsProfileThemeSwitcherEn {
	_TranslationsProfileThemeSwitcherRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get as_system => 'Как в системе';
}

// Path: authentication.sign_in.no_account
class _TranslationsAuthenticationSignInNoAccountRu implements TranslationsAuthenticationSignInNoAccountEn {
	_TranslationsAuthenticationSignInNoAccountRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get text => 'Нет аккаунта?';
	@override String get sign_up => 'Зарегистрироваться';
}

// Path: authentication.sign_up.no_account
class _TranslationsAuthenticationSignUpNoAccountRu implements TranslationsAuthenticationSignUpNoAccountEn {
	_TranslationsAuthenticationSignUpNoAccountRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get text => 'Есть аккаунт?';
	@override String get sign_in => 'Войти';
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
			case 'profile.application': return 'Приложение';
			case 'profile.language.change': return 'Изменить язык';
			case 'authentication.sign_in.no_account.text': return 'Нет аккаунта?';
			case 'authentication.sign_in.no_account.sign_up': return 'Зарегистрироваться';
			case 'authentication.sign_in.button': return 'Войти';
			case 'authentication.sign_in.title': return 'Войти в аккаунт';
			case 'authentication.sign_in.forget_password': return 'Не помню пароль';
			case 'authentication.sign_up.no_account.text': return 'Есть аккаунт?';
			case 'authentication.sign_up.no_account.sign_in': return 'Войти';
			case 'authentication.agreement': return ({required InlineSpanBuilder link}) => TextSpan(children: [
				const TextSpan(text: 'Используя приложение, вы принимаете '),
				link('Пользовательское соглашение'),
			]);
			default: return null;
		}
	}
}

