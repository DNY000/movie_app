import 'package:loadmore/domain/entities/user_entity.dart';
import 'package:loadmore/domain/repositories/auth_repositories.dart';

class SignInWithEmailPassword {
  final AuthRepository repository;

  SignInWithEmailPassword(this.repository);

  Future<UserEntity> call({required String email, required String password}) {
    return repository.signInWithEmailPassword(email, password);
  }
}


