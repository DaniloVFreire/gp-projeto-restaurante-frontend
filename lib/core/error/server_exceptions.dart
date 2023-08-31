class ServerException implements Exception{
  ServerException({required this.errorMessage});
  final String errorMessage;
}

class ApiRequestTimeoutException extends ServerException{
  ApiRequestTimeoutException({required errorMessage}):super(errorMessage: errorMessage);
}