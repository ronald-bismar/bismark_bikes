import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_tutorial/domain/entities/user.dart';

final firebaseAuthProvider = Provider<firebase.FirebaseAuth>((ref) {
  return firebase.FirebaseAuth.instance;
});

final userRemoteDataSourceProvider = Provider<UserRemoteDataSource>((ref) {
  return UserRemoteDataSource(firebaseAuth: ref.read(firebaseAuthProvider));
});

class UserRemoteDataSource {
  final firebase.FirebaseAuth firebaseAuth;

  UserRemoteDataSource({required this.firebaseAuth});

  Future<User?> validateUser(String email, String password) async {
    final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    final firebaseUser = credential.user;

    if (firebaseUser == null) {
      throw firebase.FirebaseAuthException(code: 'user-not-found');
    }

    return User(firebaseUser.uid, firebaseUser.displayName ?? '', '',
        firebaseUser.email ?? email);
  }
}
