import 'package:simple_test_practice/Config/ApiUrl.dart';
import 'package:simple_test_practice/Data/Network/network_service_api.dart';
import 'package:simple_test_practice/Model/User/user_model.dart';
import 'package:simple_test_practice/Repository/auth/Login_repositery.dart';

class LoginHttpRepositery implements LoginRepositery {
  final _api = NetworkServiceApi();
  @override
  Future<UserModel> loginApi(dynamic data) async {
    final response = await _api.postApi(Apiurl.loginApi, data);
    return UserModel.fromJson(response);
  }
}
