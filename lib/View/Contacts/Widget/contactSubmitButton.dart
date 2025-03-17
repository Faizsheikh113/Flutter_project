import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_test_practice/Bloc/ContactBloc/contact_bloc.dart';
import 'package:simple_test_practice/Config/Components/FlushBarMessageIndecator.dart';
import 'package:simple_test_practice/Config/Components/Loading_widget.dart';

class SubmitButton extends StatelessWidget {
  final formkey;
  const SubmitButton({super.key, required this.formkey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactBloc, ContactState>(
      listenWhen:
          (previous, current) =>
              current.contactApiStatus != previous.contactApiStatus,
      listener: (context, state) {
        if (state.contactApiStatus == ContactApiStatus.failure) {
          FlushbarIndecator.showError(state.message.toString(), context);
        }
        if (state.contactApiStatus == ContactApiStatus.success) {
          FlushbarIndecator.showSuccess(state.message.toString(), context);
          Timer(Duration(seconds: 2), () => context.go('/Home'));
        }
      },
      child: BlocBuilder<ContactBloc, ContactState>(
        buildWhen:
            (previous, current) =>
              current.contactApiStatus != previous.contactApiStatus,
        builder: (context, state) {
          return state.contactApiStatus == ContactApiStatus.loading
              ? const LoadingWidget()
              : ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    context.read<ContactBloc>().add(ContactButtonEvent());
                  }
                },
                child: const Text('Submit'),
              );
        },
      ),
    );
  }
}

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:simple_test_practice/Bloc/ContactBloc/contact_bloc.dart';
// import 'package:simple_test_practice/Config/Components/FlushBarMessageIndecator.dart';
// import 'package:simple_test_practice/Config/Components/Loading_widget.dart';

// class SubmitButton extends StatelessWidget {
//   final GlobalKey<FormState> formKey;

//   const SubmitButton({super.key, required this.formKey, required void Function() onPressed, required GlobalKey<FormState> formkey});

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<ContactBloc, ContactState>(
//       listenWhen: (previous, current) =>
//           previous.contactApiStatus != current.contactApiStatus,
//       listener: (context, state) {
//         if (state.contactApiStatus == ContactApiStatus.failure) {
//           FlushbarIndecator.showError(state.message ?? 'Error', context);
//         }
//         if (state.contactApiStatus == ContactApiStatus.success) {
//           FlushbarIndecator.showSuccess(state.message ?? 'Success', context);
//           Timer(const Duration(seconds: 2), () => context.go('/Home'));
//         }
//       },
//       child: BlocBuilder<ContactBloc, ContactState>(
//         buildWhen: (previous, current) =>
//             previous.contactApiStatus != current.contactApiStatus,
//         builder: (context, state) {
//           return state.contactApiStatus == ContactApiStatus.loading
//               ? const LoadingWidget()
//               : ElevatedButton(
//                   onPressed: () {
//                     if (formKey.currentState?.validate() ?? false) {
//                       context.read<ContactBloc>().add(ContactButtonEvent());
//                     }
//                   },
//                   child: const Text('Submit'),
//                 );
//         },
//       ),
//     );
//   }
// }
