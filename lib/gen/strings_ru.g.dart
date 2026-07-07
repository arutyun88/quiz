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
	@override late final _Translations$text_field$ru text_field = _Translations$text_field$ru._(_root);
	@override late final _Translations$profile$ru profile = _Translations$profile$ru._(_root);
	@override late final _Translations$authentication$ru authentication = _Translations$authentication$ru._(_root);
	@override late final _Translations$leaderboard$ru leaderboard = _Translations$leaderboard$ru._(_root);
	@override late final _Translations$gamification$ru gamification = _Translations$gamification$ru._(_root);
	@override late final _Translations$achievements$ru achievements = _Translations$achievements$ru._(_root);
	@override late final _Translations$question$ru question = _Translations$question$ru._(_root);
	@override late final _Translations$onboarding$ru onboarding = _Translations$onboarding$ru._(_root);
	@override late final _Translations$sign_in$ru sign_in = _Translations$sign_in$ru._(_root);
	@override late final _Translations$sign_up$ru sign_up = _Translations$sign_up$ru._(_root);
	@override late final _Translations$forgot_password$ru forgot_password = _Translations$forgot_password$ru._(_root);
	@override late final _Translations$nav$ru nav = _Translations$nav$ru._(_root);
}

// Path: text_field
class _Translations$text_field$ru implements Translations$text_field$en {
	_Translations$text_field$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$text_field$email$ru email = _Translations$text_field$email$ru._(_root);
	@override late final _Translations$text_field$password$ru password = _Translations$text_field$password$ru._(_root);
	@override late final _Translations$text_field$confirm_password$ru confirm_password = _Translations$text_field$confirm_password$ru._(_root);
}

// Path: profile
class _Translations$profile$ru implements Translations$profile$en {
	_Translations$profile$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Профиль';
	@override late final _Translations$profile$settings$ru settings = _Translations$profile$settings$ru._(_root);
	@override late final _Translations$profile$edit$ru edit = _Translations$profile$edit$ru._(_root);
}

// Path: authentication
class _Translations$authentication$ru implements Translations$authentication$en {
	_Translations$authentication$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$authentication$failure$ru failure = _Translations$authentication$failure$ru._(_root);
	@override late final _Translations$authentication$sign_in$ru sign_in = _Translations$authentication$sign_in$ru._(_root);
	@override late final _Translations$authentication$sign_up$ru sign_up = _Translations$authentication$sign_up$ru._(_root);
	@override TextSpan agreement({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'Используя приложение, вы соглашаетесь на обработку персональных данных согласно '),
		link('Пользовательскому соглашению'),
	]);
}

// Path: leaderboard
class _Translations$leaderboard$ru implements Translations$leaderboard$en {
	_Translations$leaderboard$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Рейтинг';
	@override String get my_position => 'Моя позиция';
	@override String get empty => 'Нет активности за этот период';
	@override late final _Translations$leaderboard$periods$ru periods = _Translations$leaderboard$periods$ru._(_root);
}

// Path: gamification
class _Translations$gamification$ru implements Translations$gamification$en {
	_Translations$gamification$ru._(this._root);

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
	@override String get streak_badge_label => 'СЕРИЯ';
	@override String get level_badge_label => 'УР.';
	@override String get streak_days => 'Дней подряд';
	@override String get questions_answered => 'Вопросов';
	@override String get correct_answers => 'Правильных';
	@override String get points_label => 'Очков';
	@override String get accuracy_label => 'Точность';
}

// Path: achievements
class _Translations$achievements$ru implements Translations$achievements$en {
	_Translations$achievements$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Достижения';
	@override late final _Translations$achievements$categories$ru categories = _Translations$achievements$categories$ru._(_root);
	@override String get error => 'Не удалось загрузить';
	@override String get retry => 'Повторить';
}

// Path: question
class _Translations$question$ru implements Translations$question$en {
	_Translations$question$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$question$dialog$ru dialog = _Translations$question$dialog$ru._(_root);
	@override late final _Translations$question$error_snackbar$ru error_snackbar = _Translations$question$error_snackbar$ru._(_root);
}

