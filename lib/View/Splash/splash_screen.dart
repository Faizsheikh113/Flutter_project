import 'package:flutter/material.dart';
import 'package:simple_test_practice/Services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices _splashServices = SplashServices();
  @override
  void initState() {
    _splashServices.isLoading(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Timer(Duration(seconds: 2), () => context.go('/Login'));
    return Scaffold(
      // appBar: AppBar(title: Text('Splash Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Splash Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
