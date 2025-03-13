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
	late final TranslationsProfileEn profile = TranslationsProfileEn._(_root);
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

// Path: profile.theme.switcher
class TranslationsProfileThemeSwitcherEn {
	TranslationsProfileThemeSwitcherEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get as_system => 'As in the system';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'languages.en': return 'English';
			case 'languages.ru': return 'Русский';
			case 'profile.theme.title': return 'Theme';
			case 'profile.theme.switcher.as_system': return 'As in the system';
			case 'profile.application': return 'Application';
			case 'profile.language.change': return 'Choose language';
			default: return null;
		}
	}
}

