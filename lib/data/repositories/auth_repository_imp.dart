import 'package:loadmore/core/network/exceptions.dart';
import 'package:loadmore/data/datasources/remote/auth_remote_datasource.dart';
import 'package:loadmore/data/models/user_model.dart';
import 'package:loadmore/domain/entities/user_entity.dart';
import 'package:loadmore/domain/repositories/auth_repositories.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserEntity> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      final userModel = await remoteDataSource.signInWithEmailPassword(
        email: email,
        password: password,
      );
      return userModel.toEntity();
    } catch (e) {
      throw ApiException('Authentication failed: $e');
    }
  }

  @override
  Future<UserEntity> signInWithGoogle() async {
    try {
      final userModel = await remoteDataSource.signInWithGoogle();
      return userModel.toEntity();
    } catch (e) {
      throw ApiException('Google authentication failed: $e');
    }
  }

  @override
  Future<UserEntity> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userModel = await remoteDataSource.signUp(
        email: email,
        password: password,
        name: name,
      );
      return userModel.toEntity();
    } catch (e) {
      throw ApiException('Sign up failed: $e');
    }
  }

  @override
  Future<void> signOut() => remoteDataSource.signOut();

  @override
  Future<UserEntity?> getCurrentUser() async {
    final userModel = await remoteDataSource.getCurrentUser();
    return userModel != null ? userModel.toEntity() : null;
  }

  @override
  Stream<UserEntity?> get authStateChanges =>
      remoteDataSource.authStateChanges.map(
        (userModel) => userModel?.toEntity(),
      );
}
