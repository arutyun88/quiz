import 'package:quiz/features/snackbar/adapters/auth_snackbar_adapter.dart';
import 'package:quiz/features/snackbar/adapters/network_snackbar_adapter.dart';
import 'package:quiz/features/snackbar/adapters/snackbar_adapter.dart';
import 'package:quiz/features/snackbar/adapters/sync_snackbar_adapter.dart';
import 'package:quiz/features/snackbar/adapters/update_snackbar_adapter.dart';

class SnackbarAdapterSets {
  static const List<SnackbarAdapter> basic = [
    SyncSnackbarAdapter(),
    NetworkSnackbarAdapter(),
  ];

  static const List<SnackbarAdapter> advanced = [
    SyncSnackbarAdapter(),
    NetworkSnackbarAdapter(),
    UpdateSnackbarAdapter(),
    AuthSnackbarAdapter(),
  ];

  static const List<SnackbarAdapter> complete = [
    SyncSnackbarAdapter(),
    NetworkSnackbarAdapter(),
    UpdateSnackbarAdapter(),
    AuthSnackbarAdapter(),
  ];

  static const List<SnackbarAdapter> minimal = [
    NetworkSnackbarAdapter(),
  ];

  static const List<SnackbarAdapter> noSync = [
    NetworkSnackbarAdapter(),
    AuthSnackbarAdapter(),
  ];
}
