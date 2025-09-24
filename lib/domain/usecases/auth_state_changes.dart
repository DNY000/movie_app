import 'package:loadmore/domain/entities/user_entity.dart';
import 'package:loadmore/domain/repositories/auth_repositories.dart';

class AuthStateChanges {
  final AuthRepository repository;

  AuthStateChanges(this.repository);

  Stream<UserEntity?> call() => repository.authStateChanges;
}


