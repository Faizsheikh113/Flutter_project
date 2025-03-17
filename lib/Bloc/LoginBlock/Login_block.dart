import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:simple_test_practice/Repository/auth/Login_repositery.dart';
import 'package:simple_test_practice/Services/SessionManager/session_controller.dart';
import 'package:simple_test_practice/Utils/Enum.dart';
part 'Login_event.dart';
part 'Login_state.dart';

class LoginBlock extends Bloc<LoginEvents, LoginState> {
  LoginRepositery loginRepositery;
  LoginBlock({required this.loginRepositery}) : super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginButtonEvent>(_onLoginPressed);
    on<LogoutRequested>(_onLogoutPressed);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    print("Email in Login Bloc ;- ${event}");
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    print("Password in Login Bloc ;- ${event}");
    emit(state.copyWith(password: event.password));
  }

  void _onLoginPressed(LoginButtonEvent event, Emitter<LoginState> emit) async {
    print("Password in Login Bloc ;- ${event}");
    Map data = {"email": state.email, "password": state.password};
    emit(state.copyWith(postApiStatus: PostApiStatus.Loading));
    await loginRepositery
        .loginApi(data)
        .then((value) async {
          if (value.error.isNotEmpty) {
            emit(
              state.copyWith(
                message: value.error.toString(),
                postApiStatus: PostApiStatus.Error,
              ),
            );
          } else {
            await SessionController().saveUserInPrefrence(value);
            await SessionController().getUserFromPreference();
            emit(
              state.copyWith(
                message: 'Login Successfull !!!',
                postApiStatus: PostApiStatus.Success,
              ),
            );
          }
        })
        .onError((message, stackTrace) {
          emit(
            state.copyWith(
              message: message.toString(),
              postApiStatus: PostApiStatus.Error,
            ),
          );
        });
  }

  void _onLogoutPressed(LogoutRequested event, Emitter<LoginState> emit) async {
    await SessionController().removeUserInPrefrence();
    emit(
      state.copyWith(
        postApiStatus: PostApiStatus.Success,
        message: "Logout Successful",
      ),
    );
  }
}
