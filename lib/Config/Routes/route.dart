import 'package:flutter/material.dart';
import 'package:simple_test_practice/Config/Routes/route_name.dart';
import 'package:simple_test_practice/View/Home/home_screen.dart';
import 'package:simple_test_practice/View/Login/login_screen.dart';
import 'package:simple_test_practice/View/Splash/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteName.SplashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RouteName.LoginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RouteName.HomeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder:
              (context) => const Scaffold(
                body: Center(child: Text("No route generated ")),
              ),
        );
    }
  }
}
