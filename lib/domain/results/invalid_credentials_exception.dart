class InvalidCredentialsException implements Exception {
  final String message;

  InvalidCredentialsException({required this.message});
}

class UserNotFoundException implements Exception {
  final String message;

  UserNotFoundException({required this.message});
}
