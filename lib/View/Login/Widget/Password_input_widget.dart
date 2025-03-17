import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_test_practice/Bloc/LoginBlock/Login_block.dart';

class PasswordInput extends StatelessWidget {
  final FocusNode passwordFocusNode;
  const PasswordInput({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBlock, LoginState>(
      buildWhen: (current, previous) => current.email != previous.email,
      builder: (context, state) {
        return TextFormField(
          maxLength: 50,
          focusNode: passwordFocusNode,
          decoration: const InputDecoration(
            hintText: 'Password',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<LoginBlock>().add(PasswordChanged(password: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter Password';
            }
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
