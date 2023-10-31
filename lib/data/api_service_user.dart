import 'package:dio/dio.dart';

class ApiUser {
  final Dio _dio = Dio();
  final String baseUrl = 'https://653f4bcd9e8bd3be29e030dd.mockapi.io';

  Future<bool> inputCheck(String username, String password) async {
    try {
      Response response = await _dio.get('$baseUrl/user');
      List<dynamic> users = response.data;
      var user = users.firstWhere(
          (user) =>
              user['username'] == username && user['password'] == password,
          orElse: () => null);
      return user != null;
    } catch (error) {
      throw Exception('Failed to check input: $error');
    }
  }

}
