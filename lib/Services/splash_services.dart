import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_test_practice/Services/SessionManager/session_controller.dart';

class SplashServices {
  void isLoading(BuildContext context) {
    SessionController()
        .getUserFromPreference()
        .then((value) {
          if (SessionController().isLogin ?? false) {
            Timer(Duration(seconds: 2), () => context.go('/Home'));
          } else {
            Timer(Duration(seconds: 2), () => context.go('/Login'));
          }
        })
        .onError((error, stackTrace) {
          Timer(Duration(seconds: 2), () => context.go('/Login'));
        });
  }
}
