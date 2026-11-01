import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;
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

      final remoteUser = await remoteDataSource.validateUser(email, password);

      if (remoteUser == null) {
        return Result.failure(
            InvalidCredentialsException(message: 'Usuario no encontrado'));
      }

      return Result.success(remoteUser);
    } on DatabaseException {
      return Result.failure(
          StorageException(message: 'Error en la base de datos'));
    } on FirebaseAuthException catch (error) {
      return switch (error.code) {
        'invalid-credential' ||
        'wrong-password' ||
        'user-not-found' =>
          Result<User>.failure(
              InvalidCredentialsException(message: 'Credenciales invalidas')),
        'invalid-email' => Result<User>.failure(
            InvalidCredentialsException(message: 'El email no es valido')),
        'network-request-failed' => Result<User>.failure(InvalidCredentialsException(
            message: 'No se pudo conectar para la autenticación')),
        _ => Result<User>.failure(Exception(error.code))
      };
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
