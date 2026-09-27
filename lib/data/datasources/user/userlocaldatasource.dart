import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_tutorial/domain/entities/user.dart';

final userLocalDataSourceProvider = Provider<UserLocalDataSource>((ref) {
  return UserLocalDataSource();
});

class UserLocalDataSource {
  Future<User?> validateUser() async {
    return null;
  }
}
