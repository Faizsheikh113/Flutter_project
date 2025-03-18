import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_test_practice/Bloc/ContactBloc/contact_bloc.dart';
import 'package:simple_test_practice/Utils/Validation/Validations.dart';

class ContactEmailInput extends StatelessWidget {
  final FocusNode emailFocusNode;
    final TextEditingController controller;

  const ContactEmailInput({
    super.key,
    required this.emailFocusNode, required this.controller,
    // required TextEditingController controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(
      // buildWhen: (current, previous) => current.email != previous.email,
      builder: (context, state) {
        return TextFormField(
          maxLength: 50,
          focusNode: emailFocusNode,
          decoration: const InputDecoration(
            hintText: 'jhon@example.com',
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
          // initialValue: state.email,
          onChanged: (value) {
            context.read<ContactBloc>().add(ContactEmailChanged(value));
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

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:simple_test_practice/Bloc/ContactBloc/contact_bloc.dart';
// import 'package:simple_test_practice/Utils/Validation/Validations.dart';

// class ContactEmailInput extends StatelessWidget {
//   final FocusNode emailFocusNode;
//   final TextEditingController controller;
//   final ValueChanged<String>? onChanged; // ✅ Add this

//   const ContactEmailInput({
//     super.key,
//     required this.emailFocusNode,
//     required this.controller,
//     this.onChanged, // ✅ Ensure it's optional here
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ContactBloc, ContactState>(
//       buildWhen: (previous, current) => previous.email != current.email,
//       builder, required TextEditingController emailController, required TextEditingController emailController: (context, state) {
//         return TextFormField(
//           controller: controller,
//           maxLength: 50,
//           focusNode: emailFocusNode,
//           decoration: const InputDecoration(
//             hintText: 'jhon@example.com',
//             labelText: 'Email',
//             border: OutlineInputBorder(),
//           ),
//           onChanged: (value) {
//             context.read<ContactBloc>().add(ContactEmailChanged(value));
//             if (onChanged != null) onChanged!(value); // ✅ Call external
//           },
//           validator: (value) {
//             if (value == null || value.isEmpty) return 'Enter email';
//             if (!Validations.emailValidator(value)) return 'Invalid email';
//             return null;
//           },
//         );
//       },
//     );
//   }
// }
