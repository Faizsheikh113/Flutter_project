part of 'Login_block.dart';

abstract class LoginEvents extends Equatable {
  const LoginEvents();
  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvents {
  const EmailChanged({required this.email});
  final String email;
  @override
  List<Object> get props => [email];
}

class EmailUnFocused extends LoginEvents {}

class PasswordChanged extends LoginEvents {
  const PasswordChanged({required this.password});
  final String password;
  @override
  List<Object> get props => [password];
}

class PasswordUnFocused extends LoginEvents {}

class LoginButtonEvent extends LoginEvents {}

class LogoutRequested extends LoginEvents {}
