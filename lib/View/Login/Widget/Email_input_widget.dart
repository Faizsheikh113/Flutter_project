import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_test_practice/Bloc/LoginBlock/Login_block.dart';
import 'package:simple_test_practice/Utils/Validation/Validations.dart';

class EmailInput extends StatelessWidget {
  final FocusNode emailFocusNode;
  const EmailInput({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBlock, LoginState>(
      buildWhen: (current, previous) => current.email != previous.email,
      builder: (context, state) {
        return TextFormField(
          maxLength: 50,
          focusNode: emailFocusNode,
          decoration: const InputDecoration(
            hintText: 'Email',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<LoginBlock>().add(EmailChanged(email: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter email';
            }
            if (!Validations.emailValidator(value)) {
              return 'Email is not correct';
            }
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
