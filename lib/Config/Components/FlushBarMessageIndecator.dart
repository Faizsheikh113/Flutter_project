import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushbarIndecator {
  static void showSuccess(String message, BuildContext context) {
    Flushbar(
      message: message,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.green,
      borderRadius: BorderRadius.circular(10),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      flushbarPosition: FlushbarPosition.TOP,
      reverseAnimationCurve: Curves.bounceIn,
      icon: const Icon(Icons.check_circle, size: 28, color: Colors.white),
    ).show(context);
  }

  static void showError(String message, BuildContext context) {
    Flushbar(
      message: message,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
      borderRadius: BorderRadius.circular(10),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      flushbarPosition: FlushbarPosition.TOP,
      reverseAnimationCurve: Curves.linear,
      icon: const Icon(Icons.error, size: 28, color: Colors.white),
    ).show(context);
  }

  static void showInfo(String message, BuildContext context) {
    Flushbar(
      message: message,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.blue,
      borderRadius: BorderRadius.circular(10),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      flushbarPosition: FlushbarPosition.TOP,
      reverseAnimationCurve: Curves.bounceIn,
      icon: const Icon(Icons.info, size: 28, color: Colors.white),
    ).show(context);
  }
}
