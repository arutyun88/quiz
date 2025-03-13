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
	@override late final _TranslationsProfileRu profile = _TranslationsProfileRu._(_root);
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

// Path: profile.theme.switcher
class _TranslationsProfileThemeSwitcherRu implements TranslationsProfileThemeSwitcherEn {
	_TranslationsProfileThemeSwitcherRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get as_system => 'Как в системе';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'languages.en': return 'English';
			case 'languages.ru': return 'Русский';
			case 'profile.theme.title': return 'Тема оформления';
			case 'profile.theme.switcher.as_system': return 'Как в системе';
			case 'profile.application': return 'Приложение';
			case 'profile.language.change': return 'Изменить язык';
			default: return null;
		}
	}
}

