class ServerException implements Exception {}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}

class LoginError implements Exception {
  final String message;
  LoginError(this.message);
}