// Path: onboarding
class _Translations$onboarding$ru implements Translations$onboarding$en {
	_Translations$onboarding$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get daily_issue => 'ЕЖЕДНЕВНЫЙ ВЫПУСК';
	@override String issue_number({required Object n}) => 'ВЫПУСК № ${n}';
	@override String get headline => 'Десять\nвопросов.\nКаждый день.';
	@override String get subtitle => 'Одна игра в день — и ты в общем рейтинге.';
	@override late final _Translations$onboarding$features$ru features = _Translations$onboarding$features$ru._(_root);
	@override String get start_free => 'НАЧАТЬ БЕСПЛАТНО';
	@override String get already_played => 'УЖЕ ИГРАЛИ?';
	@override String get sign_in_link => 'ВОЙТИ';
}

// Path: sign_in
class _Translations$sign_in$ru implements Translations$sign_in$en {
	_Translations$sign_in$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Добро\nпожаловать';
	@override String get email_label => 'EMAIL';
	@override String get password_label => 'ПАРОЛЬ';
	@override String get forgot_password => 'Забыли пароль?';
	@override String get submit => 'ВОЙТИ';
	@override String get no_account => 'Нет аккаунта?';
	@override String get register_link => 'Зарегистрироваться';
}

// Path: sign_up
class _Translations$sign_up$ru implements Translations$sign_up$en {
	_Translations$sign_up$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Создать\nаккаунт';
	@override String get name_label => 'ИМЯ';
	@override String get email_label => 'EMAIL';
	@override String get password_label => 'ПАРОЛЬ';
	@override String get submit => 'СОЗДАТЬ АККАУНТ';
	@override String get have_account => 'Уже есть аккаунт?';
	@override String get sign_in_link => 'Войти';
}

// Path: forgot_password
class _Translations$forgot_password$ru implements Translations$forgot_password$en {
	_Translations$forgot_password$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Забыли\nпароль?';
	@override String get subtitle => 'Введите email — пришлём ссылку для сброса пароля.';
	@override String get email_label => 'EMAIL';
	@override String get submit => 'ОТПРАВИТЬ ССЫЛКУ';
	@override String get submitting => 'ОТПРАВКА...';
	@override String get hint => 'Ссылка действует 15 минут. Проверьте папку «Спам», если письмо не пришло.';
	@override String get success => 'Ссылка отправлена. Проверьте почту.';
	@override String get error => 'Не удалось отправить ссылку. Попробуйте позже.';
}

// Path: nav
class _Translations$nav$ru implements Translations$nav$en {
	_Translations$nav$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get game => 'ИГРА';
	@override String get leaderboard => 'РЕЙТИНГ';
	@override String get profile => 'ПРОФИЛЬ';
}

// Path: text_field.email
class _Translations$text_field$email$ru implements Translations$text_field$email$en {
	_Translations$text_field$email$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Email';
	@override String get hint => 'Введите ваш email-адрес';
	@override String get validation_message => 'Неверный формат электронной почты';
}

// Path: text_field.password
class _Translations$text_field$password$ru implements Translations$text_field$password$en {
	_Translations$text_field$password$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Пароль';
	@override String get hint => 'Минимум 8 символов, буквы и цифры';
	@override String get validation_message => '8+ символов: 1 заглавная, 1 строчная, 1 цифра';
}

// Path: text_field.confirm_password
class _Translations$text_field$confirm_password$ru implements Translations$text_field$confirm_password$en {
	_Translations$text_field$confirm_password$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Подтвердите пароль';
	@override String get hint => 'Повторите введенный пароль';
}

// Path: profile.settings
class _Translations$profile$settings$ru implements Translations$profile$settings$en {
	_Translations$profile$settings$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Настройки';
	@override late final _Translations$profile$settings$user$ru user = _Translations$profile$settings$user$ru._(_root);
	@override late final _Translations$profile$settings$application$ru application = _Translations$profile$settings$application$ru._(_root);
	@override String get sign_out => 'Выйти из профиля';
	@override String get sign_in => 'Войти или зарегистрироваться';
}

