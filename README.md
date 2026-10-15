# quiz

## Android distributions

The regular Google Play build uses the `global` flavor. Firebase, FCM, AdMob
and RevenueCat remain available when their release configuration is present.
Build the signed Google Play App Bundle with:

```sh
scripts/build_global_android.sh
```

Android commands must select either `global` or `china` explicitly. iOS keeps
its existing unflavored build configuration.

Mainland China Android artifacts must be built through the dedicated command:

```sh
scripts/build_china_android.sh --release
```

The script builds the `china` flavor and removes Firebase, FCM, AdMob and
RevenueCat from the native plugin graph. The flavor also removes Google Play
billing and notification permissions and reports its distribution to Dart at
startup. The free core then uses bundled Remote Config defaults, leaves push,
rewarded ads and purchases unavailable, and continues against the production
API. The completed APK is inspected with Android's `apkanalyzer`; the build
fails if a forbidden SDK package or manifest entry is present. A direct
`flutter build apk --flavor china` is rejected so a partially filtered China
artifact cannot be published accidentally.

## Android release signing

Release builds never fall back to the Android debug certificate. Create one
long-lived signing key for both Android distributions because `global` and
`china` use the same application ID:

```sh
keytool -genkeypair -v \
  -keystore android/eruday-release.jks \
  -alias eruday \
  -keyalg RSA \
  -keysize 4096 \
  -validity 10000
```

The command prompts for passwords and certificate details. Do not put
passwords on the command line. Copy `android/key.properties.example` to the
ignored `android/key.properties` and fill its four values. Store the keystore
and its credentials in separate encrypted backups: losing this signing
identity can prevent users from installing future updates.

CI may provide the same values without creating `key.properties`:

- `ANDROID_KEYSTORE_PATH`
- `ANDROID_KEYSTORE_PASSWORD`
- `ANDROID_KEY_ALIAS`
- `ANDROID_KEY_PASSWORD`
- `ANDROID_SIGNING_CERT_SHA256` (recommended certificate pin)

Read the certificate fingerprint after creating the key with:

```sh
keytool -list -v -keystore android/eruday-release.jks -alias eruday
```

Both release scripts reject missing signing configuration and debug-signed
artifacts. When `ANDROID_SIGNING_CERT_SHA256` is present they also reject a
valid artifact signed by the wrong production key.

When enrolling in Google Play App Signing for the first time, use this existing
key as the app signing key if installs must remain update-compatible between
Google Play and AppGallery. Allowing Google Play to generate a different app
signing key produces a different certificate for Play-delivered APKs even
though the uploaded AAB was signed locally.

## RevenueCat

Pass the platform public SDK key at build time. The app intentionally treats a
missing key as unavailable billing instead of falling back to a local
entitlement:

```sh
fvm flutter run --dart-define=REVENUECAT_IOS_PUBLIC_KEY=appl_...
fvm flutter run --dart-define=REVENUECAT_ANDROID_PUBLIC_KEY=goog_...
```

Configure the RevenueCat current Offering with the Quiz+ packages and use the
server user UUID as the RevenueCat App User ID. Purchase and restore results do
not activate Quiz+ locally: the server profile is refreshed until its
webhook-synchronized entitlement becomes active.

RevenueCat secret API keys and webhook verification secrets belong only in the
server environment. Automatic device identifier collection is disabled until
an external attribution provider is selected for paid acquisition.

## AdMob rewarded ads

The production application IDs are configured in `AndroidManifest.xml` and
`Info.plist`. Debug builds always use Google's official rewarded test units,
even when a production define is present. Pass the production rewarded unit
when building a distributable artifact for the target platform:

```sh
fvm flutter build apk \
  --dart-define=ADMOB_ANDROID_REWARDED_AD_UNIT_ID=ca-app-pub-9071277865237468/2887263570

fvm flutter build ios \
  --dart-define=ADMOB_IOS_REWARDED_AD_UNIT_ID=ca-app-pub-9071277865237468/6259532378
```

Create the required privacy messages in AdMob Privacy & messaging and configure
the rewarded ad unit to call the server's `/api/webhooks/admob/rewarded` SSV
endpoint. UMP refreshes consent on every app launch and ads are requested only
when `canRequestAds()` allows it. If UMP requires a privacy options entry point,
the app exposes it under About.

The client sets the server user UUID as `user_id` and `runId:clientEventId` as
SSV `custom_data`. The SDK's local reward callback never grants questions; it
only starts polling the authoritative server continuation.

## PostHog EU

Product analytics is disabled when its public project token is absent. Enable
it for a build with:

```sh
fvm flutter run --dart-define=POSTHOG_PROJECT_TOKEN=phc_...
```

PostHog is required for production releases. Before publishing a production
build:

- create a dedicated PostHog EU production project;
- provide `POSTHOG_PROJECT_TOKEN` through the release CI configuration;
- verify that every allowlisted event reaches the production project;
- document product analytics, the server UUID identifier, retention and the
  applicable consent or other legal basis in the published privacy policy.

Product analytics is opt-in and defaults to off even when the project token is
present. The app asks once on the first visit to the Profile tab; a refusal is
remembered and is not prompted again. Users can later grant or withdraw consent
under Settings. Withdrawal calls the SDK opt-out and resets its local identity
before any later event can be accepted. Advertising consent remains
independently controlled by Google UMP.

