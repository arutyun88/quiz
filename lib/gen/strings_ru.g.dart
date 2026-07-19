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
	@override late final _Translations$start_day$ru start_day = _Translations$start_day$ru._(_root);
	@override late final _Translations$nav$ru nav = _Translations$nav$ru._(_root);
	@override late final _Translations$birth_date_picker$ru birth_date_picker = _Translations$birth_date_picker$ru._(_root);
	@override late final _Translations$mastery$ru mastery = _Translations$mastery$ru._(_root);
	@override late final _Translations$review$ru review = _Translations$review$ru._(_root);
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
	@override late final _Translations$profile$view$ru view = _Translations$profile$view$ru._(_root);
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
	@override String get rank_header => 'МЕСТО';
	@override String get participant_header => 'УЧАСТНИК';
	@override String get points_header => 'ОЧКИ';
	@override String get accuracy_label => 'ТОЧНОСТЬ';
	@override String gap_row({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		one: 'ЕЩЁ ${n} УЧАСТНИК',
		few: 'ЕЩЁ ${n} УЧАСТНИКА',
		many: 'ЕЩЁ ${n} УЧАСТНИКОВ',
		other: 'ЕЩЁ ${n} УЧАСТНИКА',
	);
	@override String total_participants({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		one: 'ВСЕГО ${n} УЧАСТНИК',
		few: 'ВСЕГО ${n} УЧАСТНИКА',
		many: 'ВСЕГО ${n} УЧАСТНИКОВ',
		other: 'ВСЕГО ${n} УЧАСТНИКА',
	);
	@override String get retry => 'ПОВТОРИТЬ';
	@override String get load_failed => 'Не удалось загрузить рейтинг';
	@override late final _Translations$leaderboard$period_tabs$ru period_tabs = _Translations$leaderboard$period_tabs$ru._(_root);
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
	@override String xp_reward({required Object points}) => '+${points} XP';
	@override String get error => 'Не удалось загрузить';
	@override String get retry => 'Повторить';
}

// Path: question
class _Translations$question$ru implements Translations$question$en {
	_Translations$question$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override List<String> get answer_letters => [
		'А',
		'Б',
		'В',
		'Г',
	];
	@override late final _Translations$question$meta$ru meta = _Translations$question$meta$ru._(_root);
	@override late final _Translations$question$state$ru state = _Translations$question$state$ru._(_root);
	@override late final _Translations$question$answer_reveal$ru answer_reveal = _Translations$question$answer_reveal$ru._(_root);
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
	@override String get birth_date_label => 'ДАТА РОЖДЕНИЯ';
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

// Path: start_day
class _Translations$start_day$ru implements Translations$start_day$en {
	_Translations$start_day$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get start_button => 'НАЧАТЬ ВЫПУСК';
	@override String get ready_title => 'ВЫПУСК ДНЯ ГОТОВ';
	@override String get last_session_stats_title => 'ПОСЛЕДНИЙ ВЫПУСК';
	@override String get rank_label => 'В РЕЙТИНГЕ';
	@override String get points_label => 'ОЧКОВ';
	@override String get accuracy_label => 'ТОЧНОСТЬ';
	@override String question_count_label({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		one: 'вопрос',
		few: 'вопроса',
		many: 'вопросов',
		other: 'вопросов',
	);
	@override String estimated_time({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		one: '~ ${n} МИНУТА',
		few: '~ ${n} МИНУТЫ',
		many: '~ ${n} МИНУТ',
		other: '~ ${n} МИНУТ',
	);
	@override TextSpan streak_warning({required InlineSpanBuilder accent}) => TextSpan(children: [
		const TextSpan(text: 'Сыграйте сегодня, чтобы '),
		accent('не потерять серию'),
	]);
	@override TextSpan freeze_applied_notice({required InlineSpanBuilder accent, required InlineSpan left, required InlineSpan total}) => TextSpan(children: [
		const TextSpan(text: 'Вы пропустили вчерашний день — '),
		accent('заморозка применена автоматически.'),
		const TextSpan(text: ' Осталось '),
		left,
		const TextSpan(text: ' / '),
		total,
	]);
	@override TextSpan freeze_applied_advice({required InlineSpanBuilder accent}) => TextSpan(children: [
		const TextSpan(text: 'Сыграйте сегодня, чтобы '),
		accent('не расходовать заморозки без нужды'),
	]);
	@override TextSpan streak_lost_notice({required InlineSpan days, required InlineSpanBuilder accent}) => TextSpan(children: [
		const TextSpan(text: 'Серия из '),
		days,
		const TextSpan(text: ' '),
		accent('потеряна'),
		const TextSpan(text: ' — заморозок не осталось'),
	]);
	@override TextSpan streak_lost_notice_free({required InlineSpan days, required InlineSpanBuilder accent}) => TextSpan(children: [
		const TextSpan(text: 'Серия из '),
		days,
		const TextSpan(text: ' '),
		accent('потеряна'),
	]);
	@override String streak_lost_days({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		one: '${n} дня',
		few: '${n} дней',
		many: '${n} дней',
		other: '${n} дней',
	);
	@override TextSpan streak_lost_advice({required InlineSpanBuilder accent}) => TextSpan(children: [
		const TextSpan(text: 'Начните новую серию сегодня — '),
		accent('до первого достижения всего 3 дня'),
	]);
	@override String get start_new_streak_button => 'НАЧАТЬ НОВУЮ СЕРИЮ';
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

// Path: birth_date_picker
class _Translations$birth_date_picker$ru implements Translations$birth_date_picker$en {
	_Translations$birth_date_picker$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get apply => 'Готово';
}

// Path: mastery
class _Translations$mastery$ru implements Translations$mastery$en {
	_Translations$mastery$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Мастерство';
	@override String get topics_section => 'Владение по темам';
	@override String get weakest_label => 'Самая слабая тема';
	@override String weakest_accuracy({required Object percent}) => '${percent}% точности';
	@override String get weakest_tail => ' за 30 дней. Алгоритм чаще будет давать эти вопросы в выпусках.';
	@override String get weekly_delta_label => 'За неделю';
	@override String get best_day_label => 'Лучший день';
	@override String get empty => 'Пока нет данных — сыграйте выпуск дня, и мастерство появится здесь';
	@override String get error => 'Не удалось загрузить';
	@override String get retry => 'Повторить';
	@override late final _Translations$mastery$paywall$ru paywall = _Translations$mastery$paywall$ru._(_root);
}

// Path: review
class _Translations$review$ru implements Translations$review$en {
	_Translations$review$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'На повторение';
	@override String get info_banner => 'Вручную вызвать нельзя — интервальное повторение хранит честность рейтинга';
	@override String due_days({required Object n}) => '${n}д';
	@override String get due_label => 'Через';
	@override String wrong_times({required Object n}) => 'Ошибка ${n}×';
	@override String mastered_times({required Object n}) => 'Освоено ${n}×';
	@override String get queued_label => 'В очереди на повтор';
	@override String get mastered_label => 'Уже освоено';
	@override String get footer => 'Повтор приходит в следующих выпусках';
	@override String get empty => 'Очередь пуста — в последних выпусках не было ошибок';
	@override String get error => 'Не удалось загрузить';
	@override String get retry => 'Повторить';
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

// Path: profile.view
class _Translations$profile$view$ru implements Translations$profile$view$en {
	_Translations$profile$view$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get current_level_label => 'ТЕКУЩИЙ УР.';
	@override String next_level({required Object n}) => '→ УР. ${n}';
	@override String get stats_section => '// СТАТИСТИКА';
	@override String get stat_streak => 'СЕРИЯ, ДН.';
	@override String get stat_answers => 'ОТВЕТОВ';
	@override String get stat_accuracy => 'ТОЧНОСТЬ';
	@override String get stat_points => 'ОЧКОВ';
	@override String get stat_best_streak => 'ЛУЧШАЯ СЕРИЯ';
	@override String get stat_days_in_game => 'ДНЕЙ В ИГРЕ';
	@override String member_since({required Object date}) => 'В ИГРЕ С ${date}';
	@override String achievements({required Object unlocked, required Object total}) => 'ДОСТИЖЕНИЯ · ${unlocked}/${total}';
	@override String get load_failed => 'Не удалось загрузить профиль';
	@override String get retry => 'ПОВТОРИТЬ';
	@override String get mastery => 'Мастерство';
	@override String get review => 'На повторение';
}

// Path: profile.settings
class _Translations$profile$settings$ru implements Translations$profile$settings$en {
	_Translations$profile$settings$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Настройки';
	@override String get account_section => 'Аккаунт';
	@override String get app_section => 'Приложение';
	@override String get edit_profile => 'Редактировать профиль';
	@override String get notifications => 'Уведомления';
	@override String get subscription => 'Управление подпиской';
	@override String get language => 'Язык';
	@override String get theme => 'Тема оформления';
	@override String get theme_light => 'Светлая';
	@override String get theme_system => 'Система';
	@override String get theme_dark => 'Тёмная';
	@override String get about => 'О приложении';
	@override String get sign_in => 'Войти';
	@override String get sign_out => 'Выйти из профиля';
	@override late final _Translations$profile$settings$sign_out_dialog$ru sign_out_dialog = _Translations$profile$settings$sign_out_dialog$ru._(_root);
	@override late final _Translations$profile$settings$notifications_page$ru notifications_page = _Translations$profile$settings$notifications_page$ru._(_root);
	@override late final _Translations$profile$settings$about_page$ru about_page = _Translations$profile$settings$about_page$ru._(_root);
	@override late final _Translations$profile$settings$language_sync$ru language_sync = _Translations$profile$settings$language_sync$ru._(_root);
	@override late final _Translations$profile$settings$subscription_page$ru subscription_page = _Translations$profile$settings$subscription_page$ru._(_root);
}

// Path: profile.edit
class _Translations$profile$edit$ru implements Translations$profile$edit$en {
	_Translations$profile$edit$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Редактирование';
	@override String get done => 'Готово';
	@override String get name_label => 'Имя';
	@override String get email_label => 'Email';
	@override String get password_label => 'Пароль';
	@override String get change_password => 'Изменить пароль';
	@override String get delete_account => 'Удалить аккаунт';
	@override String get save_failed => 'Не удалось сохранить изменения';
	@override late final _Translations$profile$edit$delete_dialog$ru delete_dialog = _Translations$profile$edit$delete_dialog$ru._(_root);
	@override late final _Translations$profile$edit$password_page$ru password_page = _Translations$profile$edit$password_page$ru._(_root);
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

// Path: leaderboard.period_tabs
class _Translations$leaderboard$period_tabs$ru implements Translations$leaderboard$period_tabs$en {
	_Translations$leaderboard$period_tabs$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get daily => 'ДЕНЬ';
	@override String get weekly => 'НЕДЕЛЯ';
	@override String get monthly => 'МЕСЯЦ';
	@override String get yearly => 'ГОД';
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

// Path: question.meta
class _Translations$question$meta$ru implements Translations$question$meta$en {
	_Translations$question$meta$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String counter({required Object current, required Object total}) => 'ВОПРОС ${current} / ${total}';
	@override String topic({required Object topic}) => '// ${topic}';
}

// Path: question.state
class _Translations$question$state$ru implements Translations$question$state$en {
	_Translations$question$state$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get empty => 'На сегодня вопросы закончились.\nЗаходите завтра!';
	@override String get error => 'Не удалось загрузить вопрос';
}

// Path: question.answer_reveal
class _Translations$question$answer_reveal$ru implements Translations$question$answer_reveal$en {
	_Translations$question$answer_reveal$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get correct => 'ВЕРНО';
	@override String get incorrect => 'НЕВЕРНО';
	@override String xp_bonus({required Object xp}) => '+${xp} XP';
	@override String streak_bonus({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		one: '+${n} СЕРИЯ',
		few: '+${n} СЕРИИ',
		many: '+${n} СЕРИЙ',
		other: '+${n} СЕРИИ',
	);
	@override String get next_question => 'СЛЕДУЮЩИЙ ВОПРОС';
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

// Path: mastery.paywall
class _Translations$mastery$paywall$ru implements Translations$mastery$paywall$en {
	_Translations$mastery$paywall$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get tagline => 'Мастерство тем';
	@override String get description => 'Узнайте, где вы сильны, а где стоит подтянуть — и алгоритм сделает остальное.';
	@override String get cta => 'Попробовать Quiz+';
}

// Path: profile.settings.sign_out_dialog
class _Translations$profile$settings$sign_out_dialog$ru implements Translations$profile$settings$sign_out_dialog$en {
	_Translations$profile$settings$sign_out_dialog$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Выйти из профиля?';
	@override String get message => 'Прогресс сохранится — вы сможете войти снова с этим email.';
	@override String get confirm => 'Выйти';
	@override String get cancel => 'Отмена';
}

// Path: profile.settings.notifications_page
class _Translations$profile$settings$notifications_page$ru implements Translations$profile$settings$notifications_page$en {
	_Translations$profile$settings$notifications_page$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get daily_issue => 'Напоминание о выпуске дня';
	@override String get streak_risk => 'Серия под угрозой';
	@override String get rank_change => 'Изменение позиции в рейтинге';
	@override String get promo => 'Новости и акции Quiz+';
}

// Path: profile.settings.about_page
class _Translations$profile$settings$about_page$ru implements Translations$profile$settings$about_page$en {
	_Translations$profile$settings$about_page$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String version({required Object version, required Object build}) => 'Версия ${version} (${build})';
	@override String get terms => 'Пользовательское соглашение';
	@override String get privacy => 'Политика конфиденциальности';
	@override String get support => 'Написать в поддержку';
}

// Path: profile.settings.language_sync
class _Translations$profile$settings$language_sync$ru implements Translations$profile$settings$language_sync$en {
	_Translations$profile$settings$language_sync$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Обновляем вопросы';
	@override String get syncing => 'Загружаем вопросы, темы и ответы на выбранном языке';
	@override String get success => 'Вопросы обновлены';
	@override String get waiting_connection_title => 'Язык интерфейса изменён';
	@override String get waiting_connection => 'Вопросы обновятся на выбранном языке, когда появится интернет';
	@override String get failed_title => 'Не удалось обновить вопросы';
	@override String get failed => 'Старый кеш вопросов пока сохранён. Можно повторить попытку сейчас или дождаться следующей синхронизации';
	@override String get close => 'Закрыть';
	@override String get retry => 'Повторить';
}

// Path: profile.settings.subscription_page
class _Translations$profile$settings$subscription_page$ru implements Translations$profile$settings$subscription_page$en {
	_Translations$profile$settings$subscription_page$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Подписка';
	@override String get active => 'Активна';
	@override String get inactive => 'Неактивна';
	@override String get plan_monthly => 'Месячная';
	@override String get plan_yearly => 'Годовая';
	@override String next_billing({required Object date}) => 'Следующее списание · ${date}';
	@override String get change_plan => 'Изменить план';
	@override String get payment_method => 'Способ оплаты';
	@override String get payment_history => 'История платежей';
	@override String get cancel => 'Отменить подписку';
	@override late final _Translations$profile$settings$subscription_page$cancel_dialog$ru cancel_dialog = _Translations$profile$settings$subscription_page$cancel_dialog$ru._(_root);
}

// Path: profile.edit.delete_dialog
class _Translations$profile$edit$delete_dialog$ru implements Translations$profile$edit$delete_dialog$en {
	_Translations$profile$edit$delete_dialog$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Удалить аккаунт?';
	@override String get message => 'Серия, статистика и достижения будут удалены безвозвратно. Это действие нельзя отменить.';
	@override String get confirm => 'Удалить аккаунт';
	@override String get cancel => 'Отмена';
	@override String get failed => 'Не удалось удалить аккаунт. Попробуйте позже';
}

// Path: profile.edit.password_page
class _Translations$profile$edit$password_page$ru implements Translations$profile$edit$password_page$en {
	_Translations$profile$edit$password_page$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Пароль';
	@override String get old_label => 'Старый пароль';
	@override String get new_label => 'Новый пароль';
	@override String get confirm_label => 'Повторите пароль';
	@override String get save => 'Сохранить';
	@override String get success => 'Пароль успешно изменён';
	@override String get failed => 'Не удалось изменить пароль. Проверьте введённые данные и попробуйте снова';
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

// Path: profile.settings.subscription_page.cancel_dialog
class _Translations$profile$settings$subscription_page$cancel_dialog$ru implements Translations$profile$settings$subscription_page$cancel_dialog$en {
	_Translations$profile$settings$subscription_page$cancel_dialog$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Отменить подписку?';
	@override String get message => 'Quiz+ отключится сразу. Действие доступно только в debug-сборке — реального биллинга пока нет.';
	@override String get confirm => 'Отменить подписку';
	@override String get cancel => 'Назад';
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
			'profile.view.current_level_label' => 'ТЕКУЩИЙ УР.',
			'profile.view.next_level' => ({required Object n}) => '→ УР. ${n}',
			'profile.view.stats_section' => '// СТАТИСТИКА',
			'profile.view.stat_streak' => 'СЕРИЯ, ДН.',
			'profile.view.stat_answers' => 'ОТВЕТОВ',
			'profile.view.stat_accuracy' => 'ТОЧНОСТЬ',
			'profile.view.stat_points' => 'ОЧКОВ',
			'profile.view.stat_best_streak' => 'ЛУЧШАЯ СЕРИЯ',
			'profile.view.stat_days_in_game' => 'ДНЕЙ В ИГРЕ',
			'profile.view.member_since' => ({required Object date}) => 'В ИГРЕ С ${date}',
			'profile.view.achievements' => ({required Object unlocked, required Object total}) => 'ДОСТИЖЕНИЯ · ${unlocked}/${total}',
			'profile.view.load_failed' => 'Не удалось загрузить профиль',
			'profile.view.retry' => 'ПОВТОРИТЬ',
			'profile.view.mastery' => 'Мастерство',
			'profile.view.review' => 'На повторение',
			'profile.settings.title' => 'Настройки',
			'profile.settings.account_section' => 'Аккаунт',
			'profile.settings.app_section' => 'Приложение',
			'profile.settings.edit_profile' => 'Редактировать профиль',
			'profile.settings.notifications' => 'Уведомления',
			'profile.settings.subscription' => 'Управление подпиской',
			'profile.settings.language' => 'Язык',
			'profile.settings.theme' => 'Тема оформления',
			'profile.settings.theme_light' => 'Светлая',
			'profile.settings.theme_system' => 'Система',
			'profile.settings.theme_dark' => 'Тёмная',
			'profile.settings.about' => 'О приложении',
			'profile.settings.sign_in' => 'Войти',
			'profile.settings.sign_out' => 'Выйти из профиля',
			'profile.settings.sign_out_dialog.title' => 'Выйти из профиля?',
			'profile.settings.sign_out_dialog.message' => 'Прогресс сохранится — вы сможете войти снова с этим email.',
			'profile.settings.sign_out_dialog.confirm' => 'Выйти',
			'profile.settings.sign_out_dialog.cancel' => 'Отмена',
			'profile.settings.notifications_page.daily_issue' => 'Напоминание о выпуске дня',
			'profile.settings.notifications_page.streak_risk' => 'Серия под угрозой',
			'profile.settings.notifications_page.rank_change' => 'Изменение позиции в рейтинге',
			'profile.settings.notifications_page.promo' => 'Новости и акции Quiz+',
			'profile.settings.about_page.version' => ({required Object version, required Object build}) => 'Версия ${version} (${build})',
			'profile.settings.about_page.terms' => 'Пользовательское соглашение',
			'profile.settings.about_page.privacy' => 'Политика конфиденциальности',
			'profile.settings.about_page.support' => 'Написать в поддержку',
			'profile.settings.language_sync.title' => 'Обновляем вопросы',
			'profile.settings.language_sync.syncing' => 'Загружаем вопросы, темы и ответы на выбранном языке',
			'profile.settings.language_sync.success' => 'Вопросы обновлены',
			'profile.settings.language_sync.waiting_connection_title' => 'Язык интерфейса изменён',
			'profile.settings.language_sync.waiting_connection' => 'Вопросы обновятся на выбранном языке, когда появится интернет',
			'profile.settings.language_sync.failed_title' => 'Не удалось обновить вопросы',
			'profile.settings.language_sync.failed' => 'Старый кеш вопросов пока сохранён. Можно повторить попытку сейчас или дождаться следующей синхронизации',
			'profile.settings.language_sync.close' => 'Закрыть',
			'profile.settings.language_sync.retry' => 'Повторить',
			'profile.settings.subscription_page.title' => 'Подписка',
			'profile.settings.subscription_page.active' => 'Активна',
			'profile.settings.subscription_page.inactive' => 'Неактивна',
			'profile.settings.subscription_page.plan_monthly' => 'Месячная',
			'profile.settings.subscription_page.plan_yearly' => 'Годовая',
			'profile.settings.subscription_page.next_billing' => ({required Object date}) => 'Следующее списание · ${date}',
			'profile.settings.subscription_page.change_plan' => 'Изменить план',
			'profile.settings.subscription_page.payment_method' => 'Способ оплаты',
			'profile.settings.subscription_page.payment_history' => 'История платежей',
			'profile.settings.subscription_page.cancel' => 'Отменить подписку',
			'profile.settings.subscription_page.cancel_dialog.title' => 'Отменить подписку?',
			'profile.settings.subscription_page.cancel_dialog.message' => 'Quiz+ отключится сразу. Действие доступно только в debug-сборке — реального биллинга пока нет.',
			'profile.settings.subscription_page.cancel_dialog.confirm' => 'Отменить подписку',
			'profile.settings.subscription_page.cancel_dialog.cancel' => 'Назад',
			'profile.edit.title' => 'Редактирование',
			'profile.edit.done' => 'Готово',
			'profile.edit.name_label' => 'Имя',
			'profile.edit.email_label' => 'Email',
			'profile.edit.password_label' => 'Пароль',
			'profile.edit.change_password' => 'Изменить пароль',
			'profile.edit.delete_account' => 'Удалить аккаунт',
			'profile.edit.save_failed' => 'Не удалось сохранить изменения',
			'profile.edit.delete_dialog.title' => 'Удалить аккаунт?',
			'profile.edit.delete_dialog.message' => 'Серия, статистика и достижения будут удалены безвозвратно. Это действие нельзя отменить.',
			'profile.edit.delete_dialog.confirm' => 'Удалить аккаунт',
			'profile.edit.delete_dialog.cancel' => 'Отмена',
			'profile.edit.delete_dialog.failed' => 'Не удалось удалить аккаунт. Попробуйте позже',
			'profile.edit.password_page.title' => 'Пароль',
			'profile.edit.password_page.old_label' => 'Старый пароль',
			'profile.edit.password_page.new_label' => 'Новый пароль',
			'profile.edit.password_page.confirm_label' => 'Повторите пароль',
			'profile.edit.password_page.save' => 'Сохранить',
			'profile.edit.password_page.success' => 'Пароль успешно изменён',
			'profile.edit.password_page.failed' => 'Не удалось изменить пароль. Проверьте введённые данные и попробуйте снова',
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
			'leaderboard.rank_header' => 'МЕСТО',
			'leaderboard.participant_header' => 'УЧАСТНИК',
			'leaderboard.points_header' => 'ОЧКИ',
			'leaderboard.accuracy_label' => 'ТОЧНОСТЬ',
			'leaderboard.gap_row' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n, one: 'ЕЩЁ ${n} УЧАСТНИК', few: 'ЕЩЁ ${n} УЧАСТНИКА', many: 'ЕЩЁ ${n} УЧАСТНИКОВ', other: 'ЕЩЁ ${n} УЧАСТНИКА', ), 
			'leaderboard.total_participants' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n, one: 'ВСЕГО ${n} УЧАСТНИК', few: 'ВСЕГО ${n} УЧАСТНИКА', many: 'ВСЕГО ${n} УЧАСТНИКОВ', other: 'ВСЕГО ${n} УЧАСТНИКА', ), 
			'leaderboard.retry' => 'ПОВТОРИТЬ',
			'leaderboard.load_failed' => 'Не удалось загрузить рейтинг',
			'leaderboard.period_tabs.daily' => 'ДЕНЬ',
			'leaderboard.period_tabs.weekly' => 'НЕДЕЛЯ',
			'leaderboard.period_tabs.monthly' => 'МЕСЯЦ',
			'leaderboard.period_tabs.yearly' => 'ГОД',
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
			'achievements.xp_reward' => ({required Object points}) => '+${points} XP',
			'achievements.error' => 'Не удалось загрузить',
			'achievements.retry' => 'Повторить',
			'question.answer_letters.0' => 'А',
			'question.answer_letters.1' => 'Б',
			'question.answer_letters.2' => 'В',
			'question.answer_letters.3' => 'Г',
			'question.meta.counter' => ({required Object current, required Object total}) => 'ВОПРОС ${current} / ${total}',
			'question.meta.topic' => ({required Object topic}) => '// ${topic}',
			'question.state.empty' => 'На сегодня вопросы закончились.\nЗаходите завтра!',
			'question.state.error' => 'Не удалось загрузить вопрос',
			'question.answer_reveal.correct' => 'ВЕРНО',
			'question.answer_reveal.incorrect' => 'НЕВЕРНО',
			'question.answer_reveal.xp_bonus' => ({required Object xp}) => '+${xp} XP',
			'question.answer_reveal.streak_bonus' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n, one: '+${n} СЕРИЯ', few: '+${n} СЕРИИ', many: '+${n} СЕРИЙ', other: '+${n} СЕРИИ', ), 
			'question.answer_reveal.next_question' => 'СЛЕДУЮЩИЙ ВОПРОС',
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
			'sign_up.birth_date_label' => 'ДАТА РОЖДЕНИЯ',
			'forgot_password.title' => 'Забыли\nпароль?',
			'forgot_password.subtitle' => 'Введите email — пришлём ссылку для сброса пароля.',
			'forgot_password.email_label' => 'EMAIL',
			'forgot_password.submit' => 'ОТПРАВИТЬ ССЫЛКУ',
			'forgot_password.submitting' => 'ОТПРАВКА...',
			'forgot_password.hint' => 'Ссылка действует 15 минут. Проверьте папку «Спам», если письмо не пришло.',
			'forgot_password.success' => 'Ссылка отправлена. Проверьте почту.',
			'forgot_password.error' => 'Не удалось отправить ссылку. Попробуйте позже.',
			'start_day.start_button' => 'НАЧАТЬ ВЫПУСК',
			'start_day.ready_title' => 'ВЫПУСК ДНЯ ГОТОВ',
			'start_day.last_session_stats_title' => 'ПОСЛЕДНИЙ ВЫПУСК',
			'start_day.rank_label' => 'В РЕЙТИНГЕ',
			'start_day.points_label' => 'ОЧКОВ',
			'start_day.accuracy_label' => 'ТОЧНОСТЬ',
			'start_day.question_count_label' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n, one: 'вопрос', few: 'вопроса', many: 'вопросов', other: 'вопросов', ), 
			'start_day.estimated_time' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n, one: '~ ${n} МИНУТА', few: '~ ${n} МИНУТЫ', many: '~ ${n} МИНУТ', other: '~ ${n} МИНУТ', ), 
			'start_day.streak_warning' => ({required InlineSpanBuilder accent}) => TextSpan(children: [ const TextSpan(text: 'Сыграйте сегодня, чтобы '), accent('не потерять серию'), ]), 
			'start_day.freeze_applied_notice' => ({required InlineSpanBuilder accent, required InlineSpan left, required InlineSpan total}) => TextSpan(children: [ const TextSpan(text: 'Вы пропустили вчерашний день — '), accent('заморозка применена автоматически.'), const TextSpan(text: ' Осталось '), left, const TextSpan(text: ' / '), total, ]), 
			'start_day.freeze_applied_advice' => ({required InlineSpanBuilder accent}) => TextSpan(children: [ const TextSpan(text: 'Сыграйте сегодня, чтобы '), accent('не расходовать заморозки без нужды'), ]), 
			'start_day.streak_lost_notice' => ({required InlineSpan days, required InlineSpanBuilder accent}) => TextSpan(children: [ const TextSpan(text: 'Серия из '), days, const TextSpan(text: ' '), accent('потеряна'), const TextSpan(text: ' — заморозок не осталось'), ]), 
			'start_day.streak_lost_notice_free' => ({required InlineSpan days, required InlineSpanBuilder accent}) => TextSpan(children: [ const TextSpan(text: 'Серия из '), days, const TextSpan(text: ' '), accent('потеряна'), ]), 
			'start_day.streak_lost_days' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n, one: '${n} дня', few: '${n} дней', many: '${n} дней', other: '${n} дней', ), 
			'start_day.streak_lost_advice' => ({required InlineSpanBuilder accent}) => TextSpan(children: [ const TextSpan(text: 'Начните новую серию сегодня — '), accent('до первого достижения всего 3 дня'), ]), 
			'start_day.start_new_streak_button' => 'НАЧАТЬ НОВУЮ СЕРИЮ',
			'nav.game' => 'ИГРА',
			'nav.leaderboard' => 'РЕЙТИНГ',
			'nav.profile' => 'ПРОФИЛЬ',
			'birth_date_picker.apply' => 'Готово',
			'mastery.title' => 'Мастерство',
			'mastery.topics_section' => 'Владение по темам',
			'mastery.weakest_label' => 'Самая слабая тема',
			'mastery.weakest_accuracy' => ({required Object percent}) => '${percent}% точности',
			'mastery.weakest_tail' => ' за 30 дней. Алгоритм чаще будет давать эти вопросы в выпусках.',
			'mastery.weekly_delta_label' => 'За неделю',
			'mastery.best_day_label' => 'Лучший день',
			'mastery.empty' => 'Пока нет данных — сыграйте выпуск дня, и мастерство появится здесь',
			'mastery.error' => 'Не удалось загрузить',
			'mastery.retry' => 'Повторить',
			'mastery.paywall.tagline' => 'Мастерство тем',
			'mastery.paywall.description' => 'Узнайте, где вы сильны, а где стоит подтянуть — и алгоритм сделает остальное.',
			'mastery.paywall.cta' => 'Попробовать Quiz+',
			'review.title' => 'На повторение',
			'review.info_banner' => 'Вручную вызвать нельзя — интервальное повторение хранит честность рейтинга',
			'review.due_days' => ({required Object n}) => '${n}д',
			'review.due_label' => 'Через',
			'review.wrong_times' => ({required Object n}) => 'Ошибка ${n}×',
			'review.mastered_times' => ({required Object n}) => 'Освоено ${n}×',
			'review.queued_label' => 'В очереди на повтор',
			'review.mastered_label' => 'Уже освоено',
			'review.footer' => 'Повтор приходит в следующих выпусках',
			'review.empty' => 'Очередь пуста — в последних выпусках не было ошибок',
			'review.error' => 'Не удалось загрузить',
			'review.retry' => 'Повторить',
			_ => null,
		};
	}
}
