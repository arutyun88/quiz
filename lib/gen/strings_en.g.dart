///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	Map<String, String> get languages => {
		'en': 'English',
		'ru': 'Русский',
	};
	late final TranslationsTextFieldEn text_field = TranslationsTextFieldEn._(_root);
	late final TranslationsProfileEn profile = TranslationsProfileEn._(_root);
	late final TranslationsAuthenticationEn authentication = TranslationsAuthenticationEn._(_root);
}

// Path: text_field
class TranslationsTextFieldEn {
	TranslationsTextFieldEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsTextFieldEmailEn email = TranslationsTextFieldEmailEn._(_root);
	late final TranslationsTextFieldPasswordEn password = TranslationsTextFieldPasswordEn._(_root);
	late final TranslationsTextFieldConfirmPasswordEn confirm_password = TranslationsTextFieldConfirmPasswordEn._(_root);
}

// Path: profile
class TranslationsProfileEn {
	TranslationsProfileEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsProfileThemeEn theme = TranslationsProfileThemeEn._(_root);
	String get application => 'Application';
	late final TranslationsProfileLanguageEn language = TranslationsProfileLanguageEn._(_root);
}

// Path: authentication
class TranslationsAuthenticationEn {
	TranslationsAuthenticationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsAuthenticationSignInEn sign_in = TranslationsAuthenticationSignInEn._(_root);
	late final TranslationsAuthenticationSignUpEn sign_up = TranslationsAuthenticationSignUpEn._(_root);
}

// Path: text_field.email
class TranslationsTextFieldEmailEn {
	TranslationsTextFieldEmailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Email';
	String get hint => 'Enter your email';
	String get validation_message => 'Invalid email format';
}

// Path: text_field.password
class TranslationsTextFieldPasswordEn {
	TranslationsTextFieldPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Password';
	String get hint => 'Minimum 8 characters, letters and numbers';
	String get validation_message => '8+ characters: 1 uppercase, 1 lowercase, 1 digit';
}

// Path: text_field.confirm_password
class TranslationsTextFieldConfirmPasswordEn {
	TranslationsTextFieldConfirmPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Confirm password';
	String get hint => 'Repeat the entered password';
}

// Path: profile.theme
class TranslationsProfileThemeEn {
	TranslationsProfileThemeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Theme';
	late final TranslationsProfileThemeSwitcherEn switcher = TranslationsProfileThemeSwitcherEn._(_root);
}

// Path: profile.language
class TranslationsProfileLanguageEn {
	TranslationsProfileLanguageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get change => 'Choose language';
}

// Path: authentication.sign_in
class TranslationsAuthenticationSignInEn {
	TranslationsAuthenticationSignInEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsAuthenticationSignInNoAccountEn no_account = TranslationsAuthenticationSignInNoAccountEn._(_root);
	String get button => 'Log in';
}

// Path: authentication.sign_up
class TranslationsAuthenticationSignUpEn {
	TranslationsAuthenticationSignUpEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsAuthenticationSignUpNoAccountEn no_account = TranslationsAuthenticationSignUpNoAccountEn._(_root);
}

// Path: profile.theme.switcher
class TranslationsProfileThemeSwitcherEn {
	TranslationsProfileThemeSwitcherEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get as_system => 'As in the system';
}

// Path: authentication.sign_in.no_account
class TranslationsAuthenticationSignInNoAccountEn {
	TranslationsAuthenticationSignInNoAccountEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text => 'Don\'t have an account yet?';
	String get sign_up => 'Sign up';
}

// Path: authentication.sign_up.no_account
class TranslationsAuthenticationSignUpNoAccountEn {
	TranslationsAuthenticationSignUpNoAccountEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text => 'Already have an account?';
	String get sign_in => 'Log in';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'languages.en': return 'English';
			case 'languages.ru': return 'Русский';
			case 'text_field.email.label': return 'Email';
			case 'text_field.email.hint': return 'Enter your email';
			case 'text_field.email.validation_message': return 'Invalid email format';
			case 'text_field.password.label': return 'Password';
			case 'text_field.password.hint': return 'Minimum 8 characters, letters and numbers';
			case 'text_field.password.validation_message': return '8+ characters: 1 uppercase, 1 lowercase, 1 digit';
			case 'text_field.confirm_password.label': return 'Confirm password';
			case 'text_field.confirm_password.hint': return 'Repeat the entered password';
			case 'profile.theme.title': return 'Theme';
			case 'profile.theme.switcher.as_system': return 'As in the system';
			case 'profile.application': return 'Application';
			case 'profile.language.change': return 'Choose language';
			case 'authentication.sign_in.no_account.text': return 'Don\'t have an account yet?';
			case 'authentication.sign_in.no_account.sign_up': return 'Sign up';
			case 'authentication.sign_in.button': return 'Log in';
			case 'authentication.sign_up.no_account.text': return 'Already have an account?';
			case 'authentication.sign_up.no_account.sign_in': return 'Log in';
			default: return null;
		}
	}
}