// Path: profile.edit
class _Translations$profile$edit$ru implements Translations$profile$edit$en {
	_Translations$profile$edit$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Редактировать профиль';
	@override late final _Translations$profile$edit$password$ru password = _Translations$profile$edit$password$ru._(_root);
	@override late final _Translations$profile$edit$main$ru main = _Translations$profile$edit$main$ru._(_root);
}

// Path: authentication.failure
class _Translations$authentication$failure$ru implements Translations$authentication$failure$en {
	_Translations$authentication$failure$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get invalid_credentials => 'Неверные учетные данные. Проверьте правильность введенного email и пароля.';
	@override String get too_many_requests => 'Слишком много попыток входа. Попробуйте позже или сбросьте пароль.';
	@override String get already_exist => 'Этот email уже используется другим аккаунтом.';
	@override String get unknown => 'Произошла ошибка при аутентификации. Пожалуйста, попробуйте снова.';
}

// Path: authentication.sign_in
class _Translations$authentication$sign_in$ru implements Translations$authentication$sign_in$en {
	_Translations$authentication$sign_in$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$authentication$sign_in$no_account$ru no_account = _Translations$authentication$sign_in$no_account$ru._(_root);
	@override String get button => 'Войти';
	@override String get title => 'Войти в аккаунт';
	@override late final _Translations$authentication$sign_in$forget_password$ru forget_password = _Translations$authentication$sign_in$forget_password$ru._(_root);
}

// Path: authentication.sign_up
class _Translations$authentication$sign_up$ru implements Translations$authentication$sign_up$en {
	_Translations$authentication$sign_up$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$authentication$sign_up$have_account$ru have_account = _Translations$authentication$sign_up$have_account$ru._(_root);
	@override late final _Translations$authentication$sign_up$confirm_password$ru confirm_password = _Translations$authentication$sign_up$confirm_password$ru._(_root);
	@override String get button => 'Зарегистрироваться';
	@override String get title => 'Зарегистрироваться';
}

// Path: leaderboard.periods
class _Translations$leaderboard$periods$ru implements Translations$leaderboard$periods$en {
	_Translations$leaderboard$periods$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get daily => 'дня';
	@override String get weekly => 'недели';
	@override String get monthly => 'месяца';
	@override String get yearly => 'года';
}

// Path: achievements.categories
class _Translations$achievements$categories$ru implements Translations$achievements$categories$en {
	_Translations$achievements$categories$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get beginner => 'Начинающий';
	@override String get progress => 'Прогресс';
	@override String get accuracy => 'Точность';
	@override String get streak => 'Серия';
	@override String get points => 'Очки';
}

// Path: question.dialog
class _Translations$question$dialog$ru implements Translations$question$dialog$en {
	_Translations$question$dialog$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$question$dialog$correct$ru correct = _Translations$question$dialog$correct$ru._(_root);
	@override late final _Translations$question$dialog$incorrect$ru incorrect = _Translations$question$dialog$incorrect$ru._(_root);
	@override String get button => 'Продолжить';
}

// Path: question.error_snackbar
class _Translations$question$error_snackbar$ru implements Translations$question$error_snackbar$en {
	_Translations$question$error_snackbar$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$question$error_snackbar$answered_on_another_device$ru answered_on_another_device = _Translations$question$error_snackbar$answered_on_another_device$ru._(_root);
	@override late final _Translations$question$error_snackbar$already_answered$ru already_answered = _Translations$question$error_snackbar$already_answered$ru._(_root);
	@override late final _Translations$question$error_snackbar$save_failed_retry_later$ru save_failed_retry_later = _Translations$question$error_snackbar$save_failed_retry_later$ru._(_root);
}

// Path: onboarding.features
class _Translations$onboarding$features$ru implements Translations$onboarding$features$en {
	_Translations$onboarding$features$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get f1 => 'Ежедневный выпуск: 10 вопросов — или больше с Quiz+';
	@override String get f2 => 'Узнаете не только что правильно, но и почему';
	@override String get f3 => 'Поможем заполнить пробелы — вопросы, где ошиблись, вернутся';
	@override String get f4 => 'Соревнуйтесь, собирайте серии, открывайте достижения';
}

