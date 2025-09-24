import 'package:loadmore/domain/entities/user_entity.dart';
import 'package:loadmore/domain/repositories/auth_repositories.dart';

class SignUp {
  final AuthRepository repository;

  SignUp(this.repository);

  Future<UserEntity> call({
    required String email,
    required String password,
    required String name,
  }) {
    return repository.signUp(email: email, password: password, name: name);
  }
}


