import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/features/legal/domain/legal_documents.dart';
import 'package:quiz/gen/strings.g.dart';

class AgreementWidget extends StatefulWidget {
  const AgreementWidget({super.key});

  @override
  State<AgreementWidget> createState() => _AgreementWidgetState();
}

class _AgreementWidgetState extends State<AgreementWidget> {
  late final TapGestureRecognizer _termsRecognizer = TapGestureRecognizer()
    ..onTap = () => LegalDocuments.open(LegalDocument.terms);

  @override
  void dispose() {
    _termsRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      t.authentication.agreement(
        link: (text) {
          return TextSpan(
            text: text,
            style: context.textStyle.body10Medium.copyWith(
              color: context.palette.text.primary,
            ),
            recognizer: _termsRecognizer,
          );
        },
      ),
      style: context.textStyle.body10Regular.copyWith(
        color: context.palette.text.secondary,
      ),
      textAlign: TextAlign.center,
    );
  }
}
