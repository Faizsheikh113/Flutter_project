// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:simple_test_practice/Bloc/ContactBloc/contact_bloc.dart';
// import 'package:simple_test_practice/Bloc/LoginBlock/Login_block.dart';
// import 'package:simple_test_practice/Config/Components/Confirmation_diloge.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Fetch contacts when HomeScreen is built
//     context.read<ContactBloc>().add(FetchContactListEvent());

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () {
//               // Trigger logout event
//               context.read<LoginBlock>().add(LogoutRequested());
//               // Navigate to login screen
//               context.go('/login');
//             },
//           ),
//         ],
//       ),
//       body: Builder(
//         builder: (scaffoldContext) {
//           return BlocBuilder<ContactBloc, ContactState>(
//             builder: (context, state) {
//               if (state.contactApiStatus == ContactApiStatus.loading) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//               if (state.contactApiStatus == ContactApiStatus.failure) {
//                 return Center(child: Text('Error: ${state.message}'));
//               }
//               if (state.contactList.isEmpty) {
//                 return const Center(child: Text('No Contacts Available'));
//               }
//               return ListView.builder(
//                 itemCount: state.contactList.length,
//                 itemBuilder: (context, index) {
//                   final contact = state.contactList[index];
//                   return Card(
//                     child: ListTile(
//                       title: Text(contact.firstName),
//                       subtitle: Text(contact.email),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.edit),
//                             onPressed: () {
//                               // Navigate to the edit contact screen
//                               context.go('/editContact/${contact.id}');
//                             },
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.delete),
//                             onPressed: () async {
//                               final confirmed = await ConfirmationDialog.show(
//                                 context,
//                                 title: 'Confirm Delete',
//                                 message:
//                                     'Are you sure you want to delete this contact?',
//                               );

//                               if (confirmed == true && context.mounted) {
//                                 context.read<ContactBloc>().add(
//                                   DeleteContactEvent(
//                                     contactId: contact.id.toString(),
//                                     context: context,
//                                   ),
//                                 );
//                               }
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           context.go('/addContact');
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_test_practice/Bloc/ContactBloc/contact_bloc.dart';
import 'package:simple_test_practice/Bloc/LoginBlock/Login_block.dart';
import 'package:simple_test_practice/Config/Components/Confirmation_diloge.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch contacts when HomeScreen is built
    context.read<ContactBloc>().add(FetchContactListEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Trigger logout event
              context.read<LoginBlock>().add(LogoutRequested());
              // Navigate to login screen
              context.go('/login');
            },
          ),
        ],
      ),
      body: Builder(
        builder: (scaffoldContext) {
          return BlocBuilder<ContactBloc, ContactState>(
            builder: (context, state) {
              if (state.contactApiStatus == ContactApiStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              // if (state.contactApiStatus == ContactApiStatus.failure) {
              //   return Center(child: Text('Error: ${state.message}'));
              // }
              if (state.contactList.isEmpty) {
                return const Center(child: Text('No Contacts Available'));
              }
              return ListView.builder(
                itemCount: state.contactList.length,
                itemBuilder: (context, index) {
                  final contact = state.contactList[index];
                  return Card(
                    child: ListTile(
                      title: Text(contact.firstName),
                      subtitle: Text(contact.email),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // Navigate to the edit contact screen
                              context.go('/editContact/${contact.id}');
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () async {
                              final confirmed = await ConfirmationDialog.show(
                                context,
                                title: 'Confirm Delete',
                                message:
                                    'Are you sure you want to delete this contact?',
                              );

                              if (confirmed == true && context.mounted) {
                                context.read<ContactBloc>().add(
                                  DeleteContactEvent(
                                    contact.id.toString(),
                                    scaffoldContext,
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/addContact');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
