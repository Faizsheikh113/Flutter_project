import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_test_practice/Bloc/ContactBloc/contact_bloc.dart';

class ContactFirstNameInput extends StatelessWidget {
  final FocusNode FirstNameFocusNode;
  const ContactFirstNameInput({super.key, required this.FirstNameFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(
      buildWhen: (current, previous) => current.firstName != previous.firstName,
      builder: (context, state) {
        return TextFormField(
          maxLength: 50,
          focusNode: FirstNameFocusNode,
          decoration: const InputDecoration(
            hintText: 'Enter your first name...',
            labelText: 'First name',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<ContactBloc>().add(FirstNameChanged(value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter FirstName';
            }
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:simple_test_practice/Bloc/ContactBloc/contact_bloc.dart';

// class ContactFirstNameInput extends StatelessWidget {
//   final FocusNode firstNameFocusNode;
//   final TextEditingController controller;

//   const ContactFirstNameInput({
//     super.key,
//     required this.firstNameFocusNode,
//     required this.controller, required void Function(dynamic val) onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ContactBloc, ContactState>(
//       buildWhen: (previous, current) => previous.firstName != current.firstName,
//       builder: (context, state) {
//         return TextFormField(
//           controller: controller,
//           maxLength: 50,
//           focusNode: firstNameFocusNode,
//           decoration: const InputDecoration(
//             hintText: 'Enter your first name...',
//             labelText: 'First name',
//             border: OutlineInputBorder(),
//           ),
//           onChanged: (value) =>
//               context.read<ContactBloc>().add(FirstNameChanged(value)),
//           validator: (value) =>
//               value == null || value.isEmpty ? 'Enter FirstName' : null,
//         );
//       },
//     );
//   }
// }
