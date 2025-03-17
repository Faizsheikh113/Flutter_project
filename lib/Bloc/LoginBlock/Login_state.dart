part of 'Login_block.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
    this.message = '',
    this.postApiStatus = PostApiStatus.Inital,
  });
  final String email;
  final String password;
  final String message;
  final PostApiStatus postApiStatus;

  LoginState copyWith({
    String? email,
    String? password,
    String? message,
    PostApiStatus? postApiStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  List<Object?> get props => [email, password, postApiStatus, message];
}
