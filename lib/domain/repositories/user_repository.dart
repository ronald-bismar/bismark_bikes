import 'package:login_tutorial/domain/entities/user.dart';

abstract class UserRepository {
  Future<User?> loginUser(String email, String password);
  Future<void> registerUser(String name, String email, String password);
}
