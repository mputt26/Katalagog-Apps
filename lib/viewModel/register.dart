import 'package:flutter/material.dart';
import 'package:menu_resto/data/api_service_regis.dart';
import 'package:menu_resto/model/userModel.dart';

class RegisterViewModel extends ChangeNotifier {
  final MockApi _api;

  RegisterViewModel(this._api);

  Future<void> registerUser(
      String name, String username, String password) async {
    try {
      await _api.registerUser(UserModel(
        id: DateTime.now().toString(),
        name: name,
        username: username,
        password: password,
      ));

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
