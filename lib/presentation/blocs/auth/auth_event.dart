import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

abstract class EmailPasswordSignInEvent extends AuthEvent {
  final String email;
  final String password;
  const EmailPasswordSignInEvent(this.email, this.password);
  @override
  List<Object?> get props => [email, password];
}

abstract class GoogleSignInEvent extends AuthEvent {
  const GoogleSignInEvent();
}

abstract class FacebookSignInEvent extends AuthEvent {
  const FacebookSignInEvent();
}
