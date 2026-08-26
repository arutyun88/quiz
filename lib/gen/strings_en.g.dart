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
	late final Translations$start_day$en start_day = Translations$start_day$en._(_root);
	late final Translations$daily_result$en daily_result = Translations$daily_result$en._(_root);
	late final Translations$daily_limit$en daily_limit = Translations$daily_limit$en._(_root);
	late final Translations$demo$en demo = Translations$demo$en._(_root);
	late final Translations$nav$en nav = Translations$nav$en._(_root);
	late final Translations$birth_date_picker$en birth_date_picker = Translations$birth_date_picker$en._(_root);
	late final Translations$mastery$en mastery = Translations$mastery$en._(_root);
	late final Translations$review$en review = Translations$review$en._(_root);
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

	late final Translations$profile$view$en view = Translations$profile$view$en._(_root);
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

	/// ru: 'МЕСТО'
	String get rank_header => 'RANK';

	/// ru: 'УЧАСТНИК'
	String get participant_header => 'PLAYER';

	/// ru: 'ОЧКИ'
	String get points_header => 'POINTS';

	/// ru: 'ТОЧНОСТЬ'
	String get accuracy_label => 'ACCURACY';

	/// ru: '(one) {ЕЩЁ $n УЧАСТНИК} (few) {ЕЩЁ $n УЧАСТНИКА} (many) {ЕЩЁ $n УЧАСТНИКОВ} (other) {ЕЩЁ $n УЧАСТНИКА}'
	String gap_row({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '${n} MORE PLAYER',
		other: '${n} MORE PLAYERS',
	);

	/// ru: '(one) {ВСЕГО $n УЧАСТНИК} (few) {ВСЕГО $n УЧАСТНИКА} (many) {ВСЕГО $n УЧАСТНИКОВ} (other) {ВСЕГО $n УЧАСТНИКА}'
	String total_participants({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '${n} PLAYER TOTAL',
		other: '${n} PLAYERS TOTAL',
	);

	/// ru: 'ПОВТОРИТЬ'
	String get retry => 'RETRY';

	/// ru: 'Не удалось загрузить рейтинг'
	String get load_failed => 'Could not load leaderboard';

	late final Translations$leaderboard$period_tabs$en period_tabs = Translations$leaderboard$period_tabs$en._(_root);
	late final Translations$leaderboard$periods$en periods = Translations$leaderboard$periods$en._(_root);
	late final Translations$leaderboard$history$en history = Translations$leaderboard$history$en._(_root);
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

	/// ru: 'СЕРИЯ'
	String get streak_badge_label => 'STREAK';

	/// ru: 'УР.'
	String get level_badge_label => 'LVL';

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

	/// ru: '+$points XP'
	String xp_reward({required Object points}) => '+${points} XP';

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
	List<String> get answer_letters => [
		'A',
		'B',
		'C',
		'D',
	];
	late final Translations$question$meta$en meta = Translations$question$meta$en._(_root);
	late final Translations$question$state$en state = Translations$question$state$en._(_root);
	late final Translations$question$answer_reveal$en answer_reveal = Translations$question$answer_reveal$en._(_root);
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

	/// ru: 'ДАТА РОЖДЕНИЯ'
	String get birth_date_label => 'BIRTH DATE';

	/// ru: 'ОПРЕДЕЛЕНИЕ ВОЗРАСТА'
	String get age_check_label => 'AGE CHECK';

	/// ru: 'Дата используется однократно для определения возраста. Исходная дата не хранится в профиле.'
	String get age_check_note => 'Used once to determine age eligibility. The original date is not stored in your profile.';
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

// Path: start_day
class Translations$start_day$en {
	Translations$start_day$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'НАЧАТЬ ВЫПУСК'
	String get start_button => 'START EDITION';

	/// ru: 'ЕЩЁ ВОПРОСЫ'
	String get more_questions_button => 'MORE QUESTIONS';

	/// ru: 'ВЫПУСК ДНЯ ГОТОВ'
	String get ready_title => 'DAILY EDITION READY';

	/// ru: 'ВЫПУСК ДНЯ ПРОЙДЕН'
	String get issue_completed_title => 'TODAY\'S ISSUE DONE';

	/// ru: 'ПОСЛЕДНИЙ ВЫПУСК'
	String get last_session_stats_title => 'LAST EDITION';

	/// ru: 'В РЕЙТИНГЕ'
	String get rank_label => 'RANK';

	/// ru: 'ОЧКОВ'
	String get points_label => 'POINTS';

	/// ru: 'ТОЧНОСТЬ'
	String get accuracy_label => 'ACCURACY';

	/// ru: '(one) {вопрос} (few) {вопроса} (many) {вопросов} (other) {вопросов}'
	String question_count_label({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'question',
		other: 'questions',
	);

	/// ru: '(one) {~ $n МИНУТА} (few) {~ $n МИНУТЫ} (many) {~ $n МИНУТ} (other) {~ $n МИНУТ}'
	String estimated_time({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '~ ${n} MINUTE',
		other: '~ ${n} MINUTES',
	);

	/// ru: 'Сыграйте сегодня, чтобы ${accent(не потерять серию)}'
	TextSpan streak_warning({required InlineSpanBuilder accent}) => TextSpan(children: [
		const TextSpan(text: 'Play today to '),
		accent('keep your streak'),
	]);

	/// ru: 'Вы пропустили вчерашний день — ${accent(заморозка применена автоматически.)} Осталось $left / $total'
	TextSpan freeze_applied_notice({required InlineSpanBuilder accent, required InlineSpan left, required InlineSpan total}) => TextSpan(children: [
		const TextSpan(text: 'You missed yesterday — '),
		accent('a streak freeze was applied automatically.'),
		const TextSpan(text: ' '),
		left,
		const TextSpan(text: ' / '),
		total,
		const TextSpan(text: ' left'),
	]);

	/// ru: 'Сыграйте сегодня, чтобы ${accent(не расходовать заморозки без нужды)}'
	TextSpan freeze_applied_advice({required InlineSpanBuilder accent}) => TextSpan(children: [
		const TextSpan(text: 'Play today to '),
		accent('avoid spending freezes when you don\'t need to'),
	]);

	/// ru: 'Серия из $days ${accent(потеряна)} — заморозок не осталось'
	TextSpan streak_lost_notice({required InlineSpan days, required InlineSpanBuilder accent}) => TextSpan(children: [
		const TextSpan(text: 'Your streak of '),
		days,
		const TextSpan(text: ' '),
		accent('is lost'),
		const TextSpan(text: ' — no freezes left'),
	]);

	/// ru: 'Серия из $days ${accent(потеряна)}'
	TextSpan streak_lost_notice_free({required InlineSpan days, required InlineSpanBuilder accent}) => TextSpan(children: [
		const TextSpan(text: 'Your streak of '),
		days,
		const TextSpan(text: ' '),
		accent('is lost'),
	]);

	/// ru: '(one) {$n дня} (few) {$n дней} (many) {$n дней} (other) {$n дней}'
	String streak_lost_days({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '${n} day',
		other: '${n} days',
	);

	/// ru: 'Начните новую серию сегодня — ${accent(до первого достижения всего 3 дня)}'
	TextSpan streak_lost_advice({required InlineSpanBuilder accent}) => TextSpan(children: [
		const TextSpan(text: 'Start a new streak today — '),
		accent('your first achievement is just 3 days away'),
	]);

	/// ru: 'НАЧАТЬ НОВУЮ СЕРИЮ'
	String get start_new_streak_button => 'START A NEW STREAK';

	/// ru: 'ПРОЙДЕНО СЕГОДНЯ'
	String get issue_done_caption => 'DONE TODAY';

	/// ru: 'СЕГОДНЯ'
	String get today_stats_title => 'TODAY';

	/// ru: 'Выпуск пройден, ${accent(серия сохранена)} — возвращайтесь завтра за новым'
	TextSpan issue_done_streak({required InlineSpanBuilder accent}) => TextSpan(children: [
		const TextSpan(text: 'Issue done, '),
		accent('streak saved'),
		const TextSpan(text: ' — come back tomorrow for a new one'),
	]);

	/// ru: 'Выпуск дня пройден — возвращайтесь завтра за новым'
	String get issue_done_no_streak => 'Today\'s issue is done — come back tomorrow for a new one';
}

// Path: daily_result
class Translations$daily_result$en {
	Translations$daily_result$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'ЕЖЕДНЕВНАЯ ЦЕЛЬ ВЫПОЛНЕНА'
	String get goal_completed => 'DAILY GOAL COMPLETED';

	/// ru: 'ИЗ $total'
	String ring_label({required Object total}) => 'OF ${total}';

	/// ru: 'ВЕРНО'
	String get correct_label => 'CORRECT';

	/// ru: 'ОЧКОВ'
	String get points_label => 'POINTS';

	/// ru: 'СЕРИЯ, ДН.'
	String get streak_label => 'STREAK, D.';

	/// ru: 'Поднялись на $positions в недельном рейтинге'
	TextSpan rank_up({required InlineSpan positions}) => TextSpan(children: [
		const TextSpan(text: 'You climbed '),
		positions,
		const TextSpan(text: ' in the weekly leaderboard'),
	]);

	/// ru: '(one) {$n позицию} (few) {$n позиции} (many) {$n позиций} (other) {$n позиции}'
	String rank_up_positions({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '${n} position',
		other: '${n} positions',
	);

	/// ru: '${accent(Первое место)} в недельном рейтинге — так держать'
	TextSpan rank_leader({required InlineSpanBuilder accent}) => TextSpan(children: [
		accent('First place'),
		const TextSpan(text: ' in the weekly leaderboard — keep it up'),
	]);

	/// ru: 'Сейчас $rank в недельном рейтинге — каждый выпуск двигает вверх'
	TextSpan rank_current({required InlineSpan rank}) => TextSpan(children: [
		const TextSpan(text: 'Currently '),
		rank,
		const TextSpan(text: ' in the weekly leaderboard — every issue moves you up'),
	]);

	/// ru: 'Каждый выпуск двигает вас в ${accent(недельном рейтинге)}'
	TextSpan rank_unknown({required InlineSpanBuilder accent}) => TextSpan(children: [
		const TextSpan(text: 'Every issue moves you up the '),
		accent('weekly leaderboard'),
	]);

	/// ru: 'ИГРАТЬ ДАЛЬШЕ'
	String get continue_button => 'KEEP PLAYING';

	/// ru: 'ВЫПУСК ДНЯ ЗАКРЫТ · НОВЫЙ ЗАВТРА'
	String get footer => 'TODAY\'S ISSUE IS CLOSED · A NEW ONE TOMORROW';
}

// Path: daily_limit
class Translations$daily_limit$en {
	Translations$daily_limit$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'ЕЩЁ ВОПРОСЫ'
	String get title => 'MORE QUESTIONS';

	/// ru: 'ДОП. ВОПРОСЫ НА СЕГОДНЯ'
	String get extras_section => 'EXTRA QUESTIONS TODAY';

	/// ru: '$grants РОЛИКОВ · +$questions ВОПРОСА КАЖДЫЙ'
	String slots_hint({required Object grants, required Object questions}) => '${grants} ADS · +${questions} QUESTIONS EACH';

	/// ru: 'Выпуск дня завершён'
	String get completed_title => 'Today\'s issue is done';

	/// ru: 'Новый выпуск через'
	String get next_issue_in => 'New issue in';

	/// ru: 'Следующий ролик через'
	String get next_ad_in => 'Next video available in';

	/// ru: 'Посмотреть ролик'
	String get watch_ad => 'Watch a video';

	/// ru: '(one) {+$n ВОПРОС · БЕСПЛАТНО} (few) {+$n ВОПРОСА · БЕСПЛАТНО} (many) {+$n ВОПРОСОВ · БЕСПЛАТНО} (other) {+$n ВОПРОСА · БЕСПЛАТНО}'
	String watch_ad_caption({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '+${n} QUESTION · FREE',
		other: '+${n} QUESTIONS · FREE',
	);

	/// ru: 'СЕРВИС РОЛИКОВ ПОКА НЕ ПОДКЛЮЧЁН'
	String get ad_unavailable => 'VIDEO SERVICE IS NOT CONNECTED YET';

	/// ru: 'На сегодня доп. вопросы закончились'
	String get ad_exhausted => 'No more extra questions today';

	/// ru: 'ИГРАТЬ ДАЛЬШЕ'
	String get keep_playing => 'KEEP PLAYING';

	/// ru: 'БЕЗЛИМИТ С QUIZ+'
	String get unlimited_cta => 'UNLIMITED WITH QUIZ+';

	late final Translations$daily_limit$ad$en ad = Translations$daily_limit$ad$en._(_root);
}

// Path: demo
class Translations$demo$en {
	Translations$demo$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$demo$start$en start = Translations$demo$start$en._(_root);
	late final Translations$demo$quiz$en quiz = Translations$demo$quiz$en._(_root);
	late final Translations$demo$complete$en complete = Translations$demo$complete$en._(_root);
	late final Translations$demo$rating$en rating = Translations$demo$rating$en._(_root);
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

// Path: birth_date_picker
class Translations$birth_date_picker$en {
	Translations$birth_date_picker$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Готово'
	String get apply => 'Done';
}

// Path: mastery
class Translations$mastery$en {
	Translations$mastery$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Мастерство'
	String get title => 'Mastery';

	/// ru: 'Владение по темам'
	String get topics_section => 'Topic mastery';

	/// ru: 'Самая слабая тема'
	String get weakest_label => 'Weakest topic';

	/// ru: '$percent% точности'
	String weakest_accuracy({required Object percent}) => '${percent}% accuracy';

	/// ru: ' за 30 дней. Алгоритм чаще будет давать эти вопросы в выпусках.'
	String get weakest_tail => ' over the last 30 days. The algorithm will serve these questions more often.';

	/// ru: 'За неделю'
	String get weekly_delta_label => 'This week';

	/// ru: 'Лучший день'
	String get best_day_label => 'Best day';

	/// ru: 'Пока нет данных — сыграйте выпуск дня, и мастерство появится здесь'
	String get empty => 'No data yet — play a daily issue and your mastery will show up here';

	/// ru: 'Не удалось загрузить'
	String get error => 'Failed to load';

	/// ru: 'Повторить'
	String get retry => 'Retry';

	late final Translations$mastery$paywall$en paywall = Translations$mastery$paywall$en._(_root);
}

// Path: review
class Translations$review$en {
	Translations$review$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'На повторение'
	String get title => 'Review queue';

	/// ru: 'Вручную вызвать нельзя — интервальное повторение хранит честность рейтинга'
	String get info_banner => 'No manual trigger — spaced repetition keeps the leaderboard fair';

	/// ru: '${n}д'
	String due_days({required Object n}) => '${n}d';

	/// ru: 'Через'
	String get due_label => 'In';

	/// ru: 'Ошибка $n×'
	String wrong_times({required Object n}) => 'Missed ${n}×';

	/// ru: 'Освоено $n×'
	String mastered_times({required Object n}) => 'Mastered ${n}×';

	/// ru: 'В очереди на повтор'
	String get queued_label => 'Queued for review';

	/// ru: 'Уже освоено'
	String get mastered_label => 'Already mastered';

	/// ru: 'Повтор приходит в следующих выпусках'
	String get footer => 'Repeats come back in the next issues';

	/// ru: 'Очередь пуста — в последних выпусках не было ошибок'
	String get empty => 'The queue is empty — no misses in the recent issues';

	/// ru: 'Не удалось загрузить'
	String get error => 'Failed to load';

	/// ru: 'Повторить'
	String get retry => 'Retry';
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

// Path: profile.view
class Translations$profile$view$en {
	Translations$profile$view$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'ТЕКУЩИЙ УР.'
	String get current_level_label => 'CURRENT LVL';

	/// ru: '→ УР. $n'
	String next_level({required Object n}) => '→ LVL ${n}';

	/// ru: '// СТАТИСТИКА'
	String get stats_section => '// STATISTICS';

	/// ru: 'СЕРИЯ, ДН.'
	String get stat_streak => 'STREAK, D.';

	/// ru: 'ОТВЕТОВ'
	String get stat_answers => 'ANSWERS';

	/// ru: 'ТОЧНОСТЬ'
	String get stat_accuracy => 'ACCURACY';

	/// ru: 'ОЧКОВ'
	String get stat_points => 'POINTS';

	/// ru: 'ЛУЧШАЯ СЕРИЯ'
	String get stat_best_streak => 'BEST STREAK';

	/// ru: 'ДНЕЙ В ИГРЕ'
	String get stat_days_in_game => 'DAYS PLAYING';

	/// ru: 'В ИГРЕ С $date'
	String member_since({required Object date}) => 'PLAYING SINCE ${date}';

	/// ru: 'ДОСТИЖЕНИЯ · $unlocked/$total'
	String achievements({required Object unlocked, required Object total}) => 'ACHIEVEMENTS · ${unlocked}/${total}';

	/// ru: 'Не удалось загрузить профиль'
	String get load_failed => 'Could not load profile';

	/// ru: 'ПОВТОРИТЬ'
	String get retry => 'RETRY';

	/// ru: 'Мастерство'
	String get mastery => 'Mastery';

	/// ru: 'На повторение'
	String get review => 'Review queue';
}

// Path: profile.settings
class Translations$profile$settings$en {
	Translations$profile$settings$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Настройки'
	String get title => 'Settings';

	/// ru: 'Аккаунт'
	String get account_section => 'Account';

	/// ru: 'Приложение'
	String get app_section => 'Application';

	/// ru: 'Редактировать профиль'
	String get edit_profile => 'Edit profile';

	/// ru: 'Уведомления'
	String get notifications => 'Notifications';

	/// ru: 'Управление подпиской'
	String get subscription => 'Manage subscription';

	/// ru: 'Язык'
	String get language => 'Language';

	/// ru: 'Тема оформления'
	String get theme => 'Theme';

	/// ru: 'Светлая'
	String get theme_light => 'Light';

	/// ru: 'Система'
	String get theme_system => 'System';

	/// ru: 'Тёмная'
	String get theme_dark => 'Dark';

	/// ru: 'О приложении'
	String get about => 'About';

	/// ru: 'Войти'
	String get sign_in => 'Sign in';

	/// ru: 'Выйти из профиля'
	String get sign_out => 'Sign out';

	late final Translations$profile$settings$sign_out_dialog$en sign_out_dialog = Translations$profile$settings$sign_out_dialog$en._(_root);
	late final Translations$profile$settings$adult_content$en adult_content = Translations$profile$settings$adult_content$en._(_root);
	late final Translations$profile$settings$notifications_page$en notifications_page = Translations$profile$settings$notifications_page$en._(_root);
	late final Translations$profile$settings$about_page$en about_page = Translations$profile$settings$about_page$en._(_root);
	late final Translations$profile$settings$language_sync$en language_sync = Translations$profile$settings$language_sync$en._(_root);
	late final Translations$profile$settings$subscription_page$en subscription_page = Translations$profile$settings$subscription_page$en._(_root);
}

// Path: profile.edit
class Translations$profile$edit$en {
	Translations$profile$edit$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Редактирование'
	String get title => 'Editing';

	/// ru: 'Готово'
	String get done => 'Done';

	/// ru: 'Имя'
	String get name_label => 'Name';

	/// ru: 'Email'
	String get email_label => 'Email';

	/// ru: 'Пароль'
	String get password_label => 'Password';

	/// ru: 'Изменить пароль'
	String get change_password => 'Change password';

	/// ru: 'Удалить аккаунт'
	String get delete_account => 'Delete account';

	/// ru: 'Не удалось сохранить изменения'
	String get save_failed => 'Failed to save changes';

	late final Translations$profile$edit$delete_dialog$en delete_dialog = Translations$profile$edit$delete_dialog$en._(_root);
	late final Translations$profile$edit$password_page$en password_page = Translations$profile$edit$password_page$en._(_root);
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

// Path: leaderboard.period_tabs
class Translations$leaderboard$period_tabs$en {
	Translations$leaderboard$period_tabs$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'ДЕНЬ'
	String get daily => 'DAY';

	/// ru: 'НЕДЕЛЯ'
	String get weekly => 'WEEK';

	/// ru: 'МЕСЯЦ'
	String get monthly => 'MONTH';

	/// ru: 'ГОД'
	String get yearly => 'YEAR';
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

// Path: leaderboard.history
class Translations$leaderboard$history$en {
	Translations$leaderboard$history$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Динамика места'
	String get title => 'Rank trend';

	/// ru: 'Текущее место'
	String get current_rank_label => 'Current rank';

	/// ru: '(one) {за $n день} (few) {за $n дня} (many) {за $n дней} (other) {за $n дней}'
	String delta_label({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'over ${n} day',
		other: 'over ${n} days',
	);

	/// ru: 'Сегодня'
	String get chart_end => 'Today';

	/// ru: 'по дням'
	String get by_days_title => 'by day';

	/// ru: 'Сегодня'
	String get today => 'Today';

	/// ru: 'Вчера'
	String get yesterday => 'Yesterday';

	/// ru: '$n очк'
	String points({required Object n}) => '${n} pts';

	/// ru: 'Не играли'
	String get not_played => 'Not played';

	/// ru: 'Пока нет истории — сыграйте выпуск, чтобы попасть в дневной рейтинг'
	String get empty => 'No history yet — play an edition to enter the daily rating';

	/// ru: 'Не удалось загрузить историю'
	String get error => 'Failed to load history';

	/// ru: 'Повторить'
	String get retry => 'Retry';
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

// Path: question.meta
class Translations$question$meta$en {
	Translations$question$meta$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'ВОПРОС $current / $total'
	String counter({required Object current, required Object total}) => 'QUESTION ${current} / ${total}';

	/// ru: 'ДОП. ВОПРОС $n'
	String extra_counter({required Object n}) => 'EXTRA QUESTION ${n}';

	/// ru: '// $topic'
	String topic({required Object topic}) => '// ${topic}';
}

// Path: question.state
class Translations$question$state$en {
	Translations$question$state$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'На сегодня вопросы закончились. Заходите завтра!'
	String get empty => 'You\'re done with today\'s questions.\nCome back tomorrow!';

	/// ru: 'Не удалось загрузить вопрос'
	String get error => 'Could not load the question';
}

// Path: question.answer_reveal
class Translations$question$answer_reveal$en {
	Translations$question$answer_reveal$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'ВЕРНО'
	String get correct => 'CORRECT';

	/// ru: 'НЕВЕРНО'
	String get incorrect => 'INCORRECT';

	/// ru: '+$xp XP'
	String xp_bonus({required Object xp}) => '+${xp} XP';

	/// ru: '(one) {+$n СЕРИЯ} (few) {+$n СЕРИИ} (many) {+$n СЕРИЙ} (other) {+$n СЕРИИ}'
	String streak_bonus({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '+${n} STREAK',
		other: '+${n} STREAK',
	);

	/// ru: 'СЛЕДУЮЩИЙ ВОПРОС'
	String get next_question => 'NEXT QUESTION';
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

// Path: daily_limit.ad
class Translations$daily_limit$ad$en {
	Translations$daily_limit$ad$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'РЕКЛАМА'
	String get label => 'AD';

	/// ru: 'Пропустить'
	String get skip => 'Skip';

	/// ru: 'Рекламный ролик · $time'
	String playing({required Object time}) => 'Ad video · ${time}';

	/// ru: 'НАГРАДА ПОСЛЕ ПРОСМОТРА'
	String get reward_title => 'REWARD AFTER WATCHING';

	/// ru: '+$n'
	String reward_amount({required Object n}) => '+${n}';

	/// ru: '(one) {вопрос сегодня} (few) {вопроса сегодня} (many) {вопросов сегодня} (other) {вопроса сегодня}'
	String reward_suffix({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'question today',
		other: 'questions today',
	);

	/// ru: 'РЕКЛАМА НЕ В ОСНОВНОМ ВЫПУСКЕ'
	String get footer => 'ADS ARE NOT PART OF THE MAIN ISSUE';
}

// Path: demo.start
class Translations$demo$start$en {
	Translations$demo$start$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'ГОСТЕВОЕ ДЕМО'
	String get badge => 'GUEST DEMO';

	/// ru: 'Попробуйте Quiz без регистрации'
	String get title => 'Try Quiz before signing up';

	/// ru: '(one) {Ответьте на один короткий вопрос, воспользуйтесь подсказкой и посмотрите разбор ответа.} (few) {Ответьте на $n коротких вопроса, воспользуйтесь подсказкой и посмотрите разбор ответа.} (many) {Ответьте на $n коротких вопросов, воспользуйтесь подсказкой и посмотрите разбор ответа.} (other) {Ответьте на $n короткого вопроса, воспользуйтесь подсказкой и посмотрите разбор ответа.}'
	String body({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'Answer one short question, use a hint, and see how answer explanations work.',
		other: 'Answer ${n} short questions, use a hint, and see how answer explanations work.',
	);

	/// ru: 'Ответы демо не сохраняются и никогда не влияют на рейтинг, XP или серию.'
	String get notice => 'Demo answers are not saved and never affect rating, XP, or streak.';

	/// ru: 'НАЧАТЬ ДЕМО'
	String get start_button => 'START DEMO';

	/// ru: 'У МЕНЯ УЖЕ ЕСТЬ АККАУНТ'
	String get sign_in_button => 'I ALREADY HAVE AN ACCOUNT';
}

// Path: demo.quiz
class Translations$demo$quiz$en {
	Translations$demo$quiz$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'QUIZ · ДЕМО'
	String get header => 'QUIZ · DEMO';

	/// ru: 'ВЫЙТИ'
	String get exit => 'EXIT';

	/// ru: 'ПОКАЗАТЬ ПОДСКАЗКУ'
	String get show_hint => 'SHOW HINT';

	/// ru: 'ПОВТОРИТЬ'
	String get retry => 'TRY AGAIN';
}

// Path: demo.complete
class Translations$demo$complete$en {
	Translations$demo$complete$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Демо завершено'
	String get title => 'Demo complete';

	/// ru: 'Создайте аккаунт, чтобы участвовать в официальном выпуске дня, поддерживать серию и получать рейтинг знаний.'
	String get body => 'Create an account to join the official daily edition, build a streak, and receive a knowledge rating.';

	/// ru: 'СОЗДАТЬ АККАУНТ'
	String get create_account => 'CREATE ACCOUNT';

	/// ru: 'ВОЙТИ'
	String get sign_in => 'SIGN IN';

	/// ru: 'ВЕРНУТЬСЯ К ДЕМО'
	String get back => 'BACK TO DEMO';
}

// Path: demo.rating
class Translations$demo$rating$en {
	Translations$demo$rating$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Для рейтинга нужен аккаунт'
	String get title => 'Rating requires an account';

	/// ru: 'Ответы гостевого демо не сохраняются и не участвуют в официальном рейтинге.'
	String get body => 'Guest demo answers are not saved and do not participate in the official leaderboard.';

	/// ru: 'ВОЙТИ'
	String get sign_in => 'SIGN IN';

	/// ru: 'СОЗДАТЬ АККАУНТ'
	String get create_account => 'CREATE ACCOUNT';
}

// Path: mastery.paywall
class Translations$mastery$paywall$en {
	Translations$mastery$paywall$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Мастерство тем'
	String get tagline => 'Topic mastery';

	/// ru: 'Узнайте, где вы сильны, а где стоит подтянуть — и алгоритм сделает остальное.'
	String get description => 'See where you\'re strong and what needs work — the algorithm does the rest.';

	/// ru: 'Попробовать Quiz+'
	String get cta => 'Try Quiz+';
}

// Path: profile.settings.sign_out_dialog
class Translations$profile$settings$sign_out_dialog$en {
	Translations$profile$settings$sign_out_dialog$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Выйти из профиля?'
	String get title => 'Sign out?';

	/// ru: 'Прогресс сохранится — вы сможете войти снова с этим email.'
	String get message => 'Your progress is saved — you can sign in again with this email.';

	/// ru: 'Выйти'
	String get confirm => 'Sign out';

	/// ru: 'Отмена'
	String get cancel => 'Cancel';
}

// Path: profile.settings.adult_content
class Translations$profile$settings$adult_content$en {
	Translations$profile$settings$adult_content$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Контент 18+'
	String get label => 'Adult content';

	/// ru: 'Контент 18+'
	String get title => 'Adult content';

	/// ru: 'Контент 18+ включён'
	String get enabled_title => 'Adult content is enabled';

	/// ru: 'Выбор синхронизируется через аккаунт. Ограничение магазина или политики может отключить доступ в любой момент.'
	String get enabled_body => 'This preference is synchronized through your account. Store or policy restrictions can disable access at any time.';

	/// ru: 'Необязательный контент 18+'
	String get eligible_title => 'Optional adult content';

	/// ru: 'Совершеннолетие не включает такой контент автоматически. Подтвердите только если хотите видеть допустимые вопросы 18+.'
	String get eligible_body => 'Eligibility does not enable adult content automatically. Confirm only if you want eligible 18+ questions to appear.';

	/// ru: 'Контент 18+ недоступен'
	String get unavailable_title => 'Adult content is unavailable';

	/// ru: 'Текущий серверный возрастной статус не допускает контент 18+.'
	String get unavailable_body => 'Your current server age status is not eligible for adult content.';

	/// ru: 'Контент 18+ ограничен'
	String get blocked_title => 'Adult content is restricted';

	/// ru: 'Ограничение магазина, политики или администратора имеет приоритет над настройкой аккаунта.'
	String get blocked_body => 'A store, policy, or administrator restriction has priority over account preferences.';

	/// ru: 'ВКЛЮЧИТЬ КОНТЕНТ 18+'
	String get confirm => 'ENABLE ADULT CONTENT';

	/// ru: 'ОТКЛЮЧИТЬ КОНТЕНТ 18+'
	String get revoke => 'DISABLE ADULT CONTENT';

	/// ru: 'ОТМЕНА'
	String get cancel => 'CANCEL';

	/// ru: 'ПОВТОРИТЬ'
	String get retry => 'RETRY';

	/// ru: 'Включить контент 18+?'
	String get confirm_dialog_title => 'Enable adult content?';

	/// ru: 'В будущих выпусках могут появляться допустимые вопросы 18+. Однократное подтверждение синхронизируется между устройствами.'
	String get confirm_dialog_body => 'Eligible 18+ questions may appear in future editions. This one-time confirmation is synchronized across your devices.';

	/// ru: 'Отключить контент 18+?'
	String get revoke_dialog_title => 'Disable adult content?';

	/// ru: 'Будущие назначения будут использовать общий контент. Уже принятые изменения рейтинга и XP не изменятся.'
	String get revoke_dialog_body => 'Future assignments will use general content. Previously accepted rating events and XP will not change.';
}

// Path: profile.settings.notifications_page
class Translations$profile$settings$notifications_page$en {
	Translations$profile$settings$notifications_page$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Напоминание о выпуске дня'
	String get daily_issue => 'Daily issue reminder';

	/// ru: 'Серия под угрозой'
	String get streak_risk => 'Streak at risk';

	/// ru: 'Изменение позиции в рейтинге'
	String get rank_change => 'Leaderboard position changes';

	/// ru: 'Новости и акции Quiz+'
	String get promo => 'Quiz+ news and offers';
}

// Path: profile.settings.about_page
class Translations$profile$settings$about_page$en {
	Translations$profile$settings$about_page$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Версия $version ($build)'
	String version({required Object version, required Object build}) => 'Version ${version} (${build})';

	/// ru: 'Пользовательское соглашение'
	String get terms => 'Terms of service';

	/// ru: 'Политика конфиденциальности'
	String get privacy => 'Privacy policy';

	/// ru: 'Написать в поддержку'
	String get support => 'Contact support';
}

// Path: profile.settings.language_sync
class Translations$profile$settings$language_sync$en {
	Translations$profile$settings$language_sync$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Обновляем вопросы'
	String get title => 'Updating questions';

	/// ru: 'Загружаем вопросы, темы и ответы на выбранном языке'
	String get syncing => 'Loading questions, topics, and answers in the selected language';

	/// ru: 'Вопросы обновлены'
	String get success => 'Questions are updated';

	/// ru: 'Язык интерфейса изменён'
	String get waiting_connection_title => 'Interface language changed';

	/// ru: 'Вопросы обновятся на выбранном языке, когда появится интернет'
	String get waiting_connection => 'Questions will update in the selected language when internet is back';

	/// ru: 'Не удалось обновить вопросы'
	String get failed_title => 'Could not update questions';

	/// ru: 'Старый кеш вопросов пока сохранён. Можно повторить попытку сейчас или дождаться следующей синхронизации'
	String get failed => 'The old question cache is still saved. You can try again now or wait for the next sync';

	/// ru: 'Закрыть'
	String get close => 'Close';

	/// ru: 'Повторить'
	String get retry => 'Retry';
}

// Path: profile.settings.subscription_page
class Translations$profile$settings$subscription_page$en {
	Translations$profile$settings$subscription_page$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Подписка'
	String get title => 'Subscription';

	/// ru: 'Активна'
	String get active => 'Active';

	/// ru: 'Неактивна'
	String get inactive => 'Inactive';

	/// ru: 'Месячная'
	String get plan_monthly => 'Monthly';

	/// ru: 'Годовая'
	String get plan_yearly => 'Yearly';

	/// ru: 'Следующее списание · $date'
	String next_billing({required Object date}) => 'Next billing · ${date}';

	/// ru: 'Изменить план'
	String get change_plan => 'Change plan';

	/// ru: 'Способ оплаты'
	String get payment_method => 'Payment method';

	/// ru: 'История платежей'
	String get payment_history => 'Payment history';

	/// ru: 'Отменить подписку'
	String get cancel => 'Cancel subscription';

	late final Translations$profile$settings$subscription_page$cancel_dialog$en cancel_dialog = Translations$profile$settings$subscription_page$cancel_dialog$en._(_root);
}

// Path: profile.edit.delete_dialog
class Translations$profile$edit$delete_dialog$en {
	Translations$profile$edit$delete_dialog$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Удалить аккаунт?'
	String get title => 'Delete account?';

	/// ru: 'Серия, статистика и достижения будут удалены безвозвратно. Это действие нельзя отменить.'
	String get message => 'Your streak, statistics and achievements will be permanently deleted. This action cannot be undone.';

	/// ru: 'Удалить аккаунт'
	String get confirm => 'Delete account';

	/// ru: 'Отмена'
	String get cancel => 'Cancel';

	/// ru: 'Не удалось удалить аккаунт. Попробуйте позже'
	String get failed => 'Failed to delete the account. Try again later';
}

// Path: profile.edit.password_page
class Translations$profile$edit$password_page$en {
	Translations$profile$edit$password_page$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Пароль'
	String get title => 'Password';

	/// ru: 'Старый пароль'
	String get old_label => 'Old password';

	/// ru: 'Новый пароль'
	String get new_label => 'New password';

	/// ru: 'Повторите пароль'
	String get confirm_label => 'Repeat password';

	/// ru: 'Сохранить'
	String get save => 'Save';

	/// ru: 'Пароль успешно изменён'
	String get success => 'Password changed';

	/// ru: 'Не удалось изменить пароль. Проверьте введённые данные и попробуйте снова'
	String get failed => 'Failed to change password. Check the entered data and try again';
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

// Path: profile.settings.subscription_page.cancel_dialog
class Translations$profile$settings$subscription_page$cancel_dialog$en {
	Translations$profile$settings$subscription_page$cancel_dialog$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Отменить подписку?'
	String get title => 'Cancel subscription?';

	/// ru: 'Quiz+ отключится сразу. Действие доступно только в debug-сборке — реального биллинга пока нет.'
	String get message => 'Quiz+ turns off immediately. Debug builds only — there is no real billing yet.';

	/// ru: 'Отменить подписку'
	String get confirm => 'Cancel subscription';

	/// ru: 'Назад'
	String get cancel => 'Back';
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
			'profile.view.current_level_label' => 'CURRENT LVL',
			'profile.view.next_level' => ({required Object n}) => '→ LVL ${n}',
			'profile.view.stats_section' => '// STATISTICS',
			'profile.view.stat_streak' => 'STREAK, D.',
			'profile.view.stat_answers' => 'ANSWERS',
			'profile.view.stat_accuracy' => 'ACCURACY',
			'profile.view.stat_points' => 'POINTS',
			'profile.view.stat_best_streak' => 'BEST STREAK',
			'profile.view.stat_days_in_game' => 'DAYS PLAYING',
			'profile.view.member_since' => ({required Object date}) => 'PLAYING SINCE ${date}',
			'profile.view.achievements' => ({required Object unlocked, required Object total}) => 'ACHIEVEMENTS · ${unlocked}/${total}',
			'profile.view.load_failed' => 'Could not load profile',
			'profile.view.retry' => 'RETRY',
			'profile.view.mastery' => 'Mastery',
			'profile.view.review' => 'Review queue',
			'profile.settings.title' => 'Settings',
			'profile.settings.account_section' => 'Account',
			'profile.settings.app_section' => 'Application',
			'profile.settings.edit_profile' => 'Edit profile',
			'profile.settings.notifications' => 'Notifications',
			'profile.settings.subscription' => 'Manage subscription',
			'profile.settings.language' => 'Language',
			'profile.settings.theme' => 'Theme',
			'profile.settings.theme_light' => 'Light',
			'profile.settings.theme_system' => 'System',
			'profile.settings.theme_dark' => 'Dark',
			'profile.settings.about' => 'About',
			'profile.settings.sign_in' => 'Sign in',
			'profile.settings.sign_out' => 'Sign out',
			'profile.settings.sign_out_dialog.title' => 'Sign out?',
			'profile.settings.sign_out_dialog.message' => 'Your progress is saved — you can sign in again with this email.',
			'profile.settings.sign_out_dialog.confirm' => 'Sign out',
			'profile.settings.sign_out_dialog.cancel' => 'Cancel',
			'profile.settings.adult_content.label' => 'Adult content',
			'profile.settings.adult_content.title' => 'Adult content',
			'profile.settings.adult_content.enabled_title' => 'Adult content is enabled',
			'profile.settings.adult_content.enabled_body' => 'This preference is synchronized through your account. Store or policy restrictions can disable access at any time.',
			'profile.settings.adult_content.eligible_title' => 'Optional adult content',
			'profile.settings.adult_content.eligible_body' => 'Eligibility does not enable adult content automatically. Confirm only if you want eligible 18+ questions to appear.',
			'profile.settings.adult_content.unavailable_title' => 'Adult content is unavailable',
			'profile.settings.adult_content.unavailable_body' => 'Your current server age status is not eligible for adult content.',
			'profile.settings.adult_content.blocked_title' => 'Adult content is restricted',
			'profile.settings.adult_content.blocked_body' => 'A store, policy, or administrator restriction has priority over account preferences.',
			'profile.settings.adult_content.confirm' => 'ENABLE ADULT CONTENT',
			'profile.settings.adult_content.revoke' => 'DISABLE ADULT CONTENT',
			'profile.settings.adult_content.cancel' => 'CANCEL',
			'profile.settings.adult_content.retry' => 'RETRY',
			'profile.settings.adult_content.confirm_dialog_title' => 'Enable adult content?',
			'profile.settings.adult_content.confirm_dialog_body' => 'Eligible 18+ questions may appear in future editions. This one-time confirmation is synchronized across your devices.',
			'profile.settings.adult_content.revoke_dialog_title' => 'Disable adult content?',
			'profile.settings.adult_content.revoke_dialog_body' => 'Future assignments will use general content. Previously accepted rating events and XP will not change.',
			'profile.settings.notifications_page.daily_issue' => 'Daily issue reminder',
			'profile.settings.notifications_page.streak_risk' => 'Streak at risk',
			'profile.settings.notifications_page.rank_change' => 'Leaderboard position changes',
			'profile.settings.notifications_page.promo' => 'Quiz+ news and offers',
			'profile.settings.about_page.version' => ({required Object version, required Object build}) => 'Version ${version} (${build})',
			'profile.settings.about_page.terms' => 'Terms of service',
			'profile.settings.about_page.privacy' => 'Privacy policy',
			'profile.settings.about_page.support' => 'Contact support',
			'profile.settings.language_sync.title' => 'Updating questions',
			'profile.settings.language_sync.syncing' => 'Loading questions, topics, and answers in the selected language',
			'profile.settings.language_sync.success' => 'Questions are updated',
			'profile.settings.language_sync.waiting_connection_title' => 'Interface language changed',
			'profile.settings.language_sync.waiting_connection' => 'Questions will update in the selected language when internet is back',
			'profile.settings.language_sync.failed_title' => 'Could not update questions',
			'profile.settings.language_sync.failed' => 'The old question cache is still saved. You can try again now or wait for the next sync',
			'profile.settings.language_sync.close' => 'Close',
			'profile.settings.language_sync.retry' => 'Retry',
			'profile.settings.subscription_page.title' => 'Subscription',
			'profile.settings.subscription_page.active' => 'Active',
			'profile.settings.subscription_page.inactive' => 'Inactive',
			'profile.settings.subscription_page.plan_monthly' => 'Monthly',
			'profile.settings.subscription_page.plan_yearly' => 'Yearly',
			'profile.settings.subscription_page.next_billing' => ({required Object date}) => 'Next billing · ${date}',
			'profile.settings.subscription_page.change_plan' => 'Change plan',
			'profile.settings.subscription_page.payment_method' => 'Payment method',
			'profile.settings.subscription_page.payment_history' => 'Payment history',
			'profile.settings.subscription_page.cancel' => 'Cancel subscription',
			'profile.settings.subscription_page.cancel_dialog.title' => 'Cancel subscription?',
			'profile.settings.subscription_page.cancel_dialog.message' => 'Quiz+ turns off immediately. Debug builds only — there is no real billing yet.',
			'profile.settings.subscription_page.cancel_dialog.confirm' => 'Cancel subscription',
			'profile.settings.subscription_page.cancel_dialog.cancel' => 'Back',
			'profile.edit.title' => 'Editing',
			'profile.edit.done' => 'Done',
			'profile.edit.name_label' => 'Name',
			'profile.edit.email_label' => 'Email',
			'profile.edit.password_label' => 'Password',
			'profile.edit.change_password' => 'Change password',
			'profile.edit.delete_account' => 'Delete account',
			'profile.edit.save_failed' => 'Failed to save changes',
			'profile.edit.delete_dialog.title' => 'Delete account?',
			'profile.edit.delete_dialog.message' => 'Your streak, statistics and achievements will be permanently deleted. This action cannot be undone.',
			'profile.edit.delete_dialog.confirm' => 'Delete account',
			'profile.edit.delete_dialog.cancel' => 'Cancel',
			'profile.edit.delete_dialog.failed' => 'Failed to delete the account. Try again later',
			'profile.edit.password_page.title' => 'Password',
			'profile.edit.password_page.old_label' => 'Old password',
			'profile.edit.password_page.new_label' => 'New password',
			'profile.edit.password_page.confirm_label' => 'Repeat password',
			'profile.edit.password_page.save' => 'Save',
			'profile.edit.password_page.success' => 'Password changed',
			'profile.edit.password_page.failed' => 'Failed to change password. Check the entered data and try again',
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
			'leaderboard.rank_header' => 'RANK',
			'leaderboard.participant_header' => 'PLAYER',
			'leaderboard.points_header' => 'POINTS',
			'leaderboard.accuracy_label' => 'ACCURACY',
			'leaderboard.gap_row' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '${n} MORE PLAYER', other: '${n} MORE PLAYERS', ), 
			'leaderboard.total_participants' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '${n} PLAYER TOTAL', other: '${n} PLAYERS TOTAL', ), 
			'leaderboard.retry' => 'RETRY',
			'leaderboard.load_failed' => 'Could not load leaderboard',
			'leaderboard.period_tabs.daily' => 'DAY',
			'leaderboard.period_tabs.weekly' => 'WEEK',
			'leaderboard.period_tabs.monthly' => 'MONTH',
			'leaderboard.period_tabs.yearly' => 'YEAR',
			'leaderboard.periods.daily' => 'today',
			'leaderboard.periods.weekly' => 'this week',
			'leaderboard.periods.monthly' => 'this month',
			'leaderboard.periods.yearly' => 'this year',
			'leaderboard.history.title' => 'Rank trend',
			'leaderboard.history.current_rank_label' => 'Current rank',
			'leaderboard.history.delta_label' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: 'over ${n} day', other: 'over ${n} days', ), 
			'leaderboard.history.chart_end' => 'Today',
			'leaderboard.history.by_days_title' => 'by day',
			'leaderboard.history.today' => 'Today',
			'leaderboard.history.yesterday' => 'Yesterday',
			'leaderboard.history.points' => ({required Object n}) => '${n} pts',
			'leaderboard.history.not_played' => 'Not played',
			'leaderboard.history.empty' => 'No history yet — play an edition to enter the daily rating',
			'leaderboard.history.error' => 'Failed to load history',
			'leaderboard.history.retry' => 'Retry',
			'gamification.level' => ({required Object level}) => 'Level ${level}',
			'gamification.level_short' => ({required Object level}) => 'Lvl ${level}',
			'gamification.xp' => ({required Object current, required Object total}) => '${current} / ${total} XP',
			'gamification.xp_remaining' => ({required Object remaining}) => '${remaining} XP left',
			'gamification.streak' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '${n} day streak', other: '${n} days streak', ), 
			'gamification.points' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '${n} pt', other: '${n} pts', ), 
			'gamification.accuracy' => ({required Object value}) => '${value}% accuracy',
			'gamification.achievements_link' => 'Achievements',
			'gamification.streak_badge_label' => 'STREAK',
			'gamification.level_badge_label' => 'LVL',
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
			'achievements.xp_reward' => ({required Object points}) => '+${points} XP',
			'achievements.error' => 'Failed to load',
			'achievements.retry' => 'Retry',
			'question.answer_letters.0' => 'A',
			'question.answer_letters.1' => 'B',
			'question.answer_letters.2' => 'C',
			'question.answer_letters.3' => 'D',
			'question.meta.counter' => ({required Object current, required Object total}) => 'QUESTION ${current} / ${total}',
			'question.meta.extra_counter' => ({required Object n}) => 'EXTRA QUESTION ${n}',
			'question.meta.topic' => ({required Object topic}) => '// ${topic}',
			'question.state.empty' => 'You\'re done with today\'s questions.\nCome back tomorrow!',
			'question.state.error' => 'Could not load the question',
			'question.answer_reveal.correct' => 'CORRECT',
			'question.answer_reveal.incorrect' => 'INCORRECT',
			'question.answer_reveal.xp_bonus' => ({required Object xp}) => '+${xp} XP',
			'question.answer_reveal.streak_bonus' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '+${n} STREAK', other: '+${n} STREAK', ), 
			'question.answer_reveal.next_question' => 'NEXT QUESTION',
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
			'sign_up.birth_date_label' => 'BIRTH DATE',
			'sign_up.age_check_label' => 'AGE CHECK',
			'sign_up.age_check_note' => 'Used once to determine age eligibility. The original date is not stored in your profile.',
			'forgot_password.title' => 'Forgot\npassword?',
			'forgot_password.subtitle' => 'Enter your email — we\'ll send a reset link.',
			'forgot_password.email_label' => 'EMAIL',
			'forgot_password.submit' => 'SEND LINK',
			'forgot_password.submitting' => 'SENDING...',
			'forgot_password.hint' => 'Link is valid for 15 minutes. Check your Spam folder if the email doesn\'t arrive.',
			'forgot_password.success' => 'Link sent. Check your inbox.',
			'forgot_password.error' => 'Failed to send the link. Please try again later.',
			'start_day.start_button' => 'START EDITION',
			'start_day.more_questions_button' => 'MORE QUESTIONS',
			'start_day.ready_title' => 'DAILY EDITION READY',
			'start_day.issue_completed_title' => 'TODAY\'S ISSUE DONE',
			'start_day.last_session_stats_title' => 'LAST EDITION',
			'start_day.rank_label' => 'RANK',
			'start_day.points_label' => 'POINTS',
			'start_day.accuracy_label' => 'ACCURACY',
			'start_day.question_count_label' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: 'question', other: 'questions', ), 
			'start_day.estimated_time' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '~ ${n} MINUTE', other: '~ ${n} MINUTES', ), 
			'start_day.streak_warning' => ({required InlineSpanBuilder accent}) => TextSpan(children: [ const TextSpan(text: 'Play today to '), accent('keep your streak'), ]), 
			'start_day.freeze_applied_notice' => ({required InlineSpanBuilder accent, required InlineSpan left, required InlineSpan total}) => TextSpan(children: [ const TextSpan(text: 'You missed yesterday — '), accent('a streak freeze was applied automatically.'), const TextSpan(text: ' '), left, const TextSpan(text: ' / '), total, const TextSpan(text: ' left'), ]), 
			'start_day.freeze_applied_advice' => ({required InlineSpanBuilder accent}) => TextSpan(children: [ const TextSpan(text: 'Play today to '), accent('avoid spending freezes when you don\'t need to'), ]), 
			'start_day.streak_lost_notice' => ({required InlineSpan days, required InlineSpanBuilder accent}) => TextSpan(children: [ const TextSpan(text: 'Your streak of '), days, const TextSpan(text: ' '), accent('is lost'), const TextSpan(text: ' — no freezes left'), ]), 
			'start_day.streak_lost_notice_free' => ({required InlineSpan days, required InlineSpanBuilder accent}) => TextSpan(children: [ const TextSpan(text: 'Your streak of '), days, const TextSpan(text: ' '), accent('is lost'), ]), 
			'start_day.streak_lost_days' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '${n} day', other: '${n} days', ), 
			'start_day.streak_lost_advice' => ({required InlineSpanBuilder accent}) => TextSpan(children: [ const TextSpan(text: 'Start a new streak today — '), accent('your first achievement is just 3 days away'), ]), 
			'start_day.start_new_streak_button' => 'START A NEW STREAK',
			'start_day.issue_done_caption' => 'DONE TODAY',
			'start_day.today_stats_title' => 'TODAY',
			'start_day.issue_done_streak' => ({required InlineSpanBuilder accent}) => TextSpan(children: [ const TextSpan(text: 'Issue done, '), accent('streak saved'), const TextSpan(text: ' — come back tomorrow for a new one'), ]),
			'start_day.issue_done_no_streak' => 'Today\'s issue is done — come back tomorrow for a new one',
			'daily_result.goal_completed' => 'DAILY GOAL COMPLETED',
			'daily_result.ring_label' => ({required Object total}) => 'OF ${total}',
			'daily_result.correct_label' => 'CORRECT',
			'daily_result.points_label' => 'POINTS',
			'daily_result.streak_label' => 'STREAK, D.',
			'daily_result.rank_up' => ({required InlineSpan positions}) => TextSpan(children: [ const TextSpan(text: 'You climbed '), positions, const TextSpan(text: ' in the weekly leaderboard'), ]), 
			'daily_result.rank_up_positions' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '${n} position', other: '${n} positions', ), 
			'daily_result.rank_leader' => ({required InlineSpanBuilder accent}) => TextSpan(children: [ accent('First place'), const TextSpan(text: ' in the weekly leaderboard — keep it up'), ]), 
			'daily_result.rank_current' => ({required InlineSpan rank}) => TextSpan(children: [ const TextSpan(text: 'Currently '), rank, const TextSpan(text: ' in the weekly leaderboard — every issue moves you up'), ]), 
			'daily_result.rank_unknown' => ({required InlineSpanBuilder accent}) => TextSpan(children: [ const TextSpan(text: 'Every issue moves you up the '), accent('weekly leaderboard'), ]), 
			'daily_result.continue_button' => 'KEEP PLAYING',
			'daily_result.footer' => 'TODAY\'S ISSUE IS CLOSED · A NEW ONE TOMORROW',
			'daily_limit.title' => 'MORE QUESTIONS',
			'daily_limit.extras_section' => 'EXTRA QUESTIONS TODAY',
			'daily_limit.slots_hint' => ({required Object grants, required Object questions}) => '${grants} ADS · +${questions} QUESTIONS EACH',
			'daily_limit.completed_title' => 'Today\'s issue is done',
			'daily_limit.next_issue_in' => 'New issue in',
			'daily_limit.next_ad_in' => 'Next video available in',
			'daily_limit.watch_ad' => 'Watch a video',
			'daily_limit.watch_ad_caption' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: '+${n} QUESTION · FREE', other: '+${n} QUESTIONS · FREE', ),
			'daily_limit.ad_unavailable' => 'VIDEO SERVICE IS NOT CONNECTED YET',
			'daily_limit.ad_exhausted' => 'No more extra questions today',
			'daily_limit.keep_playing' => 'KEEP PLAYING',
			'daily_limit.unlimited_cta' => 'UNLIMITED WITH QUIZ+',
			'daily_limit.ad.label' => 'AD',
			'daily_limit.ad.skip' => 'Skip',
			'daily_limit.ad.playing' => ({required Object time}) => 'Ad video · ${time}',
			'daily_limit.ad.reward_title' => 'REWARD AFTER WATCHING',
			'daily_limit.ad.reward_amount' => ({required Object n}) => '+${n}',
			'daily_limit.ad.reward_suffix' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: 'question today', other: 'questions today', ),
			'daily_limit.ad.footer' => 'ADS ARE NOT PART OF THE MAIN ISSUE',
			'demo.start.badge' => 'GUEST DEMO',
			'demo.start.title' => 'Try Quiz before signing up',
			'demo.start.body' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: 'Answer one short question, use a hint, and see how answer explanations work.', other: 'Answer ${n} short questions, use a hint, and see how answer explanations work.', ),
			'demo.start.notice' => 'Demo answers are not saved and never affect rating, XP, or streak.',
			'demo.start.start_button' => 'START DEMO',
			'demo.start.sign_in_button' => 'I ALREADY HAVE AN ACCOUNT',
			'demo.quiz.header' => 'QUIZ · DEMO',
			'demo.quiz.exit' => 'EXIT',
			'demo.quiz.show_hint' => 'SHOW HINT',
			'demo.quiz.retry' => 'TRY AGAIN',
			'demo.complete.title' => 'Demo complete',
			'demo.complete.body' => 'Create an account to join the official daily edition, build a streak, and receive a knowledge rating.',
			'demo.complete.create_account' => 'CREATE ACCOUNT',
			'demo.complete.sign_in' => 'SIGN IN',
			'demo.complete.back' => 'BACK TO DEMO',
			'demo.rating.title' => 'Rating requires an account',
			'demo.rating.body' => 'Guest demo answers are not saved and do not participate in the official leaderboard.',
			'demo.rating.sign_in' => 'SIGN IN',
			'demo.rating.create_account' => 'CREATE ACCOUNT',
			'nav.game' => 'GAME',
			'nav.leaderboard' => 'RANK',
			'nav.profile' => 'PROFILE',
			'birth_date_picker.apply' => 'Done',
			'mastery.title' => 'Mastery',
			'mastery.topics_section' => 'Topic mastery',
			'mastery.weakest_label' => 'Weakest topic',
			'mastery.weakest_accuracy' => ({required Object percent}) => '${percent}% accuracy',
			'mastery.weakest_tail' => ' over the last 30 days. The algorithm will serve these questions more often.',
			'mastery.weekly_delta_label' => 'This week',
			'mastery.best_day_label' => 'Best day',
			'mastery.empty' => 'No data yet — play a daily issue and your mastery will show up here',
			'mastery.error' => 'Failed to load',
			'mastery.retry' => 'Retry',
			'mastery.paywall.tagline' => 'Topic mastery',
			'mastery.paywall.description' => 'See where you\'re strong and what needs work — the algorithm does the rest.',
			'mastery.paywall.cta' => 'Try Quiz+',
			'review.title' => 'Review queue',
			'review.info_banner' => 'No manual trigger — spaced repetition keeps the leaderboard fair',
			'review.due_days' => ({required Object n}) => '${n}d',
			'review.due_label' => 'In',
			'review.wrong_times' => ({required Object n}) => 'Missed ${n}×',
			'review.mastered_times' => ({required Object n}) => 'Mastered ${n}×',
			'review.queued_label' => 'Queued for review',
			'review.mastered_label' => 'Already mastered',
			'review.footer' => 'Repeats come back in the next issues',
			'review.empty' => 'The queue is empty — no misses in the recent issues',
			'review.error' => 'Failed to load',
			'review.retry' => 'Retry',
			_ => null,
		};
	}
}
