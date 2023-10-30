import 'package:dio/dio.dart';

class ApiUser {
  final Dio _dio = Dio();
  final String baseUrl = 'https://653f4bcd9e8bd3be29e030dd.mockapi.io';

  Future<String> getUserName(String nama) async {
    try {
      Response response = await _dio.get('$baseUrl/user?email=$nama');
      List<dynamic> users = response.data;
      if (users.isNotEmpty) {
        var user = users.first;
        String name = user['nama'];
        return name;
      } else {
        throw Exception('User not found');
      }
    } catch (error) {
      throw Exception('Failed to load user data: $error');
    }
  }
  // Future<Map<String, dynamic>> getUserData() async {
  //   try {
  //     Response response = await _dio.get('$baseUrl/user');
  //     return response.data[0];
  //   } catch (error) {
  //     throw Exception('Failed to load user data: $error');
  //   }
  // }

  Future<bool> inputCheck(String username, String password) async {
    try {
      Response response = await _dio.get('$baseUrl/user');
      List<dynamic> users = response.data;
      var user = users.firstWhere(
          (user) => user['email'] == username && user['password'] == password,
          orElse: () => null);
      return user != null;
    } catch (error) {
      throw Exception('Failed to check input: $error');
    }
  }
}


