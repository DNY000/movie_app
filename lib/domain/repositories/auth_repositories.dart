import 'package:loadmore/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> signInWithEmailPassword(String email, String password);

  Future<UserEntity> signUp({
    required String email,
    required String password,
    required String name,
  });

  Future<UserEntity> signInWithGoogle();

  Future<void> signOut();

  Future<UserEntity?> getCurrentUser();

  Stream<UserEntity?> get authStateChanges;
}

