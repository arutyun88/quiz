import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/features/demo/presentation/provider/demo_config_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class DemoStartPage extends StatelessWidget {
  final DemoConfig config;

  const DemoStartPage({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final t = context.t.demo.start;
    return Scaffold(
      backgroundColor: palette.background.static,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 28, 22, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  color: palette.text.primary,
                  child: Text(
                    t.badge,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                      color: palette.background.static,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Icon(
                Icons.visibility_outlined,
                size: 54,
                color: palette.text.accent,
              ),
              const SizedBox(height: 24),
              Text(
                t.title,
                style: GoogleFonts.unbounded(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  height: 1.15,
                  color: palette.text.primary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                t.body(n: config.questionCount),
                style: GoogleFonts.spectral(
                  fontSize: 18,
                  height: 1.45,
                  color: palette.text.secondary,
                ),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  border: Border.all(color: palette.text.secondary),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 20,
                      color: palette.text.accent,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        t.notice,
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 11,
                          height: 1.45,
                          color: palette.text.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              AppButtonV2(
                label: t.start_button,
                onTap: (complete) {
                  complete();
                  context.goNamed('quiz');
                },
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => context.pushNamed('login'),
                child: Text(t.sign_in_button),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
