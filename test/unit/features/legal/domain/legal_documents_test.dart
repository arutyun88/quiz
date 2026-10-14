import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/legal/domain/legal_documents.dart';

void main() {
  test('uses localized Eruday HTTPS defaults', () {
    expect(
      LegalDocuments.uriFor(LegalDocument.terms, languageCode: 'ru'),
      Uri.parse('https://eruday.app/ru/terms/'),
    );
    expect(
      LegalDocuments.uriFor(LegalDocument.privacy),
      Uri.parse('https://eruday.app/en/privacy/'),
    );
  });

  test('accepts an HTTPS build override without credentials', () {
    expect(
      LegalDocuments.uriFor(
        LegalDocument.privacy,
        configuredUrl: 'https://legal.eruday.ru/privacy?v=2',
      ),
      Uri.parse('https://legal.eruday.ru/privacy?v=2'),
    );
  });

  test('falls back for insecure or credential-bearing overrides', () {
    expect(
      LegalDocuments.uriFor(
        LegalDocument.terms,
        configuredUrl: 'http://eruday.app/terms',
        languageCode: 'ru',
      ),
      Uri.parse('https://eruday.app/ru/terms/'),
    );
    expect(
      LegalDocuments.uriFor(
        LegalDocument.privacy,
        configuredUrl: 'https://secret@example.test/privacy',
      ),
      Uri.parse('https://eruday.app/en/privacy/'),
    );
  });

  test('falls back to English for unsupported languages', () {
    expect(
      LegalDocuments.uriFor(LegalDocument.terms, languageCode: 'hy'),
      Uri.parse('https://eruday.app/en/terms/'),
    );
  });
}
