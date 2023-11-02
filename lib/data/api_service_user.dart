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

  Future<String> fetchNama() async {
    try {
      Map<String, dynamic> userData = await fetchData();
      return userData['nama'];
    } catch (error) {
      throw Exception('Failed to load nama: $error');
    }
  }

  Future<Map<String, dynamic>> fetchData() async {
    final response = await _dio.get('$baseUrl/user');
    return response.data[0];
  }

  Future<void> updateData(String nama, String username, String email) async {
    try {
      Response response = await _dio.put(
        '$baseUrl/user/1', // Ganti '1' dengan ID pengguna yang ingin Anda perbarui
        data: {
          'nama': nama,
          'username': username,
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        print('Data updated successfully');
      } else {
        throw Exception('Failed to update data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error updating data: $error');
    }
  }
}
