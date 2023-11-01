import 'package:dio/dio.dart';
import 'package:menu_resto/model/userModel.dart';

class MockApi {
  Future<void> registerUser(UserModel user) async {
    await Dio().post('https://653f4bcd9e8bd3be29e030dd.mockapi.io/user',
        data: user.toJson());
  }
}
