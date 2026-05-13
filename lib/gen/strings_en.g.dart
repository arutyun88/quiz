///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
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

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	Map<String, String> get languages => {
		'en': 'English',
		'ru': 'Русский',
	};
	late final TranslationsTextFieldEn text_field = TranslationsTextFieldEn._(_root);
	late final TranslationsProfileEn profile = TranslationsProfileEn._(_root);
	late final TranslationsAuthenticationEn authentication = TranslationsAuthenticationEn._(_root);
	late final TranslationsGamificationEn gamification = TranslationsGamificationEn._(_root);
	late final TranslationsAchievementsEn achievements = TranslationsAchievementsEn._(_root);
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

	/// en: 'Profile'
	String get title => 'Profile';

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

	/// en: 'By using the app, you accept ${link(User Agreement)}'
	TextSpan agreement({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'By using the app, you accept '),
		link('User Agreement'),
	]);
}

// Path: gamification
class TranslationsGamificationEn {
	TranslationsGamificationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Level $level'
	String level({required Object level}) => 'Level ${level}';

	/// en: 'Lvl $level'
	String level_short({required Object level}) => 'Lvl ${level}';

	/// en: '$current / $total XP'
	String xp({required Object current, required Object total}) => '${current} / ${total} XP';

	/// en: '(one) {$n day streak} (other) {$n days streak}'
	String streak({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '${n} day streak',
		other: '${n} days streak',
	);

	/// en: '(one) {$n pt} (other) {$n pts}'
	String points({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '${n} pt',
		other: '${n} pts',
	);

	/// en: '$value% accuracy'
	String accuracy({required Object value}) => '${value}% accuracy';

	/// en: 'Achievements'
	String get achievements_link => 'Achievements';
}

// Path: achievements
class TranslationsAchievementsEn {
	TranslationsAchievementsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Achievements'
	String get title => 'Achievements';

	late final TranslationsAchievementsCategoriesEn categories = TranslationsAchievementsCategoriesEn._(_root);

	/// en: 'Failed to load'
	String get error => 'Failed to load';

	/// en: 'Retry'
	String get retry => 'Retry';
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

	/// en: 'Email'
	String get label => 'Email';

	/// en: 'Enter your email'
	String get hint => 'Enter your email';

	/// en: 'Invalid email format'
	String get validation_message => 'Invalid email format';
}

// Path: text_field.password
class TranslationsTextFieldPasswordEn {
	TranslationsTextFieldPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Password'
	String get label => 'Password';

	/// en: 'Minimum 8 characters, letters and numbers'
	String get hint => 'Minimum 8 characters, letters and numbers';

	/// en: '8+ characters: 1 uppercase, 1 lowercase, 1 digit'
	String get validation_message => '8+ characters: 1 uppercase, 1 lowercase, 1 digit';
}

// Path: text_field.confirm_password
class TranslationsTextFieldConfirmPasswordEn {
	TranslationsTextFieldConfirmPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Confirm password'
	String get label => 'Confirm password';

	/// en: 'Repeat the entered password'
	String get hint => 'Repeat the entered password';
}

// Path: profile.settings
class TranslationsProfileSettingsEn {
	TranslationsProfileSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get title => 'Settings';

	late final TranslationsProfileSettingsUserEn user = TranslationsProfileSettingsUserEn._(_root);
	late final TranslationsProfileSettingsApplicationEn application = TranslationsProfileSettingsApplicationEn._(_root);

	/// en: 'Log out of profile'
	String get sign_out => 'Log out of profile';

	/// en: 'Log in or register'
	String get sign_in => 'Log in or register';
}

// Path: profile.edit
class TranslationsProfileEditEn {
	TranslationsProfileEditEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Edit profile'
	String get title => 'Edit profile';

	late final TranslationsProfileEditPasswordEn password = TranslationsProfileEditPasswordEn._(_root);
	late final TranslationsProfileEditMainEn main = TranslationsProfileEditMainEn._(_root);
}

// Path: authentication.failure
class TranslationsAuthenticationFailureEn {
	TranslationsAuthenticationFailureEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Invalid credentials. Check that the email and password you entered are correct.'
	String get invalid_credentials => 'Invalid credentials. Check that the email and password you entered are correct.';

	/// en: 'Too many login attempts. Try again later or reset your password.'
	String get too_many_requests => 'Too many login attempts. Try again later or reset your password.';

	/// en: 'This email is already being used by another account.'
	String get already_exist => 'This email is already being used by another account.';

	/// en: 'An error occurred during authentication. Please try again.'
	String get unknown => 'An error occurred during authentication. Please try again.';
}

// Path: authentication.sign_in
class TranslationsAuthenticationSignInEn {
	TranslationsAuthenticationSignInEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsAuthenticationSignInNoAccountEn no_account = TranslationsAuthenticationSignInNoAccountEn._(_root);

	/// en: 'Log in'
	String get button => 'Log in';

	/// en: 'Log in to your account'
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

	/// en: 'Sign up'
	String get button => 'Sign up';

	/// en: 'Sign up'
	String get title => 'Sign up';
}

// Path: achievements.categories
class TranslationsAchievementsCategoriesEn {
	TranslationsAchievementsCategoriesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Beginner'
	String get beginner => 'Beginner';

	/// en: 'Progress'
	String get progress => 'Progress';

	/// en: 'Accuracy'
	String get accuracy => 'Accuracy';

	/// en: 'Streak'
	String get streak => 'Streak';

	/// en: 'Points'
	String get points => 'Points';
}

// Path: question.dialog
class TranslationsQuestionDialogEn {
	TranslationsQuestionDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsQuestionDialogCorrectEn correct = TranslationsQuestionDialogCorrectEn._(_root);
	late final TranslationsQuestionDialogIncorrectEn incorrect = TranslationsQuestionDialogIncorrectEn._(_root);

	/// en: 'Continue'
	String get button => 'Continue';
}

// Path: question.error_snackbar
class TranslationsQuestionErrorSnackbarEn {
	TranslationsQuestionErrorSnackbarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsQuestionErrorSnackbarAnsweredOnAnotherDeviceEn answered_on_another_device = TranslationsQuestionErrorSnackbarAnsweredOnAnotherDeviceEn._(_root);
	late final TranslationsQuestionErrorSnackbarAlreadyAnsweredEn already_answered = TranslationsQuestionErrorSnackbarAlreadyAnsweredEn._(_root);
	late final TranslationsQuestionErrorSnackbarSaveFailedRetryLaterEn save_failed_retry_later = TranslationsQuestionErrorSnackbarSaveFailedRetryLaterEn._(_root);
}

// Path: profile.settings.user
class TranslationsProfileSettingsUserEn {
	TranslationsProfileSettingsUserEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get title => 'Settings';

	/// en: 'Edit profile'
	String get go_to_edit => 'Edit profile';

	/// en: 'Настройки уведомлений'
	String get go_to_notifications_settings => 'Настройки уведомлений';

	/// en: 'Управление подпиской'
	String get go_to_subscriptions => 'Управление подпиской';
}

// Path: profile.settings.application
class TranslationsProfileSettingsApplicationEn {
	TranslationsProfileSettingsApplicationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Application'
	String get title => 'Application';

	late final TranslationsProfileSettingsApplicationLanguageEn language = TranslationsProfileSettingsApplicationLanguageEn._(_root);
	late final TranslationsProfileSettingsApplicationThemeEn theme = TranslationsProfileSettingsApplicationThemeEn._(_root);

	/// en: 'Memory Manager'
	String get go_to_storage_manager => 'Memory Manager';

	/// en: 'About the application'
	String get go_to_about_app => 'About the application';
}

// Path: profile.edit.password
class TranslationsProfileEditPasswordEn {
	TranslationsProfileEditPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Change password'
	String get title => 'Change password';

	/// en: 'Enter old password'
	String get old_password_hint => 'Enter old password';

	/// en: 'Enter new password'
	String get new_password_hint => 'Enter new password';

	/// en: 'Repeat new password'
	String get new_confirm_password_hint => 'Repeat new password';

	/// en: 'Passwords don't match'
	String get confirm_password_validation_message => 'Passwords don\'t match';

	/// en: 'Save'
	String get button => 'Save';

	late final TranslationsProfileEditPasswordResultEn result = TranslationsProfileEditPasswordResultEn._(_root);
}

// Path: profile.edit.main
class TranslationsProfileEditMainEn {
	TranslationsProfileEditMainEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Basic information'
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

	/// en: 'Don't have an account yet?'
	String get text => 'Don\'t have an account yet?';

	/// en: 'Sign up'
	String get sign_up => 'Sign up';
}

// Path: authentication.sign_in.forget_password
class TranslationsAuthenticationSignInForgetPasswordEn {
	TranslationsAuthenticationSignInForgetPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'I don't remember the password'
	String get button => 'I don\'t remember the password';

	late final TranslationsAuthenticationSignInForgetPasswordDialogEn dialog = TranslationsAuthenticationSignInForgetPasswordDialogEn._(_root);
}

// Path: authentication.sign_up.have_account
class TranslationsAuthenticationSignUpHaveAccountEn {
	TranslationsAuthenticationSignUpHaveAccountEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Already have an account?'
	String get text => 'Already have an account?';

	/// en: 'Log in'
	String get sign_in => 'Log in';
}

// Path: authentication.sign_up.confirm_password
class TranslationsAuthenticationSignUpConfirmPasswordEn {
	TranslationsAuthenticationSignUpConfirmPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Confirm Password'
	String get label => 'Confirm Password';

	/// en: 'Re-enter your password'
	String get hint => 'Re-enter your password';

	/// en: 'Passwords do not match'
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

	/// en: 'This question was already answered on another device. It won't appear again.'
	String get text => 'This question was already answered on another device. It won\'t appear again.';

	/// en: 'Got it'
	String get button => 'Got it';
}

// Path: question.error_snackbar.already_answered
class TranslationsQuestionErrorSnackbarAlreadyAnsweredEn {
	TranslationsQuestionErrorSnackbarAlreadyAnsweredEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'This question is already in your answer collection and won't be overwritten'
	String get text => 'This question is already in your answer collection and won\'t be overwritten';

	/// en: 'Got it'
	String get button => 'Got it';
}

// Path: question.error_snackbar.save_failed_retry_later
class TranslationsQuestionErrorSnackbarSaveFailedRetryLaterEn {
	TranslationsQuestionErrorSnackbarSaveFailedRetryLaterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Oops! Your answer wasn't saved, but this question will return later. You'll get another chance!'
	String get text => 'Oops! Your answer wasn\'t saved, but this question will return later. You\'ll get another chance!';

	/// en: 'Try again later'
	String get button => 'Try again later';
}

// Path: profile.settings.application.language
class TranslationsProfileSettingsApplicationLanguageEn {
	TranslationsProfileSettingsApplicationLanguageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Choose language'
	String get change => 'Choose language';
}

// Path: profile.settings.application.theme
class TranslationsProfileSettingsApplicationThemeEn {
	TranslationsProfileSettingsApplicationThemeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Theme'
	String get title => 'Theme';

	late final TranslationsProfileSettingsApplicationThemeSwitcherEn switcher = TranslationsProfileSettingsApplicationThemeSwitcherEn._(_root);
}

// Path: profile.edit.password.result
class TranslationsProfileEditPasswordResultEn {
	TranslationsProfileEditPasswordResultEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Password successfully changed'
	String get success => 'Password successfully changed';

	/// en: 'The password could not be changed. Please check the entered data and try again'
	String get failed => 'The password could not be changed. Please check the entered data and try again';
}

// Path: profile.edit.main.name
class TranslationsProfileEditMainNameEn {
	TranslationsProfileEditMainNameEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Name'
	String get label => 'Name';

	/// en: 'Enter your name'
	String get hint => 'Enter your name';
}

// Path: profile.edit.main.date
class TranslationsProfileEditMainDateEn {
	TranslationsProfileEditMainDateEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Specify your date of birth'
	String get hint => 'Specify your date of birth';

	late final TranslationsProfileEditMainDatePickerEn picker = TranslationsProfileEditMainDatePickerEn._(_root);
}

// Path: profile.edit.main.result
class TranslationsProfileEditMainResultEn {
	TranslationsProfileEditMainResultEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Information successfully changed'
	String get success => 'Information successfully changed';

	/// en: 'Information could not be changed. Please check the entered data and try again'
	String get failed => 'Information could not be changed. Please check the entered data and try again';
}

// Path: authentication.sign_in.forget_password.dialog
class TranslationsAuthenticationSignInForgetPasswordDialogEn {
	TranslationsAuthenticationSignInForgetPasswordDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Password recovery'
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

	/// en: 'As in the system'
	String get as_system => 'As in the system';
}

// Path: profile.edit.main.date.picker
class TranslationsProfileEditMainDatePickerEn {
	TranslationsProfileEditMainDatePickerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Date of birth'
	String get title => 'Date of birth';

	late final TranslationsProfileEditMainDatePickerButtonEn button = TranslationsProfileEditMainDatePickerButtonEn._(_root);
}

// Path: authentication.sign_in.forget_password.dialog.valid
class TranslationsAuthenticationSignInForgetPasswordDialogValidEn {
	TranslationsAuthenticationSignInForgetPasswordDialogValidEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Reset'
	String get accept => 'Reset';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Do you really want to reset the password?'
	String get description => 'Do you really want to reset the password?';
}

// Path: authentication.sign_in.forget_password.dialog.invalid
class TranslationsAuthenticationSignInForgetPasswordDialogInvalidEn {
	TranslationsAuthenticationSignInForgetPasswordDialogInvalidEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'OK'
	String get button => 'OK';

	/// en: 'Enter the correct email address.'
	String get description => 'Enter the correct email address.';
}

// Path: authentication.sign_in.forget_password.dialog.result
class TranslationsAuthenticationSignInForgetPasswordDialogResultEn {
	TranslationsAuthenticationSignInForgetPasswordDialogResultEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'The link to reset the password has been sent to your email. The link is valid for 1 hour.'
	String get success => 'The link to reset the password has been sent to your email. The link is valid for 1 hour.';

	/// en: 'The password reset link could not be sent. Please try again later.'
	String get failed => 'The password reset link could not be sent. Please try again later.';
}

// Path: profile.edit.main.date.picker.button
class TranslationsProfileEditMainDatePickerButtonEn {
	TranslationsProfileEditMainDatePickerButtonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Done'
	String get apply => 'Done';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'languages.en' => 'English',
			'languages.ru' => 'Русский',
			'text_field.email.label' => 'Email',
			'text_field.email.hint' => 'Enter your email',
			'text_field.email.validation_message' => 'Invalid email format',
			'text_field.password.label' => 'Password',
			'text_field.password.hint' => 'Minimum 8 characters, letters and numbers',
			'text_field.password.validation_message' => '8+ characters: 1 uppercase, 1 lowercase, 1 digit',
			'text_field.confirm_password.label' => 'Confirm password',
			'text_field.confirm_password.hint' => 'Repeat the entered password',
			'profile.title' => 'Profile',
			'profile.settings.title' => 'Settings',
			'profile.settings.user.title' => 'Settings',
			'profile.settings.user.go_to_edit' => 'Edit profile',
			'profile.settings.user.go_to_notifications_settings' => 'Настройки уведомлений',
			'profile.settings.user.go_to_subscriptions' => 'Управление подпиской',
			'profile.settings.application.title' => 'Application',
			'profile.settings.application.language.change' => 'Choose language',
			'profile.settings.application.theme.title' => 'Theme',
			'profile.settings.application.theme.switcher.as_system' => 'As in the system',
			'profile.settings.application.go_to_storage_manager' => 'Memory Manager',
			'profile.settings.application.go_to_about_app' => 'About the application',
			'profile.settings.sign_out' => 'Log out of profile',
			'profile.settings.sign_in' => 'Log in or register',
			'profile.edit.title' => 'Edit profile',
			'profile.edit.password.title' => 'Change password',
			'profile.edit.password.old_password_hint' => 'Enter old password',
			'profile.edit.password.new_password_hint' => 'Enter new password',
			'profile.edit.password.new_confirm_password_hint' => 'Repeat new password',
			'profile.edit.password.confirm_password_validation_message' => 'Passwords don\'t match',
			'profile.edit.password.button' => 'Save',
			'profile.edit.password.result.success' => 'Password successfully changed',
			'profile.edit.password.result.failed' => 'The password could not be changed. Please check the entered data and try again',
			'profile.edit.main.title' => 'Basic information',
			'profile.edit.main.name.label' => 'Name',
			'profile.edit.main.name.hint' => 'Enter your name',
			'profile.edit.main.date.hint' => 'Specify your date of birth',
			'profile.edit.main.date.picker.title' => 'Date of birth',
			'profile.edit.main.date.picker.button.cancel' => 'Cancel',
			'profile.edit.main.date.picker.button.apply' => 'Done',
			'profile.edit.main.result.success' => 'Information successfully changed',
			'profile.edit.main.result.failed' => 'Information could not be changed. Please check the entered data and try again',
			'authentication.failure.invalid_credentials' => 'Invalid credentials. Check that the email and password you entered are correct.',
			'authentication.failure.too_many_requests' => 'Too many login attempts. Try again later or reset your password.',
			'authentication.failure.already_exist' => 'This email is already being used by another account.',
			'authentication.failure.unknown' => 'An error occurred during authentication. Please try again.',
			'authentication.sign_in.no_account.text' => 'Don\'t have an account yet?',
			'authentication.sign_in.no_account.sign_up' => 'Sign up',
			'authentication.sign_in.button' => 'Log in',
			'authentication.sign_in.title' => 'Log in to your account',
			'authentication.sign_in.forget_password.button' => 'I don\'t remember the password',
			'authentication.sign_in.forget_password.dialog.title' => 'Password recovery',
			'authentication.sign_in.forget_password.dialog.valid.accept' => 'Reset',
			'authentication.sign_in.forget_password.dialog.valid.cancel' => 'Cancel',
			'authentication.sign_in.forget_password.dialog.valid.description' => 'Do you really want to reset the password?',
			'authentication.sign_in.forget_password.dialog.invalid.button' => 'OK',
			'authentication.sign_in.forget_password.dialog.invalid.description' => 'Enter the correct email address.',
			'authentication.sign_in.forget_password.dialog.result.success' => 'The link to reset the password has been sent to your email. The link is valid for 1 hour.',
			'authentication.sign_in.forget_password.dialog.result.failed' => 'The password reset link could not be sent. Please try again later.',
			'authentication.sign_up.have_account.text' => 'Already have an account?',
			'authentication.sign_up.have_account.sign_in' => 'Log in',
			'authentication.sign_up.confirm_password.label' => 'Confirm Password',
			'authentication.sign_up.confirm_password.hint' => 'Re-enter your password',
			'authentication.sign_up.confirm_password.validation_message' => 'Passwords do not match',
			'authentication.sign_up.button' => 'Sign up',
			'authentication.sign_up.title' => 'Sign up',
			'authentication.agreement' => ({required InlineSpanBuilder link}) => TextSpan(children: [ const TextSpan(text: 'By using the app, you accept '), link('User Agreement'), ]), 
			'gamification.level' => ({required Object level}) => 'Level ${level}',
			'gamification.level_short' => ({required Object level}) => 'Lvl ${level}',
			'gamification.xp' => ({required Object current, required Object total}) => '${current} / ${total} XP',
			'gamification.streak' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '${n} day streak', other: '${n} days streak', ), 
			'gamification.points' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '${n} pt', other: '${n} pts', ), 
			'gamification.accuracy' => ({required Object value}) => '${value}% accuracy',
			'gamification.achievements_link' => 'Achievements',
			'achievements.title' => 'Achievements',
			'achievements.categories.beginner' => 'Beginner',
			'achievements.categories.progress' => 'Progress',
			'achievements.categories.accuracy' => 'Accuracy',
			'achievements.categories.streak' => 'Streak',
			'achievements.categories.points' => 'Points',
			'achievements.error' => 'Failed to load',
			'achievements.retry' => 'Retry',
			'question.dialog.correct.header.0' => 'Great job! You\'re absolutely correct',
			'question.dialog.correct.header.1' => 'Well done! That\'s right',
			'question.dialog.correct.prompt.0' => 'Ready to continue?',
			'question.dialog.correct.prompt.1' => 'Shall we move to the next question?',
			'question.dialog.incorrect.header.0' => 'Correct answer:',
			'question.dialog.incorrect.header.1' => 'The actual answer:',
			'question.dialog.incorrect.prompt.0' => 'No worries!\nLet\'s keep moving forward?',
			'question.dialog.incorrect.prompt.1' => 'Shall we try the next question?',
			'question.dialog.button' => 'Continue',
			'question.error_snackbar.answered_on_another_device.text' => 'This question was already answered on another device. It won\'t appear again.',
			'question.error_snackbar.answered_on_another_device.button' => 'Got it',
			'question.error_snackbar.already_answered.text' => 'This question is already in your answer collection and won\'t be overwritten',
			'question.error_snackbar.already_answered.button' => 'Got it',
			'question.error_snackbar.save_failed_retry_later.text' => 'Oops! Your answer wasn\'t saved, but this question will return later. You\'ll get another chance!',
			'question.error_snackbar.save_failed_retry_later.button' => 'Try again later',
			_ => null,
		};
	}
}