// Path: profile.settings.user
class _Translations$profile$settings$user$ru implements Translations$profile$settings$user$en {
	_Translations$profile$settings$user$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Настройки';
	@override String get go_to_edit => 'Редактировать профиль';
	@override String get go_to_notifications_settings => 'Настройки уведомлений';
	@override String get go_to_subscriptions => 'Управление подпиской';
}

// Path: profile.settings.application
class _Translations$profile$settings$application$ru implements Translations$profile$settings$application$en {
	_Translations$profile$settings$application$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Приложение';
	@override late final _Translations$profile$settings$application$language$ru language = _Translations$profile$settings$application$language$ru._(_root);
	@override late final _Translations$profile$settings$application$theme$ru theme = _Translations$profile$settings$application$theme$ru._(_root);
	@override String get go_to_storage_manager => 'Менеджер памяти';
	@override String get go_to_about_app => 'О приложении';
}

// Path: profile.edit.password
class _Translations$profile$edit$password$ru implements Translations$profile$edit$password$en {
	_Translations$profile$edit$password$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Изменить пароль';
	@override String get old_password_hint => 'Введите старый пароль';
	@override String get new_password_hint => 'Введите новый пароль';
	@override String get new_confirm_password_hint => 'Повторите новый пароль';
	@override String get confirm_password_validation_message => 'Пароли не совпадают';
	@override String get button => 'Сохранить';
	@override late final _Translations$profile$edit$password$result$ru result = _Translations$profile$edit$password$result$ru._(_root);
}

// Path: profile.edit.main
class _Translations$profile$edit$main$ru implements Translations$profile$edit$main$en {
	_Translations$profile$edit$main$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Основная информация';
	@override late final _Translations$profile$edit$main$name$ru name = _Translations$profile$edit$main$name$ru._(_root);
	@override late final _Translations$profile$edit$main$date$ru date = _Translations$profile$edit$main$date$ru._(_root);
	@override late final _Translations$profile$edit$main$result$ru result = _Translations$profile$edit$main$result$ru._(_root);
}

// Path: authentication.sign_in.no_account
class _Translations$authentication$sign_in$no_account$ru implements Translations$authentication$sign_in$no_account$en {
	_Translations$authentication$sign_in$no_account$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get text => 'Нет аккаунта?';
	@override String get sign_up => 'Зарегистрироваться';
}

// Path: authentication.sign_in.forget_password
class _Translations$authentication$sign_in$forget_password$ru implements Translations$authentication$sign_in$forget_password$en {
	_Translations$authentication$sign_in$forget_password$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get button => 'Не помню пароль';
	@override late final _Translations$authentication$sign_in$forget_password$dialog$ru dialog = _Translations$authentication$sign_in$forget_password$dialog$ru._(_root);
}

// Path: authentication.sign_up.have_account
class _Translations$authentication$sign_up$have_account$ru implements Translations$authentication$sign_up$have_account$en {
	_Translations$authentication$sign_up$have_account$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get text => 'Есть аккаунт?';
	@override String get sign_in => 'Войти';
}

// Path: authentication.sign_up.confirm_password
class _Translations$authentication$sign_up$confirm_password$ru implements Translations$authentication$sign_up$confirm_password$en {
	_Translations$authentication$sign_up$confirm_password$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Подтверждение пароля';
	@override String get hint => 'Повторите пароль';
	@override String get validation_message => 'Пароли не совпадают';
}

