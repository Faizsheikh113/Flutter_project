import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_test_practice/Bloc/ContactBloc/contact_bloc.dart';

class ContactLastNameInput extends StatelessWidget {
  final FocusNode LastNameFocusNode;
  const ContactLastNameInput({super.key, required this.LastNameFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(
      buildWhen: (current, previous) => current.lastName != previous.lastName,
      builder: (context, state) {
        return TextFormField(
          maxLength: 50,
          focusNode: LastNameFocusNode,
          decoration: const InputDecoration(
            hintText: 'Enter your last name...',
            labelText: 'Last name',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<ContactBloc>().add(LastNameChanged(value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter LastName';
            }
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
