part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final UserModel? user;

  const UserState({this.user});
}

class UserInitial extends UserState {}

class LoadingUserState extends UserState {}

class SetUserState extends UserState {
  const SetUserState({required this.userData}) : super(user: userData);

  final UserModel? userData;
}

class FailureUserState extends UserState {
  const FailureUserState(this.error);

  final String error;
}
