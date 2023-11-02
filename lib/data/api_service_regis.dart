import 'package:dio/dio.dart';

class RegisterService {
  Future<void> registerUser(
      String nama, String username, String password, String email) async {
    try {
      String id = DateTime.now().toString();
      UserModel user = UserModel(
          id: id,
          email: email,
          nama: nama,
          username: username,
          password: password);
      await Dio().post('https://653f4bcd9e8bd3be29e030dd.mockapi.io/user',
          data: user.toJson());
      print('Pendaftaran berhasil!');
    } catch (error) {
      print('Gagal mendaftar: $error');
      throw error;
    }
  }
}

class UserModel {
  final String id;
  final String email;
  final String nama;
  final String password;
  final String username;

  UserModel({
    required this.id,
    required this.email,
    required this.nama,
    required this.password,
    required this.username,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'nama': nama,
      'password': password,
      'username': username,
    };
  }
}
