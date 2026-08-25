import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_edition/domain/service/partner_interaction_tracker.dart';

class PartnerRecommendationBlock extends StatefulWidget {
  const PartnerRecommendationBlock({
    super.key,
    required this.partner,
    required this.interaction,
    required this.tracker,
    required this.launcher,
  });

  final PartnerRecommendationEntity partner;
  final PartnerInteraction interaction;
  final PartnerInteractionTracker tracker;
  final PartnerLinkLauncher launcher;

  @override
  State<PartnerRecommendationBlock> createState() =>
      _PartnerRecommendationBlockState();
}

class _PartnerRecommendationBlockState
    extends State<PartnerRecommendationBlock> {
  bool _opening = false;

  @override
  void initState() {
    super.initState();
    unawaited(widget.tracker.recordImpression(widget.interaction));
  }

  @override
  void didUpdateWidget(covariant PartnerRecommendationBlock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.interaction.campaignId != widget.interaction.campaignId ||
        oldWidget.interaction.attemptId != widget.interaction.attemptId) {
      unawaited(widget.tracker.recordImpression(widget.interaction));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final partner = widget.partner;
    final canLaunch = widget.launcher.canLaunch(partner.url);

    return Container(
      margin: const EdgeInsets.only(top: 18),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: colors.text.accent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            partner.disclosure.toUpperCase(),
            style: GoogleFonts.jetBrainsMono(
              fontSize: 9,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              color: colors.text.accent,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            partner.title,
            style: GoogleFonts.spectral(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: colors.text.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            partner.body,
            style: GoogleFonts.spectral(
              fontSize: 15,
              height: 1.4,
              color: colors.text.secondary,
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: canLaunch && !_opening ? _open : null,
            child: Text(partner.cta),
          ),
        ],
      ),
    );
  }

  Future<void> _open() async {
    setState(() => _opening = true);
    try {
      final launched = await widget.launcher.launch(widget.partner.url);
      if (launched) {
        await widget.tracker.recordClick(widget.interaction);
      }
    } finally {
      if (mounted) setState(() => _opening = false);
    }
  }
}
