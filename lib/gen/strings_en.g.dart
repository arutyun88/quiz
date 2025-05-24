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
	late final TranslationsQuestionEn question = TranslationsQuestionEn._(_root);
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

// Path: question
class TranslationsQuestionEn {
	TranslationsQuestionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsQuestionDialogEn dialog = TranslationsQuestionDialogEn._(_root);
	late final TranslationsQuestionErrorSnackbarEn error_snackbar = TranslationsQuestionErrorSnackbarEn._(_root);
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

// Path: profile.settings
class TranslationsProfileSettingsEn {
	TranslationsProfileSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
	late final TranslationsProfileSettingsUserEn user = TranslationsProfileSettingsUserEn._(_root);
	late final TranslationsProfileSettingsApplicationEn application = TranslationsProfileSettingsApplicationEn._(_root);
	String get sign_out => 'Log out of profile';
	String get sign_in => 'Log in or register';
}

// Path: profile.edit
class TranslationsProfileEditEn {
	TranslationsProfileEditEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Edit profile';
	late final TranslationsProfileEditPasswordEn password = TranslationsProfileEditPasswordEn._(_root);
	late final TranslationsProfileEditMainEn main = TranslationsProfileEditMainEn._(_root);
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

// Path: question.dialog
class TranslationsQuestionDialogEn {
	TranslationsQuestionDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsQuestionDialogCorrectEn correct = TranslationsQuestionDialogCorrectEn._(_root);
	late final TranslationsQuestionDialogIncorrectEn incorrect = TranslationsQuestionDialogIncorrectEn._(_root);
	String get button => 'Continue';
}

// Path: question.error_snackbar
class TranslationsQuestionErrorSnackbarEn {
	TranslationsQuestionErrorSnackbarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsQuestionErrorSnackbarAnsweredOnAnotherDeviceEn answered_on_another_device = TranslationsQuestionErrorSnackbarAnsweredOnAnotherDeviceEn._(_root);
	late final TranslationsQuestionErrorSnackbarSaveFailedRetryLaterEn save_failed_retry_later = TranslationsQuestionErrorSnackbarSaveFailedRetryLaterEn._(_root);
}

// Path: profile.settings.user
class TranslationsProfileSettingsUserEn {
	TranslationsProfileSettingsUserEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
	String get go_to_edit => 'Edit profile';
	String get go_to_notifications_settings => 'Настройки уведомлений';
	String get go_to_subscriptions => 'Управление подпиской';
}

// Path: profile.settings.application
class TranslationsProfileSettingsApplicationEn {
	TranslationsProfileSettingsApplicationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Application';
	late final TranslationsProfileSettingsApplicationLanguageEn language = TranslationsProfileSettingsApplicationLanguageEn._(_root);
	late final TranslationsProfileSettingsApplicationThemeEn theme = TranslationsProfileSettingsApplicationThemeEn._(_root);
	String get go_to_storage_manager => 'Memory Manager';
	String get go_to_about_app => 'About the application';
}

// Path: profile.edit.password
class TranslationsProfileEditPasswordEn {
	TranslationsProfileEditPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Change password';
	String get old_password_hint => 'Enter old password';
	String get new_password_hint => 'Enter new password';
	String get new_confirm_password_hint => 'Repeat new password';
	String get confirm_password_validation_message => 'Passwords don\'t match';
	String get button => 'Save';
	late final TranslationsProfileEditPasswordResultEn result = TranslationsProfileEditPasswordResultEn._(_root);
}

// Path: profile.edit.main
class TranslationsProfileEditMainEn {
	TranslationsProfileEditMainEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Basic information';
	late final TranslationsProfileEditMainNameEn name = TranslationsProfileEditMainNameEn._(_root);
	late final TranslationsProfileEditMainDateEn date = TranslationsProfileEditMainDateEn._(_root);
	late final TranslationsProfileEditMainResultEn result = TranslationsProfileEditMainResultEn._(_root);
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

// Path: question.dialog.correct
class TranslationsQuestionDialogCorrectEn {
	TranslationsQuestionDialogCorrectEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	List<String> get header => [
		'Great job! You\'re absolutely correct',
		'Well done! That\'s right',
	];
	List<String> get prompt => [
		'Ready to continue?',
		'Shall we move to the next question?',
	];
}

// Path: question.dialog.incorrect
class TranslationsQuestionDialogIncorrectEn {
	TranslationsQuestionDialogIncorrectEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	List<String> get header => [
		'Correct answer:',
		'The actual answer:',
	];
	List<String> get prompt => [
		'No worries!\nLet\'s keep moving forward?',
		'Shall we try the next question?',
	];
}

// Path: question.error_snackbar.answered_on_another_device
class TranslationsQuestionErrorSnackbarAnsweredOnAnotherDeviceEn {
	TranslationsQuestionErrorSnackbarAnsweredOnAnotherDeviceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text => 'This question was already answered on another device. It won\'t appear again.';
	String get button => 'Got it';
}

// Path: question.error_snackbar.save_failed_retry_later
class TranslationsQuestionErrorSnackbarSaveFailedRetryLaterEn {
	TranslationsQuestionErrorSnackbarSaveFailedRetryLaterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text => 'Oops! Your answer wasn\'t saved, but this question will return later. You\'ll get another chance!';
	String get button => 'Try again later';
}

// Path: profile.settings.application.language
class TranslationsProfileSettingsApplicationLanguageEn {
	TranslationsProfileSettingsApplicationLanguageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get change => 'Choose language';
}

// Path: profile.settings.application.theme
class TranslationsProfileSettingsApplicationThemeEn {
	TranslationsProfileSettingsApplicationThemeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Theme';
	late final TranslationsProfileSettingsApplicationThemeSwitcherEn switcher = TranslationsProfileSettingsApplicationThemeSwitcherEn._(_root);
}

// Path: profile.edit.password.result
class TranslationsProfileEditPasswordResultEn {
	TranslationsProfileEditPasswordResultEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get success => 'Password successfully changed';
	String get failed => 'The password could not be changed. Please check the entered data and try again';
}

// Path: profile.edit.main.name
class TranslationsProfileEditMainNameEn {
	TranslationsProfileEditMainNameEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Name';
	String get hint => 'Enter your name';
}

// Path: profile.edit.main.date
class TranslationsProfileEditMainDateEn {
	TranslationsProfileEditMainDateEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get hint => 'Specify your date of birth';
	late final TranslationsProfileEditMainDatePickerEn picker = TranslationsProfileEditMainDatePickerEn._(_root);
}

// Path: profile.edit.main.result
class TranslationsProfileEditMainResultEn {
	TranslationsProfileEditMainResultEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get success => 'Information successfully changed';
	String get failed => 'Information could not be changed. Please check the entered data and try again';
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

// Path: profile.settings.application.theme.switcher
class TranslationsProfileSettingsApplicationThemeSwitcherEn {
	TranslationsProfileSettingsApplicationThemeSwitcherEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get as_system => 'As in the system';
}

// Path: profile.edit.main.date.picker
class TranslationsProfileEditMainDatePickerEn {
	TranslationsProfileEditMainDatePickerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Date of birth';
	late final TranslationsProfileEditMainDatePickerButtonEn button = TranslationsProfileEditMainDatePickerButtonEn._(_root);
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

// Path: profile.edit.main.date.picker.button
class TranslationsProfileEditMainDatePickerButtonEn {
	TranslationsProfileEditMainDatePickerButtonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get cancel => 'Cancel';
	String get apply => 'Done';
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
			case 'profile.settings.title': return 'Settings';
			case 'profile.settings.user.title': return 'Settings';
			case 'profile.settings.user.go_to_edit': return 'Edit profile';
			case 'profile.settings.user.go_to_notifications_settings': return 'Настройки уведомлений';
			case 'profile.settings.user.go_to_subscriptions': return 'Управление подпиской';
			case 'profile.settings.application.title': return 'Application';
			case 'profile.settings.application.language.change': return 'Choose language';
			case 'profile.settings.application.theme.title': return 'Theme';
			case 'profile.settings.application.theme.switcher.as_system': return 'As in the system';
			case 'profile.settings.application.go_to_storage_manager': return 'Memory Manager';
			case 'profile.settings.application.go_to_about_app': return 'About the application';
			case 'profile.settings.sign_out': return 'Log out of profile';
			case 'profile.settings.sign_in': return 'Log in or register';
			case 'profile.edit.title': return 'Edit profile';
			case 'profile.edit.password.title': return 'Change password';
			case 'profile.edit.password.old_password_hint': return 'Enter old password';
			case 'profile.edit.password.new_password_hint': return 'Enter new password';
			case 'profile.edit.password.new_confirm_password_hint': return 'Repeat new password';
			case 'profile.edit.password.confirm_password_validation_message': return 'Passwords don\'t match';
			case 'profile.edit.password.button': return 'Save';
			case 'profile.edit.password.result.success': return 'Password successfully changed';
			case 'profile.edit.password.result.failed': return 'The password could not be changed. Please check the entered data and try again';
			case 'profile.edit.main.title': return 'Basic information';
			case 'profile.edit.main.name.label': return 'Name';
			case 'profile.edit.main.name.hint': return 'Enter your name';
			case 'profile.edit.main.date.hint': return 'Specify your date of birth';
			case 'profile.edit.main.date.picker.title': return 'Date of birth';
			case 'profile.edit.main.date.picker.button.cancel': return 'Cancel';
			case 'profile.edit.main.date.picker.button.apply': return 'Done';
			case 'profile.edit.main.result.success': return 'Information successfully changed';
			case 'profile.edit.main.result.failed': return 'Information could not be changed. Please check the entered data and try again';
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
			case 'question.dialog.correct.header.0': return 'Great job! You\'re absolutely correct';
			case 'question.dialog.correct.header.1': return 'Well done! That\'s right';
			case 'question.dialog.correct.prompt.0': return 'Ready to continue?';
			case 'question.dialog.correct.prompt.1': return 'Shall we move to the next question?';
			case 'question.dialog.incorrect.header.0': return 'Correct answer:';
			case 'question.dialog.incorrect.header.1': return 'The actual answer:';
			case 'question.dialog.incorrect.prompt.0': return 'No worries!\nLet\'s keep moving forward?';
			case 'question.dialog.incorrect.prompt.1': return 'Shall we try the next question?';
			case 'question.dialog.button': return 'Continue';
			case 'question.error_snackbar.answered_on_another_device.text': return 'This question was already answered on another device. It won\'t appear again.';
			case 'question.error_snackbar.answered_on_another_device.button': return 'Got it';
			case 'question.error_snackbar.save_failed_retry_later.text': return 'Oops! Your answer wasn\'t saved, but this question will return later. You\'ll get another chance!';
			case 'question.error_snackbar.save_failed_retry_later.button': return 'Try again later';
			default: return null;
		}
	}
}

