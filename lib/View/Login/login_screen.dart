import 'package:flutter/material.dart';
import 'package:simple_test_practice/Bloc/LoginBlock/Login_block.dart';
import 'package:simple_test_practice/Repository/auth/Login_repositery.dart';
import 'package:simple_test_practice/View/Login/Widget/Email_input_widget.dart';
import 'package:simple_test_practice/View/Login/Widget/Login_button.dart';
import 'package:simple_test_practice/View/Login/Widget/Password_input_widget.dart';
import 'package:simple_test_practice/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBlock _loginBlock;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginBlock = LoginBlock(loginRepositery: getIt<LoginRepositery>());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Screen')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmailInput(emailFocusNode: emailFocusNode),

                const SizedBox(height: 15),

                PasswordInput(passwordFocusNode: passwordFocusNode),

                const SizedBox(height: 15),

                LoginButton(formkey: _formkey),
              ],
            ),
          ),
        ),
      ),
    );
    // );
  }
}
