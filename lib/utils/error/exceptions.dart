class ServerException implements Exception {
  String? message;

  ServerException({this.message='ServerException Message'});
}

class CacheException implements Exception {}
