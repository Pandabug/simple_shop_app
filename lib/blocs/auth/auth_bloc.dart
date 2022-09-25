import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:simple_shop_app/services/auth_services.dart';
import 'package:simple_shop_app/services/secure_storage_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<SignupEvent>(_onSignup);
    on<CheckLoginEvent>(_checkingLogin);
    on<LogOutEvent>(_logout);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      final response = await AuthServices()
          .login(email: event.email, password: event.password);

      await Future.delayed(const Duration(milliseconds: 350));

      if (response['user'] != null) {
        await SecureStorageService().deleteSecureStorage();
        await SecureStorageService().setToken(response['accessToken']);

        emit(SuccessLoginState());
      } else {
        emit(FailureAuthState(error: response['message']));
      }
    } catch (e) {
      emit(FailureAuthState(error: e.toString()));
    }
  }

  Future<void> _onSignup(SignupEvent event, Emitter<AuthState> emit) async {
    try {
      final response = await AuthServices().signup(
          email: event.email, password: event.password, image: event.image);

      if (response['message'] == 'Success signup!') {
        emit(SuccessSignupState());
      } else {
        emit(FailureAuthState(error: response['message']));
      }
    } catch (e) {
      emit(FailureAuthState(error: e.toString()));
    }
  }

  Future<void> _checkingLogin(
      CheckLoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingAuthState());

      if (await SecureStorageService().readToken() != null) {
        // final response = await AuthServices().profile();

        // FIX ------------- REFRESH TOKEN ---------------
        // final data = await AuthServices().renewToken();

        // if( data.resp ){
        //   await SecureStorageService().persistenToken(data.token);

        //   emit(SuccessLoginState());
        // }else{
        //   await SecureStorageService().deleteSecureStorage();
        //   emit(LogOutState());
        // }
        emit(SuccessLoginState());
      } else {
        await SecureStorageService().deleteSecureStorage();
        emit(LogOutState());
      }
    } catch (e) {
      await SecureStorageService().deleteSecureStorage();
      emit(LogOutState());
    }
  }

  Future<void> _logout(LogOutEvent event, Emitter<AuthState> emit) async {
    SecureStorageService().deleteSecureStorage();
    emit(LogOutState());
  }
}
