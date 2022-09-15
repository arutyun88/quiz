class NetworkOtherException implements Exception {
  final String code;

  NetworkOtherException(this.code);
}

class NotFoundException implements Exception {}