// Path: question.dialog.correct
class _Translations$question$dialog$correct$ru implements Translations$question$dialog$correct$en {
	_Translations$question$dialog$correct$ru._(this._root);

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
class _Translations$question$dialog$incorrect$ru implements Translations$question$dialog$incorrect$en {
	_Translations$question$dialog$incorrect$ru._(this._root);

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
class _Translations$question$error_snackbar$answered_on_another_device$ru implements Translations$question$error_snackbar$answered_on_another_device$en {
	_Translations$question$error_snackbar$answered_on_another_device$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get text => 'Этот вопрос уже был отвечен на другом устройстве. Он больше не повторится.';
	@override String get button => 'Понятно';
}

// Path: question.error_snackbar.already_answered
class _Translations$question$error_snackbar$already_answered$ru implements Translations$question$error_snackbar$already_answered$en {
	_Translations$question$error_snackbar$already_answered$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get text => 'Этот вопрос у вас уже в копилке ответов и не будет перезаписан';
	@override String get button => 'Понятно';
}

// Path: question.error_snackbar.save_failed_retry_later
class _Translations$question$error_snackbar$save_failed_retry_later$ru implements Translations$question$error_snackbar$save_failed_retry_later$en {
	_Translations$question$error_snackbar$save_failed_retry_later$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get text => 'Упс! Ответ не сохранился, но вопрос вернётся позже. У вас будет ещё шанс!';
	@override String get button => 'Попробую позже';
}

// Path: profile.settings.application.language
class _Translations$profile$settings$application$language$ru implements Translations$profile$settings$application$language$en {
	_Translations$profile$settings$application$language$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get change => 'Изменить язык';
}

// Path: profile.settings.application.theme
class _Translations$profile$settings$application$theme$ru implements Translations$profile$settings$application$theme$en {
	_Translations$profile$settings$application$theme$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Тема оформления';
	@override late final _Translations$profile$settings$application$theme$switcher$ru switcher = _Translations$profile$settings$application$theme$switcher$ru._(_root);
}

// Path: profile.edit.password.result
class _Translations$profile$edit$password$result$ru implements Translations$profile$edit$password$result$en {
	_Translations$profile$edit$password$result$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get success => 'Пароль успешно изменен';
	@override String get failed => 'Не удалось изменить пароль. Пожалуйста, проверьте введенные данные и попробуйте снова';
}

// Path: profile.edit.main.name
class _Translations$profile$edit$main$name$ru implements Translations$profile$edit$main$name$en {
	_Translations$profile$edit$main$name$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Имя';
	@override String get hint => 'Введите ваше имя';
}

// Path: profile.edit.main.date
class _Translations$profile$edit$main$date$ru implements Translations$profile$edit$main$date$en {
	_Translations$profile$edit$main$date$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get hint => 'Укажите дату вашего рождения';
	@override late final _Translations$profile$edit$main$date$picker$ru picker = _Translations$profile$edit$main$date$picker$ru._(_root);
}

// Path: profile.edit.main.result
class _Translations$profile$edit$main$result$ru implements Translations$profile$edit$main$result$en {
	_Translations$profile$edit$main$result$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get success => 'Информация успешно изменена';
	@override String get failed => 'Не удалось изменить информацию. Пожалуйста, проверьте введенные данные и попробуйте снова';
}

// Path: authentication.sign_in.forget_password.dialog
class _Translations$authentication$sign_in$forget_password$dialog$ru implements Translations$authentication$sign_in$forget_password$dialog$en {
	_Translations$authentication$sign_in$forget_password$dialog$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Восстановление пароля';
	@override late final _Translations$authentication$sign_in$forget_password$dialog$valid$ru valid = _Translations$authentication$sign_in$forget_password$dialog$valid$ru._(_root);
	@override late final _Translations$authentication$sign_in$forget_password$dialog$invalid$ru invalid = _Translations$authentication$sign_in$forget_password$dialog$invalid$ru._(_root);
	@override late final _Translations$authentication$sign_in$forget_password$dialog$result$ru result = _Translations$authentication$sign_in$forget_password$dialog$result$ru._(_root);
}

// Path: profile.settings.application.theme.switcher
class _Translations$profile$settings$application$theme$switcher$ru implements Translations$profile$settings$application$theme$switcher$en {
	_Translations$profile$settings$application$theme$switcher$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get as_system => 'Как в системе';
}

// Path: profile.edit.main.date.picker
class _Translations$profile$edit$main$date$picker$ru implements Translations$profile$edit$main$date$picker$en {
	_Translations$profile$edit$main$date$picker$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Дата рождения';
	@override late final _Translations$profile$edit$main$date$picker$button$ru button = _Translations$profile$edit$main$date$picker$button$ru._(_root);
}

// Path: authentication.sign_in.forget_password.dialog.valid
class _Translations$authentication$sign_in$forget_password$dialog$valid$ru implements Translations$authentication$sign_in$forget_password$dialog$valid$en {
	_Translations$authentication$sign_in$forget_password$dialog$valid$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Сбросить';
	@override String get cancel => 'Отмена';
	@override String get description => 'Вы действительно хотите сбросить пароль?';
}

// Path: authentication.sign_in.forget_password.dialog.invalid
class _Translations$authentication$sign_in$forget_password$dialog$invalid$ru implements Translations$authentication$sign_in$forget_password$dialog$invalid$en {
	_Translations$authentication$sign_in$forget_password$dialog$invalid$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get button => 'Хорошо';
	@override String get description => 'Введите корректный адрес электронной почты.';
}

// Path: authentication.sign_in.forget_password.dialog.result
class _Translations$authentication$sign_in$forget_password$dialog$result$ru implements Translations$authentication$sign_in$forget_password$dialog$result$en {
	_Translations$authentication$sign_in$forget_password$dialog$result$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get success => 'Ссылка на сброс пароля отправлена на вашу почту. Ссылка действительна в течение 1 часа.';
	@override String get failed => 'Не удалось отправить ссылку для сброса пароля. Пожалуйста, попробуйте позже.';
}

// Path: profile.edit.main.date.picker.button
class _Translations$profile$edit$main$date$picker$button$ru implements Translations$profile$edit$main$date$picker$button$en {
	_Translations$profile$edit$main$date$picker$button$ru._(this._root);

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
			'gamification.streak_badge_label' => 'СЕРИЯ',
			'gamification.level_badge_label' => 'УР.',
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
			'onboarding.daily_issue' => 'ЕЖЕДНЕВНЫЙ ВЫПУСК',
			'onboarding.issue_number' => ({required Object n}) => 'ВЫПУСК № ${n}',
			'onboarding.headline' => 'Десять\nвопросов.\nКаждый день.',
			'onboarding.subtitle' => 'Одна игра в день — и ты в общем рейтинге.',
			'onboarding.features.f1' => 'Ежедневный выпуск: 10 вопросов — или больше с Quiz+',
			'onboarding.features.f2' => 'Узнаете не только что правильно, но и почему',
			'onboarding.features.f3' => 'Поможем заполнить пробелы — вопросы, где ошиблись, вернутся',
			'onboarding.features.f4' => 'Соревнуйтесь, собирайте серии, открывайте достижения',
			'onboarding.start_free' => 'НАЧАТЬ БЕСПЛАТНО',
			'onboarding.already_played' => 'УЖЕ ИГРАЛИ?',
			'onboarding.sign_in_link' => 'ВОЙТИ',
			'sign_in.title' => 'Добро\nпожаловать',
			'sign_in.email_label' => 'EMAIL',
			'sign_in.password_label' => 'ПАРОЛЬ',
			'sign_in.forgot_password' => 'Забыли пароль?',
			'sign_in.submit' => 'ВОЙТИ',
			'sign_in.no_account' => 'Нет аккаунта?',
			'sign_in.register_link' => 'Зарегистрироваться',
			'sign_up.title' => 'Создать\nаккаунт',
			'sign_up.name_label' => 'ИМЯ',
			'sign_up.email_label' => 'EMAIL',
			'sign_up.password_label' => 'ПАРОЛЬ',
			'sign_up.submit' => 'СОЗДАТЬ АККАУНТ',
			'sign_up.have_account' => 'Уже есть аккаунт?',
			'sign_up.sign_in_link' => 'Войти',
			'forgot_password.title' => 'Забыли\nпароль?',
			'forgot_password.subtitle' => 'Введите email — пришлём ссылку для сброса пароля.',
			'forgot_password.email_label' => 'EMAIL',
			'forgot_password.submit' => 'ОТПРАВИТЬ ССЫЛКУ',
			'forgot_password.submitting' => 'ОТПРАВКА...',
			'forgot_password.hint' => 'Ссылка действует 15 минут. Проверьте папку «Спам», если письмо не пришло.',
			'forgot_password.success' => 'Ссылка отправлена. Проверьте почту.',
			'forgot_password.error' => 'Не удалось отправить ссылку. Попробуйте позже.',
			'nav.game' => 'ИГРА',
			'nav.leaderboard' => 'РЕЙТИНГ',
			'nav.profile' => 'ПРОФИЛЬ',
			_ => null,
		};
	}
}
