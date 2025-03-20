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
	late final TranslationsProfileSettingsEn settings = TranslationsProfileSettingsEn._(_root);
	late final TranslationsProfileEditEn edit = TranslationsProfileEditEn._(_root);
}

// Path: authentication
class TranslationsAuthenticationEn {
	TranslationsAuthenticationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsAuthenticationFailureEn failure = TranslationsAuthenticationFailureEn._(_root);
	late final TranslationsAuthenticationSignInEn sign_in = TranslationsAuthenticationSignInEn._(_root);
	late final TranslationsAuthenticationSignUpEn sign_up = TranslationsAuthenticationSignUpEn._(_root);
	TextSpan agreement({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'By using the app, you accept '),
		link('User Agreement'),
	]);
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

// Path: profile.settings
class TranslationsProfileSettingsEn {
	TranslationsProfileSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
	String get sign_out => 'Log out of profile';
	String get sign_in => 'Log in or register';
}

// Path: profile.edit
class TranslationsProfileEditEn {
	TranslationsProfileEditEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Edit profile';
}

// Path: authentication.failure
class TranslationsAuthenticationFailureEn {
	TranslationsAuthenticationFailureEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get invalid_credentials => 'Invalid credentials. Check that the email and password you entered are correct.';
	String get too_many_requests => 'Too many login attempts. Try again later or reset your password.';
	String get already_exist => 'This email is already being used by another account.';
	String get unknown => 'An error occurred during authentication. Please try again.';
}

// Path: authentication.sign_in
class TranslationsAuthenticationSignInEn {
	TranslationsAuthenticationSignInEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsAuthenticationSignInNoAccountEn no_account = TranslationsAuthenticationSignInNoAccountEn._(_root);
	String get button => 'Log in';
	String get title => 'Log in to your account';
	late final TranslationsAuthenticationSignInForgetPasswordEn forget_password = TranslationsAuthenticationSignInForgetPasswordEn._(_root);
}

// Path: authentication.sign_up
class TranslationsAuthenticationSignUpEn {
	TranslationsAuthenticationSignUpEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsAuthenticationSignUpHaveAccountEn have_account = TranslationsAuthenticationSignUpHaveAccountEn._(_root);
	late final TranslationsAuthenticationSignUpConfirmPasswordEn confirm_password = TranslationsAuthenticationSignUpConfirmPasswordEn._(_root);
	String get button => 'Sign up';
	String get title => 'Sign up';
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

// Path: authentication.sign_in.forget_password
class TranslationsAuthenticationSignInForgetPasswordEn {
	TranslationsAuthenticationSignInForgetPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get button => 'I don\'t remember the password';
	late final TranslationsAuthenticationSignInForgetPasswordDialogEn dialog = TranslationsAuthenticationSignInForgetPasswordDialogEn._(_root);
}

// Path: authentication.sign_up.have_account
class TranslationsAuthenticationSignUpHaveAccountEn {
	TranslationsAuthenticationSignUpHaveAccountEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text => 'Already have an account?';
	String get sign_in => 'Log in';
}

// Path: authentication.sign_up.confirm_password
class TranslationsAuthenticationSignUpConfirmPasswordEn {
	TranslationsAuthenticationSignUpConfirmPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Confirm Password';
	String get hint => 'Re-enter your password';
	String get validation_message => 'Passwords do not match';
}

// Path: authentication.sign_in.forget_password.dialog
class TranslationsAuthenticationSignInForgetPasswordDialogEn {
	TranslationsAuthenticationSignInForgetPasswordDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Password recovery';
	late final TranslationsAuthenticationSignInForgetPasswordDialogValidEn valid = TranslationsAuthenticationSignInForgetPasswordDialogValidEn._(_root);
	late final TranslationsAuthenticationSignInForgetPasswordDialogInvalidEn invalid = TranslationsAuthenticationSignInForgetPasswordDialogInvalidEn._(_root);
	late final TranslationsAuthenticationSignInForgetPasswordDialogResultEn result = TranslationsAuthenticationSignInForgetPasswordDialogResultEn._(_root);
}

// Path: authentication.sign_in.forget_password.dialog.valid
class TranslationsAuthenticationSignInForgetPasswordDialogValidEn {
	TranslationsAuthenticationSignInForgetPasswordDialogValidEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get accept => 'Reset';
	String get cancel => 'Cancel';
	String get description => 'Do you really want to reset the password?';
}

// Path: authentication.sign_in.forget_password.dialog.invalid
class TranslationsAuthenticationSignInForgetPasswordDialogInvalidEn {
	TranslationsAuthenticationSignInForgetPasswordDialogInvalidEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get button => 'OK';
	String get description => 'Enter the correct email address.';
}

// Path: authentication.sign_in.forget_password.dialog.result
class TranslationsAuthenticationSignInForgetPasswordDialogResultEn {
	TranslationsAuthenticationSignInForgetPasswordDialogResultEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get success => 'The link to reset the password has been sent to your email. The link is valid for 1 hour.';
	String get failed => 'The password reset link could not be sent. Please try again later.';
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
			case 'profile.settings.title': return 'Settings';
			case 'profile.settings.sign_out': return 'Log out of profile';
			case 'profile.settings.sign_in': return 'Log in or register';
			case 'profile.edit.title': return 'Edit profile';
			case 'authentication.failure.invalid_credentials': return 'Invalid credentials. Check that the email and password you entered are correct.';
			case 'authentication.failure.too_many_requests': return 'Too many login attempts. Try again later or reset your password.';
			case 'authentication.failure.already_exist': return 'This email is already being used by another account.';
			case 'authentication.failure.unknown': return 'An error occurred during authentication. Please try again.';
			case 'authentication.sign_in.no_account.text': return 'Don\'t have an account yet?';
			case 'authentication.sign_in.no_account.sign_up': return 'Sign up';
			case 'authentication.sign_in.button': return 'Log in';
			case 'authentication.sign_in.title': return 'Log in to your account';
			case 'authentication.sign_in.forget_password.button': return 'I don\'t remember the password';
			case 'authentication.sign_in.forget_password.dialog.title': return 'Password recovery';
			case 'authentication.sign_in.forget_password.dialog.valid.accept': return 'Reset';
			case 'authentication.sign_in.forget_password.dialog.valid.cancel': return 'Cancel';
			case 'authentication.sign_in.forget_password.dialog.valid.description': return 'Do you really want to reset the password?';
			case 'authentication.sign_in.forget_password.dialog.invalid.button': return 'OK';
			case 'authentication.sign_in.forget_password.dialog.invalid.description': return 'Enter the correct email address.';
			case 'authentication.sign_in.forget_password.dialog.result.success': return 'The link to reset the password has been sent to your email. The link is valid for 1 hour.';
			case 'authentication.sign_in.forget_password.dialog.result.failed': return 'The password reset link could not be sent. Please try again later.';
			case 'authentication.sign_up.have_account.text': return 'Already have an account?';
			case 'authentication.sign_up.have_account.sign_in': return 'Log in';
			case 'authentication.sign_up.confirm_password.label': return 'Confirm Password';
			case 'authentication.sign_up.confirm_password.hint': return 'Re-enter your password';
			case 'authentication.sign_up.confirm_password.validation_message': return 'Passwords do not match';
			case 'authentication.sign_up.button': return 'Sign up';
			case 'authentication.sign_up.title': return 'Sign up';
			case 'authentication.agreement': return ({required InlineSpanBuilder link}) => TextSpan(children: [
				const TextSpan(text: 'By using the app, you accept '),
				link('User Agreement'),
			]);
			default: return null;
		}
	}
}

