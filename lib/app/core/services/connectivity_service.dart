import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class ConnectivityService {
  Future<bool> hasInternetConnection();
  Stream<InternetStatus> get onStatusChange;
}

@Singleton(as: ConnectivityService)
class ConnectivityServiceImpl implements ConnectivityService {
  final InternetConnection _internetConnection;

  ConnectivityServiceImpl({
    required InternetConnection internetConnection,
  }) : _internetConnection = internetConnection;

  @override
  Future<bool> hasInternetConnection() async {
    return await _internetConnection.hasInternetAccess;
  }

  @override
  Stream<InternetStatus> get onStatusChange => _internetConnection.onStatusChange;
}
