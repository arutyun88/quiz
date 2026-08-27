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
