import 'package:login_tutorial/data/datasources/user/userlocaldatasource.dart';
import 'package:login_tutorial/data/datasources/user/userremotedatasource.dart';
import 'package:login_tutorial/domain/entities/user.dart';
import 'package:login_tutorial/domain/repositories/user_repository.dart';
import 'package:login_tutorial/domain/results/result.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(
      {required this.localDataSource, required this.remoteDataSource});

  @override
  Future<Result<User, String>> loginUser(String email, String password) async {
    User? user = await localDataSource.validateUser(email, password);

    if (user != null) {
      return Success(user);
    }

    user = await remoteDataSource.validateUser();

    if (user != null) {
      return Success<User, String>(user);
    }

    return Failure<User, String>('Usuario no encontrado');
  }

  @override
  Future<void> registerUser(String name, String email, String password) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }
}
