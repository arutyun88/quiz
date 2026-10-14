import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

enum LegalDocument { terms, privacy }

abstract final class LegalDocuments {
  static const _hasConfiguredTermsUrl = bool.hasEnvironment('TERMS_URL');
  static const _hasConfiguredPrivacyUrl = bool.hasEnvironment('PRIVACY_URL');
  static const _configuredTermsUrl = String.fromEnvironment(
    'TERMS_URL',
    defaultValue: 'https://eruday.app/terms',
  );
  static const _configuredPrivacyUrl = String.fromEnvironment(
    'PRIVACY_URL',
    defaultValue: 'https://eruday.app/privacy',
  );

  static Uri uriFor(
    LegalDocument document, {
    String? configuredUrl,
    String languageCode = 'en',
  }) {
    final language = languageCode.toLowerCase() == 'ru' ? 'ru' : 'en';
    final localizedFallback = switch (document) {
      LegalDocument.terms => Uri.https('eruday.app', '/$language/terms/'),
      LegalDocument.privacy => Uri.https('eruday.app', '/$language/privacy/'),
    };
    final rawUrl = configuredUrl ??
        switch (document) {
          LegalDocument.terms => _configuredTermsUrl,
          LegalDocument.privacy => _configuredPrivacyUrl,
        };
    final candidate = Uri.tryParse(rawUrl.trim());
    if (candidate == null ||
        candidate.scheme != 'https' ||
        candidate.host.isEmpty ||
        candidate.userInfo.isNotEmpty) {
      return localizedFallback;
    }

    final usesDefaultUrl = configuredUrl == null &&
        switch (document) {
          LegalDocument.terms => !_hasConfiguredTermsUrl,
          LegalDocument.privacy => !_hasConfiguredPrivacyUrl,
        };
    if (usesDefaultUrl) return localizedFallback;

    return candidate;
  }

  static Future<bool> open(
    LegalDocument document, {
    required String languageCode,
  }) async {
    try {
      return await launchUrl(
        uriFor(document, languageCode: languageCode),
        mode: LaunchMode.externalApplication,
      );
    } catch (error) {
      if (kDebugMode) debugPrint('Could not open legal document: $error');
      return false;
    }
  }
}
