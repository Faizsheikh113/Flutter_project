import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_test_practice/Bloc/ContactBloc/contact_bloc.dart';

class ContactSalutationInput extends StatelessWidget {
  final FocusNode SalutationFocusNode;
  const ContactSalutationInput({
    super.key,
    required this.SalutationFocusNode,
    // required TextEditingController controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(
      buildWhen:
          (current, previous) => current.salutation != previous.salutation,
      builder: (context, state) {
        return TextFormField(
          maxLength: 50,
          focusNode: SalutationFocusNode,
          decoration: const InputDecoration(
            hintText: 'ex:- Mr.',
            labelText: 'Salutation',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<ContactBloc>().add(SalutationChanged(value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter Salutation';
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

// class ContactSalutationInput extends StatelessWidget {
//   final FocusNode salutationFocusNode;
//   final TextEditingController controller;

//   const ContactSalutationInput({
//     super.key,
//     required this.salutationFocusNode,
//     required this.controller, required void Function(dynamic val) onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ContactBloc, ContactState>(
//       buildWhen: (previous, current) =>
//           previous.salutation != current.salutation,
//       builder: (context, state) {
//         return TextFormField(
//           controller: controller,
//           maxLength: 50,
//           focusNode: salutationFocusNode,
//           decoration: const InputDecoration(
//             hintText: 'ex: Mr.',
//             labelText: 'Salutation',
//             border: OutlineInputBorder(),
//           ),
//           onChanged: (value) =>
//               context.read<ContactBloc>().add(SalutationChanged(value)),
//           validator: (value) =>
//               value == null || value.isEmpty ? 'Enter Salutation' : null,
//         );
//       },
//     );
//   }
// }
