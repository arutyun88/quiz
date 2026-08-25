import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/daily_edition/domain/service/partner_interaction_tracker.dart';
import 'package:url_launcher/url_launcher.dart';

final partnerInteractionTrackerProvider = Provider<PartnerInteractionTracker>(
  (_) => const NoopPartnerInteractionTracker(),
);

final partnerLinkLauncherProvider = Provider<PartnerLinkLauncher>(
  (_) => const UrlPartnerLinkLauncher(),
);

class UrlPartnerLinkLauncher implements PartnerLinkLauncher {
  const UrlPartnerLinkLauncher();

  @override
  bool canLaunch(String url) => _validatedUri(url) != null;

  @override
  Future<bool> launch(String url) async {
    final uri = _validatedUri(url);
    if (uri == null) return false;
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Uri? _validatedUri(String value) {
    final uri = Uri.tryParse(value);
    if (uri == null ||
        uri.scheme != 'https' ||
        uri.host.isEmpty ||
        uri.userInfo.isNotEmpty) {
      return null;
    }
    return uri;
  }
}
