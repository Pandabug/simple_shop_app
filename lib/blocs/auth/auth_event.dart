part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

class SignupEvent extends AuthEvent {
  final String email;
  final String password;
  final String image;

  SignupEvent(this.email, this.password, this.image);
}

class LogOutEvent extends AuthEvent {}

class CheckLoginEvent extends AuthEvent {}
