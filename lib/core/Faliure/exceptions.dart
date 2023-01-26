class ServerException implements Exception {}

class OfflineException implements Exception {}

class NotFoundException implements Exception {}

class ApiException implements Exception {
  final String errorMsg;
  final String? errorImageUrl;
  ApiException({required this.errorMsg, this.errorImageUrl});
}

class ThisUserIsRegestiredBeforeException implements Exception {}

class ThisUserNotFoundInDBException implements Exception {}

class WrongPasswordOrUserNameException implements Exception {}

class EmptyCacheException implements Exception {}
