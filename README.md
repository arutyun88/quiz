# quiz

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

Debug builds use Google's official sample app and rewarded ad unit IDs. Before
release, replace the sample application IDs in `AndroidManifest.xml` and
`Info.plist`, then pass the production rewarded unit for the target platform:

```sh
fvm flutter build apk \
  --dart-define=ADMOB_ANDROID_REWARDED_AD_UNIT_ID=ca-app-pub-.../...

fvm flutter build ios \
  --dart-define=ADMOB_IOS_REWARDED_AD_UNIT_ID=ca-app-pub-.../...
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

The SDK is pinned to the EU ingestion host (`https://eu.i.posthog.com`) and
identifies an authenticated account only by its server UUID. Do not add email,
name, age-access fields, question text, answer text, or free-form error data to
analytics properties.

PostHog session replay, surveys, feature flags, error capture, and push token
capture are disabled. Quiz uses Firebase Remote Config, Sentry, and FCM for
those responsibilities. Product analytics is best-effort and must never decide
entitlement, rewarded quota, rating, streak, or navigation eligibility.

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

Configure release symbol upload in CI before distributing obfuscated or
release builds; the DSN is a public client configuration value, while Sentry
auth tokens used for symbol upload must remain CI secrets.