The SDK is pinned to the EU ingestion host (`https://eu.i.posthog.com`) and
identifies an authenticated account only by its server UUID. Do not add email,
name, age-access fields, question text, answer text, or free-form error data to
analytics properties.

Every product event has a code-level property allowlist. Unknown fields and
unbounded or free-form values are removed before the PostHog SDK receives the
event.

PostHog automatic lifecycle events, session replay, surveys, feature flags,
error capture, and push token capture are disabled. A minimal person profile is
created only for an identified, consenting account and contains the server UUID;
Quiz does not attach profile properties. Quiz uses Firebase Remote Config,
Sentry, and FCM for those responsibilities. Product analytics is best-effort and
must never decide entitlement, rewarded quota, rating, streak, or navigation
eligibility.

## Legal documents

Terms and privacy links open in the system browser. Production defaults are
`https://eruday.app/terms` and `https://eruday.app/privacy`. Override them for a
build only when necessary:

```sh
fvm flutter build apk \
  --dart-define=TERMS_URL=https://eruday.app/terms \
  --dart-define=PRIVACY_URL=https://eruday.app/privacy
```

Only HTTPS URLs without embedded credentials are accepted. Invalid values fall
back to the Eruday defaults.

## Sentry

Crash and error reporting is disabled when its DSN is absent. Enable it for a
build and optionally select a safe environment label:

```sh
fvm flutter run \
  --dart-define=SENTRY_DSN=https://...@...ingest.sentry.io/... \
  --dart-define=SENTRY_ENVIRONMENT=development
```

Sentry receives only the authenticated server UUID as user context. Default
PII, request capture, request bodies, screenshots, replay, performance tracing,
user-interaction breadcrumbs, and network/console breadcrumbs are disabled.
Never attach auth tokens, email, name, age-access state, question or answer
text, request payloads, or free-form user input to Sentry tags and contexts.
Remote breadcrumb/context data is additionally reduced to a bounded allowlist
of operational fields. Full diagnostic values remain available only in local
debug output.

Before publishing a release build:

- pass `SENTRY_DSN` to the production build;
- explicitly set `SENTRY_ENVIRONMENT=production` and do not reuse the local
  `.dart_tool/vscode/common_defines.json` configuration;
- configure release symbol upload in CI before distributing obfuscated builds.
- document the lawful basis, retention period and user contact for this
  minimized diagnostic processing separately from optional PostHog consent.

The DSN is a public client configuration value, while Sentry auth tokens used
for symbol upload must remain CI secrets.

## Firebase Remote Config

Remote Config is limited to non-authoritative mobile presentation parameters.
Configure these optional keys in the Firebase console:

- `guest_demo_question_count`: integer from 1 to 10; the in-app default is 3.
- `app_launch_date`: an ISO date-only value such as `2026-08-29`; an absent or
  invalid value displays issue number 1.
- `log_levels`: JSON object with `production` and `debug` minimum breadcrumb
  levels as `package:logging` numeric values from 0 (`ALL`) to 2000 (`OFF`).
  `production` controls Sentry breadcrumbs and `debug` controls local console
  output. The in-app default is `{"production":400,"debug":0}`: Sentry keeps
  `FINER` and above, while the local console keeps all logs. Its threshold can
  also be overridden at runtime.

Cached values activate during startup and network refresh continues in the
background. Production fetches are limited to once per 12 hours; debug builds
use a one-minute interval. Realtime updates are activated while the app is
running. Invalid values and Firebase failures fall back to the bundled
`assets/config/remote_config_defaults.json` snapshot.

To refresh the bundled snapshot directly from Firebase, authenticate the
Firebase CLI with Application Default Credentials and run:

```sh
scripts/firebase/update_remote_config_defaults.sh
```

The command downloads the active template for `quiz-df891`, copies all default
values (including parameter groups), atomically replaces the bundled snapshot,
and runs its contract tests. `FIREBASE_PROJECT_ID` may select a different
project. Commit the resulting JSON together with the code that consumes it;
never pass service-account credentials to the app.

The scheduled `Remote Config defaults` workflow performs the same refresh and
fails when the committed snapshot differs from Firebase. Configure GitHub OIDC
secrets `GCP_WORKLOAD_IDENTITY_PROVIDER` and
`GCP_REMOTE_CONFIG_SERVICE_ACCOUNT`; the service account needs read access to
Remote Config. On failure, the workflow uploads the current snapshot as an
artifact, but never commits or pushes automatically.

Never add Daily Edition quotas or deadlines, rewarded grants, Quiz+
entitlement, rating, streak, age access, assignment eligibility, or navigation
authorization to Remote Config. Those decisions remain server-owned.

## Firebase Cloud Messaging

The app asks for notification permission only from the Notifications settings
screen. After authorization it registers the current FCM token against the
server-owned installation UUID, refreshes the registration when Firebase
rotates the token, and removes the installation before logout. Notification
category choices are account-scoped server state rather than local flags.

Push payloads may navigate only to the fixed `HOME`, `DAILY_EDITION`, `RATING`,
or `REVIEW` destinations. Arbitrary routes, URLs, and entity identifiers are
ignored.

For delivery to physical iOS devices, upload the APNs authentication key in the
Firebase console and enable Push Notifications for the production App ID and
provisioning profiles. Do not commit the APNs private key. Server-side Firebase
Admin credentials and message scheduling are also required before production
notifications can be sent; the current server contract only stores devices and
authoritative preferences.
