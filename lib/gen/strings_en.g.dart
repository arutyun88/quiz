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
	late final Translations$text_field$en text_field = Translations$text_field$en._(_root);
	late final Translations$profile$en profile = Translations$profile$en._(_root);
	late final Translations$authentication$en authentication = Translations$authentication$en._(_root);
	late final Translations$leaderboard$en leaderboard = Translations$leaderboard$en._(_root);
	late final Translations$gamification$en gamification = Translations$gamification$en._(_root);
	late final Translations$achievements$en achievements = Translations$achievements$en._(_root);
	late final Translations$question$en question = Translations$question$en._(_root);
	late final Translations$onboarding$en onboarding = Translations$onboarding$en._(_root);
	late final Translations$sign_in$en sign_in = Translations$sign_in$en._(_root);
	late final Translations$sign_up$en sign_up = Translations$sign_up$en._(_root);
	late final Translations$forgot_password$en forgot_password = Translations$forgot_password$en._(_root);
	late final Translations$nav$en nav = Translations$nav$en._(_root);
}

// Path: text_field
class Translations$text_field$en {
	Translations$text_field$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$text_field$email$en email = Translations$text_field$email$en._(_root);
	late final Translations$text_field$password$en password = Translations$text_field$password$en._(_root);
	late final Translations$text_field$confirm_password$en confirm_password = Translations$text_field$confirm_password$en._(_root);
}

// Path: profile
class Translations$profile$en {
	Translations$profile$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Профиль'
	String get title => 'Profile';

	late final Translations$profile$settings$en settings = Translations$profile$settings$en._(_root);
	late final Translations$profile$edit$en edit = Translations$profile$edit$en._(_root);
}

// Path: authentication
class Translations$authentication$en {
	Translations$authentication$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$authentication$failure$en failure = Translations$authentication$failure$en._(_root);
	late final Translations$authentication$sign_in$en sign_in = Translations$authentication$sign_in$en._(_root);
	late final Translations$authentication$sign_up$en sign_up = Translations$authentication$sign_up$en._(_root);

	/// ru: 'Используя приложение, вы соглашаетесь на обработку персональных данных согласно ${link(Пользовательскому соглашению)}'
	TextSpan agreement({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'By using the app, you accept '),
		link('User Agreement'),
	]);
}

// Path: leaderboard
class Translations$leaderboard$en {
	Translations$leaderboard$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Рейтинг'
	String get title => 'Leaderboard';

	/// ru: 'Моя позиция'
	String get my_position => 'My position';

	/// ru: 'Нет активности за этот период'
	String get empty => 'No activity yet for this period';

	late final Translations$leaderboard$periods$en periods = Translations$leaderboard$periods$en._(_root);
}

// Path: gamification
class Translations$gamification$en {
	Translations$gamification$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Уровень $level'
	String level({required Object level}) => 'Level ${level}';

	/// ru: 'Ур. $level'
	String level_short({required Object level}) => 'Lvl ${level}';

	/// ru: '$current / $total XP'
	String xp({required Object current, required Object total}) => '${current} / ${total} XP';

	/// ru: 'ещё $remaining XP'
	String xp_remaining({required Object remaining}) => '${remaining} XP left';

