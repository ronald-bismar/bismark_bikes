import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_tutorial/data/datasources/user/userlocaldatasource.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final databaseProvider = Provider<DatabaseHelper>((ref) {
  return DatabaseHelper();
});

class DatabaseHelper {
  static const String database = 'db_bismark_bikes.db';
  static const int databaseVersion = 1;

  Future<Database> openDb() async {
    return openDatabase(
      join(await getDatabasesPath(), database),
      version: databaseVersion,
      onCreate: (db, version) async {
        await db.execute(UserLocalDataSource.create);
      },
    );
  }
}
