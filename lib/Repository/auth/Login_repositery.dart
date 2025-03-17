import 'package:simple_test_practice/Model/User/user_model.dart';

abstract class LoginRepositery {
  Future<UserModel> loginApi(dynamic data);
}
