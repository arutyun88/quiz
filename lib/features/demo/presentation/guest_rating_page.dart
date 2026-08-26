import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/gen/strings.g.dart';

class GuestRatingPage extends StatelessWidget {
  const GuestRatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final t = context.t.demo.rating;
    return Scaffold(
      backgroundColor: palette.background.static,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 32, 22, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Icon(Icons.lock_outline, size: 54, color: palette.text.accent),
              const SizedBox(height: 24),
              Text(
                t.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.unbounded(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: palette.text.primary,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                t.body,
                textAlign: TextAlign.center,
                style: GoogleFonts.spectral(
                  fontSize: 18,
                  height: 1.45,
                  color: palette.text.secondary,
                ),
              ),
              const Spacer(),
              AppButtonV2(
                label: t.sign_in,
                onTap: (complete) {
                  complete();
                  context.pushNamed('login');
                },
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => context.pushNamed('registration'),
                child: Text(t.create_account),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
