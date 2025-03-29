#!/bin/bash

dart run drift_dev schema dump lib/app/core/database/app_database.dart lib/app/core/database/gen/migrations
dart run drift_dev schema steps lib/app/core/database/gen/migrations lib/app/core/database/gen/schema_versions.dart