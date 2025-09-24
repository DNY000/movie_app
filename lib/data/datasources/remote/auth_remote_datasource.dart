import 'package:loadmore/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  });

  Future<UserModel> signInWithGoogle();

  Future<void> signOut();

  Future<UserModel?> getCurrentUser();

  Stream<UserModel?> get authStateChanges;
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<UserModel> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    final response = await client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final user = response.user;
    if (user == null) throw AuthException('No user returned');
    return UserModel.fromSupabaseUser(user);
  }

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    final response = await client.auth.signUp(
      email: email,
      password: password,
      data: {
        'name': name,
      },
    );
    final user = response.user;
    if (user == null) throw AuthException('No user returned');
    return UserModel.fromSupabaseUser(user);
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    final response = await client.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: null,
    );
    final user = client.auth.currentUser;
    if (user == null) throw AuthException('No user returned');
    return UserModel.fromSupabaseUser(user);
  }

  @override
  Future<void> signOut() => client.auth.signOut();

  @override
  Future<UserModel?> getCurrentUser() async {
    final user = client.auth.currentUser;
    return user != null ? UserModel.fromSupabaseUser(user) : null;
  }

  @override
  Stream<UserModel?> get authStateChanges => client.auth.onAuthStateChange.map(
        (event) => event.session?.user != null
            ? UserModel.fromSupabaseUser(event.session!.user)
            : null,
      );
}


