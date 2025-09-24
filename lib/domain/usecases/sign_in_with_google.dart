import 'package:loadmore/domain/entities/user_entity.dart';
import 'package:loadmore/domain/repositories/auth_repositories.dart';

class SignInWithGoogle {
  final AuthRepository repository;

  SignInWithGoogle(this.repository);

  Future<UserEntity> call() {
    return repository.signInWithGoogle();
  }
}


