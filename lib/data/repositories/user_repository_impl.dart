import 'package:login_tutorial/data/datasources/user/userlocaldatasource.dart';
import 'package:login_tutorial/data/datasources/user/userremotedatasource.dart';
import 'package:login_tutorial/domain/entities/user.dart';
import 'package:login_tutorial/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(
      {required this.localDataSource, required this.remoteDataSource});

  @override
  Future<User?> loginUser(String email, String password) async {
    User? user = await localDataSource.validateUser();

    if (user != null) {
      return user;
    }

    user = await remoteDataSource.validateUser();
    return user;
  }

  @override
  Future<void> registerUser(String name, String email, String password) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }
}
