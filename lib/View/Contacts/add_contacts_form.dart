import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_test_practice/Bloc/ContactBloc/contact_bloc.dart';
import 'package:simple_test_practice/Navigations/Routes/app_router.dart';
import 'package:simple_test_practice/View/Contacts/Widget/ContactEmail_input_widget.dart';
import 'package:simple_test_practice/View/Contacts/Widget/ContactLastName_input.dart';
import 'package:simple_test_practice/View/Contacts/Widget/contactFirstName_input_widget.dart';
import 'package:simple_test_practice/View/Contacts/Widget/contactSalutation_input.dart';
import 'package:simple_test_practice/View/Contacts/Widget/contactSubmitButton.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final salutationController = TextEditingController();

  final _salutationFocusNode = FocusNode();
  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();

  @override
  void dispose() {
    // Clean up controllers and focus nodes
    salutationController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    _salutationFocusNode.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _submitContact() {
    if (_formKey.currentState!.validate()) {
      context.read<ContactBloc>().add(
        ContactButtonEvent(),
      );
      AppRouter.safePopOrHome(context); // Navigate back after submission
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contact'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            AppRouter.safePopOrHome(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContactSalutationInput(
                  SalutationFocusNode: _salutationFocusNode,
                  controller: salutationController,
                ),
                const SizedBox(height: 15),
                ContactFirstNameInput(
                  controller: firstNameController,
                  FirstNameFocusNode: _firstNameFocusNode,
                ),
                const SizedBox(height: 15),
                ContactLastNameInput(
                  LastNameFocusNode: _lastNameFocusNode,
                  controller: lastNameController,
                ),
                const SizedBox(height: 15),
                ContactEmailInput(
                  emailFocusNode: _emailFocusNode,
                  controller: emailController,
                ),
                const SizedBox(height: 15),
                SubmitButton(
                  formkey: _formKey,
                  onPressed: _submitContact,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:simple_test_practice/Bloc/ContactBloc/contact_bloc.dart';
// import 'package:simple_test_practice/Model/Contact/contact_model.dart';
// import 'package:simple_test_practice/Navigations/Routes/app_router.dart';
// import 'package:simple_test_practice/View/Contacts/Widget/contactSubmitButton.dart';

// class AddContactScreen extends StatefulWidget {
//   final String? contactId; // Nullable for Add or Edit
//   const AddContactScreen({Key? key, this.contactId}) : super(key: key);

//   @override
//   _AddContactScreenState createState() => _AddContactScreenState();
// }

// class _AddContactScreenState extends State<AddContactScreen> {
//   final _formKey = GlobalKey<FormState>();

//   late TextEditingController emailController;
//   late TextEditingController firstNameController;
//   late TextEditingController lastNameController;
//   late TextEditingController salutationController;

//   @override
//   void initState() {
//     super.initState();

//     // Initialize controllers
//     emailController = TextEditingController();
//     firstNameController = TextEditingController();
//     lastNameController = TextEditingController();
//     salutationController = TextEditingController();

//     // 🟢 Fetch contact data if editing
//     if (widget.contactId != null) {
//       context.read<ContactBloc>().add(
//         FetchSingleContactEvent(contactId: widget.contactId!),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     firstNameController.dispose();
//     lastNameController.dispose();
//     salutationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.contactId != null ? 'Edit Contact' : 'Add Contact'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             // AppRouter.safePopOrHome(context);
//             // GoRouter.of(context).pop();
//             context.pop();
//           },
//         ),
//       ),
//       body: BlocListener<ContactBloc, ContactState>(
//         listener: (context, state) {
//           print(
//             "UIBloc Listener state :- " + state.contactApiStatus.toString(),
//           );
//           print("UIBloc Listener email :- " + state.email);
//           print("UIBloc Listener firstName :- " + state.firstName);
//           print("UIBloc Listener lastName :- " + state.lastName);
//           print("UIBloc Listener salutation :- " + state.salutation);
//           if (state is ContactLoaded && state.contact != null) {
//             // Ensure safe access to contact properties
//             // final contact = state.contact;

//             emailController.text = state.email;
//             firstNameController.text = state.firstName;
//             lastNameController.text = state.lastName;
//             salutationController.text = state.salutation;
//           }

//           // if (state.message.isNotEmpty) {
//           //   ScaffoldMessenger.of(
//           //     context,
//           //   ).showSnackBar(SnackBar(content: Text(state.message)));
//           // }
//         },
//         child: BlocBuilder<ContactBloc, ContactState>(
//           builder: (context, state) {
//             return Form(
//               key: _formKey,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: firstNameController,
//                       // initialValue: state.firstName,
//                       decoration: const InputDecoration(
//                         labelText: 'First Name',
//                       ),
//                       onChanged:
//                           (value) => context.read<ContactBloc>().add(
//                             FirstNameChanged(value),
//                           ),
//                     ),
//                     TextFormField(
//                       controller: lastNameController,
//                       decoration: const InputDecoration(labelText: 'Last Name'),
//                       onChanged:
//                           (value) => context.read<ContactBloc>().add(
//                             LastNameChanged(value),
//                           ),
//                     ),
//                     TextFormField(
//                       controller: emailController,
//                       decoration: const InputDecoration(labelText: 'Email'),
//                       onChanged:
//                           (value) => context.read<ContactBloc>().add(
//                             ContactEmailChanged(value),
//                           ),
//                     ),
//                     TextFormField(
//                       controller: salutationController,
//                       decoration: const InputDecoration(
//                         labelText: 'Salutation',
//                       ),
//                       onChanged:
//                           (value) => context.read<ContactBloc>().add(
//                             SalutationChanged(value),
//                           ),
//                     ),
//                     const SizedBox(height: 20),
//                     SubmitButton(formkey: _formKey, onPressed: _handleSubmit),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   void _handleSubmit() {
//     if (_formKey.currentState!.validate()) {
//       final bloc = context.read<ContactBloc>();

//       if (widget.contactId == null) {
//         // Add new contact
//         bloc.add(ContactButtonEvent());
//       } else {
//         // Update contact (exclude id from payload)
//         final updatedContact = Contact(
//           firstName: firstNameController.text,
//           lastName: lastNameController.text,
//           email: emailController.text,
//           salutation: salutationController.text,
//         );

//         bloc.add(UpdateContactEvent(widget.contactId!, updatedContact));
//       }
//     }
//   }
// }
