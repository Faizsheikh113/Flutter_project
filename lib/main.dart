import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_test_practice/Bloc/ContactBloc/contact_bloc.dart';
import 'package:simple_test_practice/Bloc/LoginBlock/Login_block.dart';
import 'package:simple_test_practice/Navigations/Routes/app_router.dart';
import 'package:simple_test_practice/Repository/ContactRepo/contact_http_repositery.dart';
import 'package:simple_test_practice/Repository/ContactRepo/contact_repositery.dart';
import 'package:simple_test_practice/Repository/auth/Login_Http_repositery.dart';
import 'package:simple_test_practice/Repository/auth/Login_repositery.dart';

GetIt getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  servicesLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  LoginBlock(loginRepositery: getIt<LoginRepositery>()),
        ),
        BlocProvider(
          create:
              (context) =>
                  ContactBloc(contactRepository: getIt<ContactRepository>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
    );
  }
}

void servicesLocator() {
  getIt.registerLazySingleton<LoginRepositery>(() => LoginHttpRepositery());
  getIt.registerLazySingleton<ContactRepository>(() => ContactHttpRepository());
}
