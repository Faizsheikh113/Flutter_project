import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_test_practice/Bloc/LoginBlock/Login_block.dart';
import 'package:simple_test_practice/Config/Components/FlushBarMessageIndecator.dart';
import 'package:simple_test_practice/Config/Components/Loading_widget.dart';
import 'package:simple_test_practice/Utils/Enum.dart';

class LoginButton extends StatelessWidget {
  final formkey;
  const LoginButton({super.key, required this.formkey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBlock, LoginState>(
      listenWhen:
          (previous, current) =>
              current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.Error) {
          FlushbarIndecator.showError(state.message.toString(), context);
        }
        if (state.postApiStatus == PostApiStatus.Success) {
          FlushbarIndecator.showSuccess(state.message.toString(), context);
          context.go('/Home');
        }
      },
      child: BlocBuilder<LoginBlock, LoginState>(
        buildWhen:
            (previous, current) =>
                current.postApiStatus != previous.postApiStatus,
        builder: (context, state) {
          return state.postApiStatus == PostApiStatus.Loading
              ? const LoadingWidget()
              : ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    context.read<LoginBlock>().add(LoginButtonEvent());
                  }
                },
                child: const Text('Login'),
              );
        },
      ),
    );
  }
}
