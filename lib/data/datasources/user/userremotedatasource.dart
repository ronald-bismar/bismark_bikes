import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_tutorial/domain/entities/user.dart';

final userRemoteDataSourceProvider = Provider<UserRemoteDataSource>((ref) {
  return UserRemoteDataSource();
});

class UserRemoteDataSource {
  Future<User?> validateUser() async {
    return null;
  }
}
