import 'package:flutter/material.dart';
import 'package:simple_test_practice/Bloc/ContactBloc/contact_bloc.dart';
import 'package:simple_test_practice/Navigations/Routes/app_router.dart';
import 'package:simple_test_practice/Repository/ContactRepo/contact_repositery.dart';
import 'package:simple_test_practice/View/Contacts/Widget/ContactEmail_input_widget.dart';
import 'package:simple_test_practice/View/Contacts/Widget/ContactLastName_input.dart';
import 'package:simple_test_practice/View/Contacts/Widget/contactFirstName_input_widget.dart';
import 'package:simple_test_practice/View/Contacts/Widget/contactSalutation_input.dart';
import 'package:simple_test_practice/View/Contacts/Widget/contactSubmitButton.dart';
import 'package:simple_test_practice/main.dart';

class AddContactScreen extends StatefulWidget {
  final String? contactId;

  const AddContactScreen({super.key, this.contactId});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  late ContactBloc _contactBloc;

  final _salutationFocusNode = FocusNode();
  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _contactBloc = ContactBloc(contactRepository: getIt<ContactRepository>());
    if (widget.contactId != null) {
      _contactBloc.add(FetchSingleContactEvent(contactId: widget.contactId!));
    }
  }

  @override
  void dispose() {
    _contactBloc.close();
    _salutationFocusNode.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contactId == null ? 'Add Contact' : 'Edit Contact'),
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
                ),
                const SizedBox(height: 15),
                ContactFirstNameInput(FirstNameFocusNode: _firstNameFocusNode),
                const SizedBox(height: 15),
                ContactLastNameInput(LastNameFocusNode: _lastNameFocusNode),
                const SizedBox(height: 15),
                ContactEmailInput(emailFocusNode: _emailFocusNode),
                const SizedBox(height: 15),
                SubmitButton(formkey: _formKey),
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
// import 'package:simple_test_practice/Repository/ContactRepo/contact_repositery.dart';
// import 'package:simple_test_practice/View/Contacts/Widget/ContactEmail_input_widget.dart';
// import 'package:simple_test_practice/View/Contacts/Widget/ContactLastName_input.dart';
// import 'package:simple_test_practice/View/Contacts/Widget/contactFirstName_input_widget.dart';
// import 'package:simple_test_practice/View/Contacts/Widget/contactSalutation_input.dart';
// import 'package:simple_test_practice/View/Contacts/Widget/contactSubmitButton.dart';
// import 'package:simple_test_practice/main.dart';

// class AddContactScreen extends StatefulWidget {
//   final String? contactId;

//   const AddContactScreen({super.key, this.contactId});

//   @override
//   State<AddContactScreen> createState() => _AddContactScreenState();
// }

// class _AddContactScreenState extends State<AddContactScreen> {
//   late ContactBloc _contactBloc;
//   final _formKey = GlobalKey<FormState>();

//   // Controllers and Focus Nodes
//   final _salutationController = TextEditingController();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _emailController = TextEditingController();

//   final _salutationFocusNode = FocusNode();
//   final _firstNameFocusNode = FocusNode();
//   final _lastNameFocusNode = FocusNode();
//   final _emailFocusNode = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     _contactBloc = ContactBloc(contactRepository: getIt<ContactRepository>());

//     // if (widget.contactId != null) {
//     //   _contactBloc.add(FetchSingleContactEvent(contactId: widget.contactId!));
//     // }
//   }

//   @override
//   void dispose() {
//     _contactBloc.close();
//     _salutationController.dispose();
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _emailController.dispose();

//     _salutationFocusNode.dispose();
//     _firstNameFocusNode.dispose();
//     _lastNameFocusNode.dispose();
//     _emailFocusNode.dispose();
//     super.dispose();
//   }

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       final newContact = Contact(
//         salutation: _salutationController.text,
//         firstName: _firstNameController.text,
//         lastName: _lastNameController.text,
//         email: _emailController.text,
//       );

//       // _contactBloc.add(CreateContactEvent(newContact: newContact));
//       // if (widget.contactId == null) {
//       // } else {
//       //   _contactBloc.add(
//       //     UpdateContactEvent(
//       //       contactId: widget.contactId!,
//       //       updatedContact: newContact,
//       //     ),
//       //   );
//       // }
//       context.pop();
//     }
//   }

//   // void _populateFields(ContactState state) {
//   //   if (state.selectedContact != null) {
//   //     _salutationController.text = state.selectedContact!.salutation;
//   //     _firstNameController.text = state.selectedContact!.firstName;
//   //     _lastNameController.text = state.selectedContact!.lastName;
//   //     _emailController.text = state.selectedContact!.email;
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.contactId == null ? 'Add Contact' : 'Edit Contact'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => context.pop(),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: BlocListener<ContactBloc, ContactState>(
//           bloc: _contactBloc,
//           listener: (context, state) {
//             // if (widget.contactId != null && state.selectedContact != null) {
//             //   _populateFields(state);
//             // }
//           },
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 ContactSalutationInput(
//                   controller: _salutationController,
//                   salutationFocusNode: _salutationFocusNode,
//                   onChanged: (val) => _contactBloc.add(SalutationChanged(val)),
//                 ),
//                 const SizedBox(height: 15),
//                 ContactFirstNameInput(
//                   controller: _firstNameController,
//                   firstNameFocusNode: _firstNameFocusNode,
//                   onChanged: (val) => _contactBloc.add(FirstNameChanged(val)),
//                 ),
//                 const SizedBox(height: 15),
//                 ContactLastNameInput(
//                   controller: _lastNameController,
//                   LastNameFocusNode: _lastNameFocusNode,
//                   onChanged:
//                       (val) => _contactBloc.add(
//                         LastNameChanged(val),
//                       ), // ✅ Now works fine
//                 ),
//                 const SizedBox(height: 15),
//                 ContactEmailInput(
//                   controller: _emailController,
//                   emailFocusNode: _emailFocusNode,
//                   onChanged:
//                       (val) => _contactBloc.add(
//                         ContactEmailChanged(val),
//                       ), // ✅ Add here if needed
//                 ),

//                 const SizedBox(height: 20),
//                 SubmitButton(formkey: _formKey),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