	/// ru: '(one) {$n день подряд} (few) {$n дня подряд} (many) {$n дней подряд} (other) {$n дней подряд}'
	String streak({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '${n} day streak',
		other: '${n} days streak',
	);

	/// ru: '(one) {$n очко} (few) {$n очка} (many) {$n очков} (other) {$n очков}'
	String points({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '${n} pt',
		other: '${n} pts',
	);

	/// ru: '$value% точность'
	String accuracy({required Object value}) => '${value}% accuracy';

	/// ru: 'Достижения'
	String get achievements_link => 'Achievements';

	/// ru: 'Дней подряд'
	String get streak_days => 'Day streak';

	/// ru: 'Вопросов'
	String get questions_answered => 'Questions';

	/// ru: 'Правильных'
	String get correct_answers => 'Correct';

	/// ru: 'Очков'
	String get points_label => 'Points';

	/// ru: 'Точность'
	String get accuracy_label => 'Accuracy';
}

// Path: achievements
class Translations$achievements$en {
	Translations$achievements$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Достижения'
	String get title => 'Achievements';

	late final Translations$achievements$categories$en categories = Translations$achievements$categories$en._(_root);

	/// ru: 'Не удалось загрузить'
	String get error => 'Failed to load';

	/// ru: 'Повторить'
	String get retry => 'Retry';
}

// Path: question
class Translations$question$en {
	Translations$question$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$question$dialog$en dialog = Translations$question$dialog$en._(_root);
	late final Translations$question$error_snackbar$en error_snackbar = Translations$question$error_snackbar$en._(_root);
}

// Path: onboarding
class Translations$onboarding$en {
	Translations$onboarding$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'ЕЖЕДНЕВНЫЙ ВЫПУСК'
	String get daily_issue => 'DAILY EDITION';

	/// ru: 'ВЫПУСК № ${n}'
	String issue_number({required Object n}) => 'EDITION № ${n}';

	/// ru: 'Десять вопросов. Каждый день.'
	String get headline => 'Ten\nquestions.\nEvery day.';

	/// ru: 'Одна игра в день — и ты в общем рейтинге.'
	String get subtitle => 'One game a day — and you\'re in the leaderboard.';

	late final Translations$onboarding$features$en features = Translations$onboarding$features$en._(_root);

	/// ru: 'НАЧАТЬ БЕСПЛАТНО'
	String get start_free => 'START FOR FREE';

	/// ru: 'УЖЕ ИГРАЛИ?'
	String get already_played => 'PLAYED BEFORE?';

	/// ru: 'ВОЙТИ'
	String get sign_in_link => 'SIGN IN';
}

// Path: sign_in
class Translations$sign_in$en {
	Translations$sign_in$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Добро пожаловать'
	String get title => 'Welcome\nback';

	/// ru: 'EMAIL'
	String get email_label => 'EMAIL';

	/// ru: 'ПАРОЛЬ'
	String get password_label => 'PASSWORD';

	/// ru: 'Забыли пароль?'
	String get forgot_password => 'Forgot password?';

	/// ru: 'ВОЙТИ'
	String get submit => 'SIGN IN';

	/// ru: 'Нет аккаунта?'
	String get no_account => 'No account?';

	/// ru: 'Зарегистрироваться'
	String get register_link => 'Register';
}

// Path: sign_up
class Translations$sign_up$en {
	Translations$sign_up$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Создать аккаунт'
	String get title => 'Create\naccount';

	/// ru: 'ИМЯ'
	String get name_label => 'NAME';

	/// ru: 'EMAIL'
	String get email_label => 'EMAIL';

	/// ru: 'ПАРОЛЬ'
	String get password_label => 'PASSWORD';

	/// ru: 'СОЗДАТЬ АККАУНТ'
	String get submit => 'CREATE ACCOUNT';

	/// ru: 'Уже есть аккаунт?'
	String get have_account => 'Already have an account?';

	/// ru: 'Войти'
	String get sign_in_link => 'Sign in';
}

// Path: forgot_password
class Translations$forgot_password$en {
	Translations$forgot_password$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Забыли пароль?'
	String get title => 'Forgot\npassword?';

	/// ru: 'Введите email — пришлём ссылку для сброса пароля.'
	String get subtitle => 'Enter your email — we\'ll send a reset link.';

	/// ru: 'EMAIL'
	String get email_label => 'EMAIL';

	/// ru: 'ОТПРАВИТЬ ССЫЛКУ'
	String get submit => 'SEND LINK';

	/// ru: 'ОТПРАВКА...'
	String get submitting => 'SENDING...';

	/// ru: 'Ссылка действует 15 минут. Проверьте папку «Спам», если письмо не пришло.'
	String get hint => 'Link is valid for 15 minutes. Check your Spam folder if the email doesn\'t arrive.';

	/// ru: 'Ссылка отправлена. Проверьте почту.'
	String get success => 'Link sent. Check your inbox.';

	/// ru: 'Не удалось отправить ссылку. Попробуйте позже.'
	String get error => 'Failed to send the link. Please try again later.';
}

// Path: nav
class Translations$nav$en {
	Translations$nav$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'ИГРА'
	String get game => 'GAME';

	/// ru: 'РЕЙТИНГ'
	String get leaderboard => 'RANK';

	/// ru: 'ПРОФИЛЬ'
	String get profile => 'PROFILE';
}

// Path: text_field.email
class Translations$text_field$email$en {
	Translations$text_field$email$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Email'
	String get label => 'Email';

	/// ru: 'Введите ваш email-адрес'
	String get hint => 'Enter your email';

	/// ru: 'Неверный формат электронной почты'
	String get validation_message => 'Invalid email format';
}

// Path: text_field.password
class Translations$text_field$password$en {
	Translations$text_field$password$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Пароль'
	String get label => 'Password';

	/// ru: 'Минимум 8 символов, буквы и цифры'
	String get hint => 'Minimum 8 characters, letters and numbers';

	/// ru: '8+ символов: 1 заглавная, 1 строчная, 1 цифра'
	String get validation_message => '8+ characters: 1 uppercase, 1 lowercase, 1 digit';
}

// Path: text_field.confirm_password
class Translations$text_field$confirm_password$en {
	Translations$text_field$confirm_password$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Подтвердите пароль'
	String get label => 'Confirm password';

	/// ru: 'Повторите введенный пароль'
	String get hint => 'Repeat the entered password';
}

// Path: profile.settings
class Translations$profile$settings$en {
	Translations$profile$settings$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Настройки'
	String get title => 'Settings';

	late final Translations$profile$settings$user$en user = Translations$profile$settings$user$en._(_root);
	late final Translations$profile$settings$application$en application = Translations$profile$settings$application$en._(_root);

	/// ru: 'Выйти из профиля'
	String get sign_out => 'Log out of profile';

	/// ru: 'Войти или зарегистрироваться'
	String get sign_in => 'Log in or register';
}

// Path: profile.edit
class Translations$profile$edit$en {
	Translations$profile$edit$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Редактировать профиль'
	String get title => 'Edit profile';

	late final Translations$profile$edit$password$en password = Translations$profile$edit$password$en._(_root);
	late final Translations$profile$edit$main$en main = Translations$profile$edit$main$en._(_root);
}

// Path: authentication.failure
class Translations$authentication$failure$en {
	Translations$authentication$failure$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Неверные учетные данные. Проверьте правильность введенного email и пароля.'
	String get invalid_credentials => 'Invalid credentials. Check that the email and password you entered are correct.';

	/// ru: 'Слишком много попыток входа. Попробуйте позже или сбросьте пароль.'
	String get too_many_requests => 'Too many login attempts. Try again later or reset your password.';

	/// ru: 'Этот email уже используется другим аккаунтом.'
	String get already_exist => 'This email is already being used by another account.';

	/// ru: 'Произошла ошибка при аутентификации. Пожалуйста, попробуйте снова.'
	String get unknown => 'An error occurred during authentication. Please try again.';
}

// Path: authentication.sign_in
class Translations$authentication$sign_in$en {
	Translations$authentication$sign_in$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$authentication$sign_in$no_account$en no_account = Translations$authentication$sign_in$no_account$en._(_root);

	/// ru: 'Войти'
	String get button => 'Log in';

	/// ru: 'Войти в аккаунт'
	String get title => 'Log in to your account';

	late final Translations$authentication$sign_in$forget_password$en forget_password = Translations$authentication$sign_in$forget_password$en._(_root);
}

// Path: authentication.sign_up
class Translations$authentication$sign_up$en {
	Translations$authentication$sign_up$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$authentication$sign_up$have_account$en have_account = Translations$authentication$sign_up$have_account$en._(_root);
	late final Translations$authentication$sign_up$confirm_password$en confirm_password = Translations$authentication$sign_up$confirm_password$en._(_root);

	/// ru: 'Зарегистрироваться'
	String get button => 'Sign up';

	/// ru: 'Зарегистрироваться'
	String get title => 'Sign up';
}

// Path: leaderboard.periods
class Translations$leaderboard$periods$en {
	Translations$leaderboard$periods$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'дня'
	String get daily => 'today';

	/// ru: 'недели'
	String get weekly => 'this week';

	/// ru: 'месяца'
	String get monthly => 'this month';

	/// ru: 'года'
	String get yearly => 'this year';
}

// Path: achievements.categories
class Translations$achievements$categories$en {
	Translations$achievements$categories$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Начинающий'
	String get beginner => 'Beginner';

	/// ru: 'Прогресс'
	String get progress => 'Progress';

	/// ru: 'Точность'
	String get accuracy => 'Accuracy';

	/// ru: 'Серия'
	String get streak => 'Streak';

	/// ru: 'Очки'
	String get points => 'Points';
}

// Path: question.dialog
class Translations$question$dialog$en {
	Translations$question$dialog$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$question$dialog$correct$en correct = Translations$question$dialog$correct$en._(_root);
	late final Translations$question$dialog$incorrect$en incorrect = Translations$question$dialog$incorrect$en._(_root);

	/// ru: 'Продолжить'
	String get button => 'Continue';
}

// Path: question.error_snackbar
class Translations$question$error_snackbar$en {
	Translations$question$error_snackbar$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$question$error_snackbar$answered_on_another_device$en answered_on_another_device = Translations$question$error_snackbar$answered_on_another_device$en._(_root);
	late final Translations$question$error_snackbar$already_answered$en already_answered = Translations$question$error_snackbar$already_answered$en._(_root);
	late final Translations$question$error_snackbar$save_failed_retry_later$en save_failed_retry_later = Translations$question$error_snackbar$save_failed_retry_later$en._(_root);
}

// Path: onboarding.features
class Translations$onboarding$features$en {
	Translations$onboarding$features$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Ежедневный выпуск: 10 вопросов — или больше с Quiz+'
	String get f1 => 'Daily edition: 10 questions — or more with Quiz+';

	/// ru: 'Узнаете не только что правильно, но и почему'
	String get f2 => 'Learn not just what\'s right, but why';

	/// ru: 'Поможем заполнить пробелы — вопросы, где ошиблись, вернутся'
	String get f3 => 'We fill the gaps — questions you missed will come back';

	/// ru: 'Соревнуйтесь, собирайте серии, открывайте достижения'
	String get f4 => 'Compete, build streaks, unlock achievements';
}

// Path: profile.settings.user
class Translations$profile$settings$user$en {
	Translations$profile$settings$user$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Настройки'
	String get title => 'Settings';

	/// ru: 'Редактировать профиль'
	String get go_to_edit => 'Edit profile';

	/// ru: 'Настройки уведомлений'
	String get go_to_notifications_settings => 'Настройки уведомлений';

	/// ru: 'Управление подпиской'
	String get go_to_subscriptions => 'Управление подпиской';
}

// Path: profile.settings.application
class Translations$profile$settings$application$en {
	Translations$profile$settings$application$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Приложение'
	String get title => 'Application';

	late final Translations$profile$settings$application$language$en language = Translations$profile$settings$application$language$en._(_root);
	late final Translations$profile$settings$application$theme$en theme = Translations$profile$settings$application$theme$en._(_root);

	/// ru: 'Менеджер памяти'
	String get go_to_storage_manager => 'Memory Manager';

	/// ru: 'О приложении'
	String get go_to_about_app => 'About the application';
}

// Path: profile.edit.password
class Translations$profile$edit$password$en {
	Translations$profile$edit$password$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Изменить пароль'
	String get title => 'Change password';

	/// ru: 'Введите старый пароль'
	String get old_password_hint => 'Enter old password';

	/// ru: 'Введите новый пароль'
	String get new_password_hint => 'Enter new password';

	/// ru: 'Повторите новый пароль'
	String get new_confirm_password_hint => 'Repeat new password';

	/// ru: 'Пароли не совпадают'
	String get confirm_password_validation_message => 'Passwords don\'t match';

	/// ru: 'Сохранить'
	String get button => 'Save';

	late final Translations$profile$edit$password$result$en result = Translations$profile$edit$password$result$en._(_root);
}

// Path: profile.edit.main
class Translations$profile$edit$main$en {
	Translations$profile$edit$main$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Основная информация'
	String get title => 'Basic information';

	late final Translations$profile$edit$main$name$en name = Translations$profile$edit$main$name$en._(_root);
	late final Translations$profile$edit$main$date$en date = Translations$profile$edit$main$date$en._(_root);
	late final Translations$profile$edit$main$result$en result = Translations$profile$edit$main$result$en._(_root);
}

// Path: authentication.sign_in.no_account
class Translations$authentication$sign_in$no_account$en {
	Translations$authentication$sign_in$no_account$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Нет аккаунта?'
	String get text => 'Don\'t have an account yet?';

	/// ru: 'Зарегистрироваться'
	String get sign_up => 'Sign up';
}

// Path: authentication.sign_in.forget_password
class Translations$authentication$sign_in$forget_password$en {
	Translations$authentication$sign_in$forget_password$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Не помню пароль'
	String get button => 'I don\'t remember the password';

	late final Translations$authentication$sign_in$forget_password$dialog$en dialog = Translations$authentication$sign_in$forget_password$dialog$en._(_root);
}

// Path: authentication.sign_up.have_account
class Translations$authentication$sign_up$have_account$en {
	Translations$authentication$sign_up$have_account$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Есть аккаунт?'
	String get text => 'Already have an account?';

	/// ru: 'Войти'
	String get sign_in => 'Log in';
}

// Path: authentication.sign_up.confirm_password
class Translations$authentication$sign_up$confirm_password$en {
	Translations$authentication$sign_up$confirm_password$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Подтверждение пароля'
	String get label => 'Confirm Password';

	/// ru: 'Повторите пароль'
	String get hint => 'Re-enter your password';

	/// ru: 'Пароли не совпадают'
	String get validation_message => 'Passwords do not match';
}

// Path: question.dialog.correct
class Translations$question$dialog$correct$en {
	Translations$question$dialog$correct$en._(this._root);

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
class Translations$question$dialog$incorrect$en {
	Translations$question$dialog$incorrect$en._(this._root);

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
class Translations$question$error_snackbar$answered_on_another_device$en {
	Translations$question$error_snackbar$answered_on_another_device$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Этот вопрос уже был отвечен на другом устройстве. Он больше не повторится.'
	String get text => 'This question was already answered on another device. It won\'t appear again.';

	/// ru: 'Понятно'
	String get button => 'Got it';
}

// Path: question.error_snackbar.already_answered
class Translations$question$error_snackbar$already_answered$en {
	Translations$question$error_snackbar$already_answered$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Этот вопрос у вас уже в копилке ответов и не будет перезаписан'
	String get text => 'This question is already in your answer collection and won\'t be overwritten';

	/// ru: 'Понятно'
	String get button => 'Got it';
}

// Path: question.error_snackbar.save_failed_retry_later
class Translations$question$error_snackbar$save_failed_retry_later$en {
	Translations$question$error_snackbar$save_failed_retry_later$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Упс! Ответ не сохранился, но вопрос вернётся позже. У вас будет ещё шанс!'
	String get text => 'Oops! Your answer wasn\'t saved, but this question will return later. You\'ll get another chance!';

	/// ru: 'Попробую позже'
	String get button => 'Try again later';
}

// Path: profile.settings.application.language
class Translations$profile$settings$application$language$en {
	Translations$profile$settings$application$language$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Изменить язык'
	String get change => 'Choose language';
}

// Path: profile.settings.application.theme
class Translations$profile$settings$application$theme$en {
	Translations$profile$settings$application$theme$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Тема оформления'
	String get title => 'Theme';

	late final Translations$profile$settings$application$theme$switcher$en switcher = Translations$profile$settings$application$theme$switcher$en._(_root);
}

// Path: profile.edit.password.result
class Translations$profile$edit$password$result$en {
	Translations$profile$edit$password$result$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Пароль успешно изменен'
	String get success => 'Password successfully changed';

	/// ru: 'Не удалось изменить пароль. Пожалуйста, проверьте введенные данные и попробуйте снова'
	String get failed => 'The password could not be changed. Please check the entered data and try again';
}

// Path: profile.edit.main.name
class Translations$profile$edit$main$name$en {
	Translations$profile$edit$main$name$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Имя'
	String get label => 'Name';

	/// ru: 'Введите ваше имя'
	String get hint => 'Enter your name';
}

// Path: profile.edit.main.date
class Translations$profile$edit$main$date$en {
	Translations$profile$edit$main$date$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Укажите дату вашего рождения'
	String get hint => 'Specify your date of birth';

	late final Translations$profile$edit$main$date$picker$en picker = Translations$profile$edit$main$date$picker$en._(_root);
}

// Path: profile.edit.main.result
class Translations$profile$edit$main$result$en {
	Translations$profile$edit$main$result$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Информация успешно изменена'
	String get success => 'Information successfully changed';

	/// ru: 'Не удалось изменить информацию. Пожалуйста, проверьте введенные данные и попробуйте снова'
	String get failed => 'Information could not be changed. Please check the entered data and try again';
}

// Path: authentication.sign_in.forget_password.dialog
class Translations$authentication$sign_in$forget_password$dialog$en {
	Translations$authentication$sign_in$forget_password$dialog$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Восстановление пароля'
	String get title => 'Password recovery';

	late final Translations$authentication$sign_in$forget_password$dialog$valid$en valid = Translations$authentication$sign_in$forget_password$dialog$valid$en._(_root);
	late final Translations$authentication$sign_in$forget_password$dialog$invalid$en invalid = Translations$authentication$sign_in$forget_password$dialog$invalid$en._(_root);
	late final Translations$authentication$sign_in$forget_password$dialog$result$en result = Translations$authentication$sign_in$forget_password$dialog$result$en._(_root);
}

// Path: profile.settings.application.theme.switcher
class Translations$profile$settings$application$theme$switcher$en {
	Translations$profile$settings$application$theme$switcher$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Как в системе'
	String get as_system => 'As in the system';
}

// Path: profile.edit.main.date.picker
class Translations$profile$edit$main$date$picker$en {
	Translations$profile$edit$main$date$picker$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Дата рождения'
	String get title => 'Date of birth';

	late final Translations$profile$edit$main$date$picker$button$en button = Translations$profile$edit$main$date$picker$button$en._(_root);
}

// Path: authentication.sign_in.forget_password.dialog.valid
class Translations$authentication$sign_in$forget_password$dialog$valid$en {
	Translations$authentication$sign_in$forget_password$dialog$valid$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Сбросить'
	String get accept => 'Reset';

	/// ru: 'Отмена'
	String get cancel => 'Cancel';

	/// ru: 'Вы действительно хотите сбросить пароль?'
	String get description => 'Do you really want to reset the password?';
}

// Path: authentication.sign_in.forget_password.dialog.invalid
class Translations$authentication$sign_in$forget_password$dialog$invalid$en {
	Translations$authentication$sign_in$forget_password$dialog$invalid$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Хорошо'
	String get button => 'OK';

	/// ru: 'Введите корректный адрес электронной почты.'
	String get description => 'Enter the correct email address.';
}

// Path: authentication.sign_in.forget_password.dialog.result
class Translations$authentication$sign_in$forget_password$dialog$result$en {
	Translations$authentication$sign_in$forget_password$dialog$result$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Ссылка на сброс пароля отправлена на вашу почту. Ссылка действительна в течение 1 часа.'
	String get success => 'The link to reset the password has been sent to your email. The link is valid for 1 hour.';

	/// ru: 'Не удалось отправить ссылку для сброса пароля. Пожалуйста, попробуйте позже.'
	String get failed => 'The password reset link could not be sent. Please try again later.';
}

// Path: profile.edit.main.date.picker.button
class Translations$profile$edit$main$date$picker$button$en {
	Translations$profile$edit$main$date$picker$button$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Отмена'
	String get cancel => 'Cancel';

	/// ru: 'Готово'
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
			'leaderboard.title' => 'Leaderboard',
			'leaderboard.my_position' => 'My position',
			'leaderboard.empty' => 'No activity yet for this period',
			'leaderboard.periods.daily' => 'today',
			'leaderboard.periods.weekly' => 'this week',
			'leaderboard.periods.monthly' => 'this month',
			'leaderboard.periods.yearly' => 'this year',
			'gamification.level' => ({required Object level}) => 'Level ${level}',
			'gamification.level_short' => ({required Object level}) => 'Lvl ${level}',
			'gamification.xp' => ({required Object current, required Object total}) => '${current} / ${total} XP',
			'gamification.xp_remaining' => ({required Object remaining}) => '${remaining} XP left',
			'gamification.streak' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '${n} day streak', other: '${n} days streak', ), 
			'gamification.points' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '${n} pt', other: '${n} pts', ), 
			'gamification.accuracy' => ({required Object value}) => '${value}% accuracy',
			'gamification.achievements_link' => 'Achievements',
			'gamification.streak_days' => 'Day streak',
			'gamification.questions_answered' => 'Questions',
			'gamification.correct_answers' => 'Correct',
			'gamification.points_label' => 'Points',
			'gamification.accuracy_label' => 'Accuracy',
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
			'onboarding.daily_issue' => 'DAILY EDITION',
			'onboarding.issue_number' => ({required Object n}) => 'EDITION № ${n}',
			'onboarding.headline' => 'Ten\nquestions.\nEvery day.',
			'onboarding.subtitle' => 'One game a day — and you\'re in the leaderboard.',
			'onboarding.features.f1' => 'Daily edition: 10 questions — or more with Quiz+',
			'onboarding.features.f2' => 'Learn not just what\'s right, but why',
			'onboarding.features.f3' => 'We fill the gaps — questions you missed will come back',
			'onboarding.features.f4' => 'Compete, build streaks, unlock achievements',
			'onboarding.start_free' => 'START FOR FREE',
			'onboarding.already_played' => 'PLAYED BEFORE?',
			'onboarding.sign_in_link' => 'SIGN IN',
			'sign_in.title' => 'Welcome\nback',
			'sign_in.email_label' => 'EMAIL',
			'sign_in.password_label' => 'PASSWORD',
			'sign_in.forgot_password' => 'Forgot password?',
			'sign_in.submit' => 'SIGN IN',
			'sign_in.no_account' => 'No account?',
			'sign_in.register_link' => 'Register',
			'sign_up.title' => 'Create\naccount',
			'sign_up.name_label' => 'NAME',
			'sign_up.email_label' => 'EMAIL',
			'sign_up.password_label' => 'PASSWORD',
			'sign_up.submit' => 'CREATE ACCOUNT',
			'sign_up.have_account' => 'Already have an account?',
			'sign_up.sign_in_link' => 'Sign in',
			'forgot_password.title' => 'Forgot\npassword?',
			'forgot_password.subtitle' => 'Enter your email — we\'ll send a reset link.',
			'forgot_password.email_label' => 'EMAIL',
			'forgot_password.submit' => 'SEND LINK',
			'forgot_password.submitting' => 'SENDING...',
			'forgot_password.hint' => 'Link is valid for 15 minutes. Check your Spam folder if the email doesn\'t arrive.',
			'forgot_password.success' => 'Link sent. Check your inbox.',
			'forgot_password.error' => 'Failed to send the link. Please try again later.',
			'nav.game' => 'GAME',
			'nav.leaderboard' => 'RANK',
			'nav.profile' => 'PROFILE',
			_ => null,
		};
	}
}
