import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:simple_test_practice/Model/User/user_model.dart';
import 'package:simple_test_practice/Services/local_storage.dart';

class SessionController {
  static final SessionController _instance = SessionController._internal();

  final LocalStorage localStorage = LocalStorage();
  UserModel user = UserModel();
  bool? isLogin;

  SessionController._internal() {
    isLogin = false;
  }

  factory SessionController() {
    return _instance;
  }

  Future<void> saveUserInPrefrence(dynamic user) async {
    localStorage.setValue('token', jsonEncode(user));
    localStorage.setValue('isLogin', 'true');
  }
  Future<void> removeUserInPrefrence() async {
    localStorage.deleteValue('token');
    localStorage.deleteValue('isLogin');
  }

  Future<void> getUserFromPreference() async {
    try {
      var userData = await localStorage.readValue('token');
      var loginData = await localStorage.readValue('isLogin');
      if (userData.isNotEmpty) {
        SessionController().user = UserModel.fromJson(jsonDecode(userData));
      }
      SessionController().isLogin = loginData == 'true' ? true : false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
