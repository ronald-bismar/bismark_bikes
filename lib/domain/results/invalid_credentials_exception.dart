// Cuando la contrasenia o el email son incorrectos
class InvalidCredentialsException implements Exception {
  final String message;

  InvalidCredentialsException({required this.message});
}

// Cuando el usuario no existe
class UserNotFoundException implements Exception {
  final String message;

  UserNotFoundException({required this.message});
}

// Cuando ocurra un error en la base de datos local
class StorageException implements Exception {
  final String message;

  StorageException({required this.message});
}
