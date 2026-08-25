import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/daily_edition/presentation/provider/partner_interaction_provider.dart';

void main() {
  const launcher = UrlPartnerLinkLauncher();

  test('partner links allow only credential-free HTTPS destinations', () {
    expect(launcher.canLaunch('https://partner.example/offer'), isTrue);
    expect(launcher.canLaunch('http://partner.example/offer'), isFalse);
    expect(
        launcher.canLaunch('https://user:pass@partner.example/offer'), isFalse);
    expect(launcher.canLaunch('javascript:alert(1)'), isFalse);
    expect(launcher.canLaunch('not a url'), isFalse);
  });
}
