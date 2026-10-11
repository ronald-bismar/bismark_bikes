import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_tutorial/data/datasources/database_helper.dart';
import 'package:login_tutorial/domain/entities/user.dart';
import 'package:sqflite/sqflite.dart';

// Crear un provider
final userLocalDataSourceProvider = Provider<UserLocalDataSource>((ref) {
  DatabaseHelper database = ref.watch(databaseProvider);
  return UserLocalDataSource(databaseHelper: database);
});

class UserLocalDataSource {
  final DatabaseHelper databaseHelper;

  UserLocalDataSource({required this.databaseHelper});

  static const String table = "users";

  // Creamos la tabla usuarios
  static String create = 'CREATE TABLE $table('
      'id TEXT PRIMARY KEY, '
      'nombre TEXT, '
      'apellido TEXT, '
      'correo TEXT, '
      'contrasenia TEXT'
      ')';

  Future<User?> validateUser(String email, String password) async {
    final Database db = await databaseHelper.openDb();

    final List<Map<String, dynamic>> cMap = await db.query(table,
        where: 'correo = ? AND contrasenia = ?', whereArgs: [email, password]);

    if (cMap.isNotEmpty) {
      return User.fromMap(cMap[0]);
    }

    return null;
  }

  // Actualizar usuario de forma local
  // Eliminar al usuario de forma local
  // Guardar al usuario de forma local
}
