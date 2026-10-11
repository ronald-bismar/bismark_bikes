import 'package:login_tutorial/domain/entities/user.dart';
import 'package:login_tutorial/domain/results/result.dart';

abstract class UserRepository {
  Future<Result<User, String>> loginUser(String email, String password);
  Future<void> registerUser(String name, String email, String password);
}
