import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_tutorial/data/datasources/user/userlocaldatasource.dart';
import 'package:login_tutorial/data/datasources/user/userremotedatasource.dart';
import 'package:login_tutorial/data/repositories/user_repository_impl.dart';
import 'package:login_tutorial/domain/entities/user.dart';
import 'package:login_tutorial/domain/repositories/user_repository.dart';
import 'package:login_tutorial/domain/results/result.dart' as result;
import 'package:login_tutorial/presentation/states/login_states.dart';

class LoginNotifier extends Notifier<LoginState> {
  late final UserRepository userRepository;

  @override
  LoginState build() {
    userRepository = UserRepositoryImpl(
      localDataSource: ref.read(userLocalDataSourceProvider),
      remoteDataSource: ref.read(userRemoteDataSourceProvider),
    );
    return Idle();
  }

  Future<void> loginUser(String email, String password) async {
    state = Loading();
    final loginResult = await userRepository.loginUser(email, password);

    state = switch (loginResult) {
      result.Success<User>(data: final dataUser) => Success(dataUser),
      result.Failure<User>(error: final error) => Error(error.toString()),
    };
  }

  void reset() {
    state = Idle();
  }
}
