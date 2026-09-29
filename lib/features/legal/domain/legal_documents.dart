import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

enum LegalDocument { terms, privacy }

abstract final class LegalDocuments {
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
  }) {
    final fallback = switch (document) {
      LegalDocument.terms => Uri.https('eruday.app', '/terms'),
      LegalDocument.privacy => Uri.https('eruday.app', '/privacy'),
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
      return fallback;
    }
    return candidate;
  }

  static Future<bool> open(LegalDocument document) async {
    try {
      return await launchUrl(
        uriFor(document),
        mode: LaunchMode.externalApplication,
      );
    } catch (error) {
      if (kDebugMode) debugPrint('Could not open legal document: $error');
      return false;
    }
  }
}
