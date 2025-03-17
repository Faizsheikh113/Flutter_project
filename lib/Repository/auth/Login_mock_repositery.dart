import 'package:simple_test_practice/Model/User/user_model.dart';
import 'package:simple_test_practice/Repository/auth/Login_repositery.dart';

class LoginMockRepositery implements LoginRepositery {
  @override
  Future<UserModel> loginApi(dynamic data) async {
    await Future.delayed(Duration(seconds: 2));
    final response = {'token': 'aslkdfjasdkfhkjashdkfj'};
    return UserModel.fromJson(response);
  }
}
