import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_tutorial/domain/entities/user.dart';

final userLocalDataSourceProvider = Provider<UserLocalDataSource>((ref) {
  return UserLocalDataSource();
});

class UserLocalDataSource {

  static String create = 
  'CREATE TABLE users('
  'id TEXT PRIMARY KEY, '
  'nombre TEXT, '
  'apellido TEXT, '
  'correo TEXT, '
  'contrasenia TEXT'
  ')';

  Future<User?> validateUser() async {
    return null;
  }
}
