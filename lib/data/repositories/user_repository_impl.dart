import 'package:login_tutorial/data/datasources/user/userlocaldatasource.dart';
import 'package:login_tutorial/data/datasources/user/userremotedatasource.dart';
import 'package:login_tutorial/domain/entities/user.dart';
import 'package:login_tutorial/domain/repositories/user_repository.dart';
import 'package:login_tutorial/domain/results/invalid_credentials_exception.dart';
import 'package:login_tutorial/domain/results/result.dart';
import 'package:sqflite/sqflite.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(
      {required this.localDataSource, required this.remoteDataSource});

  @override
  Future<Result<User>> loginUser(String email, String password) async {
    try {
      final localUser = await localDataSource.validateUser(email, password);

      if (localUser != null) {
        return Result.success(localUser);
      }

      final remoteUser = await remoteDataSource.validateUser();

      if (remoteUser == null) {
        return Result.failure(
            InvalidCredentialsException(message: 'Usuario no encontrado'));
      }

      return Result.success(remoteUser);
    } on DatabaseException {
      return Result.failure(
          StorageException(message: 'Error en la base de datos'));
    } catch (e) {
      return Result.failure(Exception(e));
    }
  }

  @override
  Future<void> registerUser(String name, String email, String password) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }
}
