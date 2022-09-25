import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_shop_app/models/user_model.dart';

import 'package:simple_shop_app/services/user_services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<GetUserEvent>(_getUser);
  }

  void _getUser(GetUserEvent event, Emitter<UserState> emit) async {
    emit(LoadingUserState());

    try {
      final user = await UserServices().getUserById();

      emit(SetUserState(userData: user));
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }
}
