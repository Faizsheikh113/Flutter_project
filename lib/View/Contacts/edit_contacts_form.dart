import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_test_practice/Bloc/ContactBloc/contact_bloc.dart';
import 'package:simple_test_practice/Config/Components/FlushBarMessageIndecator.dart';
import 'package:simple_test_practice/Model/Contact/contact_model.dart';
import 'package:simple_test_practice/Navigations/Routes/app_router.dart';

class EditContactScreen extends StatefulWidget {
  final Contact contact;

  const EditContactScreen({super.key, required this.contact});

  @override
  State<EditContactScreen> createState() => _EditContactScreenState();
}

class _EditContactScreenState extends State<EditContactScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _salutationController;

  @override
  void initState() {
    super.initState();
    // Pre-fill form fields with contact details
    _emailController = TextEditingController(text: widget.contact.email);
    _firstNameController = TextEditingController(
      text: widget.contact.firstName,
    );
    _lastNameController = TextEditingController(text: widget.contact.lastName);
    _salutationController = TextEditingController(
      text: widget.contact.salutation,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _salutationController.dispose();
    super.dispose();
  }

  void _updateContact() {
    if (_formKey.currentState!.validate()) {
      final updatedContact = Contact(
        email: _emailController.text.trim(),
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        salutation: _salutationController.text.trim(),
      );

      context.read<ContactBloc>().add(
        UpdateContactEvent(
          widget.contact.id.toString(),
          updatedContact,
          context,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Contact'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => AppRouter.safePopOrHome(context),
        ),
      ),
      body: BlocConsumer<ContactBloc, ContactState>(
        listener: (context, state) {
          if (state.contactApiStatus == ContactApiStatus.success) {
            FlushbarIndecator.showSuccess(state.message.toString(), context);
            Timer(Duration(seconds: 2), () => context.go('/Home'));
            // Navigator.pop(context); // Navigate back after successful update
          } else if (state.contactApiStatus == ContactApiStatus.failure) {
            FlushbarIndecator.showError(state.message.toString(), context);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Email Input
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator:
                        (value) => value!.isEmpty ? 'Enter an email' : null,
                  ),
                  const SizedBox(height: 16),

                  // First Name Input
                  TextFormField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(labelText: 'First Name'),
                    validator:
                        (value) => value!.isEmpty ? 'Enter first name' : null,
                  ),
                  const SizedBox(height: 16),

                  // Last Name Input
                  TextFormField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(labelText: 'Last Name'),
                    validator:
                        (value) => value!.isEmpty ? 'Enter last name' : null,
                  ),
                  const SizedBox(height: 16),

                  // Salutation Input
                  TextFormField(
                    controller: _salutationController,
                    decoration: const InputDecoration(labelText: 'Salutation'),
                    validator:
                        (value) => value!.isEmpty ? 'Enter salutation' : null,
                  ),
                  const SizedBox(height: 32),

                  // Update Button
                  state.contactApiStatus == ContactApiStatus.loading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                        onPressed: _updateContact,
                        child: const Text('Update Contact'),
                      ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
