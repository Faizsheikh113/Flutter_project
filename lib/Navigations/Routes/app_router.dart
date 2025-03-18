import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_test_practice/Model/Contact/contact_model.dart';
import 'package:simple_test_practice/View/Contacts/add_contacts_form.dart';
import 'package:simple_test_practice/View/Contacts/edit_contacts_form.dart';
import 'package:simple_test_practice/View/Home/home_screen.dart';
import 'package:simple_test_practice/View/Login/login_screen.dart';
import 'package:simple_test_practice/View/Splash/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: '/Splash',
        path: '/',
        builder: (context, state) {
          return SplashScreen();
        },
      ),
      GoRoute(
        name: '/Login',
        path: '/Login',
        builder: (context, state) {
          return LoginScreen();
        },
      ),
      GoRoute(
        name: '/Home',
        path: '/Home',
        builder: (context, state) {
          return HomeScreen();
        },
      ),
      GoRoute(
        name: '/addContact',
        path: '/addContact',
        builder: (context, state) => const AddContactScreen(),
      ),
      GoRoute(
        name: '/editContact',
        path: '/editContact/:id',
        builder: (context, state) {
          final contact = state.extra as Contact; // Retrieve Contact object
          return EditContactScreen(contact: contact);
        },
      ),
    ],
    errorBuilder: (context, state) {
      return ErrorWidget(state.error.toString());
    },
  );
  // Navigate to Home if nothing to pop
  static void safePopOrHome(BuildContext context) {
    if (GoRouter.of(context).canPop()) {
      GoRouter.of(context).pop();
    } else {
      GoRouter.of(context).go('/Home');
    }
  }
}
