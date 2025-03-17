import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Errorpage extends StatelessWidget {
  const Errorpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Error Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Page not found...!! Please reload the app',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 198, 14, 1),
              ),
            ),
            TextButton(
              onPressed: () {
                context.go('/Splash');
              },
              child: const Text('Reload...'),
            ),
          ],
        ),
      ),
    );
  }
}
