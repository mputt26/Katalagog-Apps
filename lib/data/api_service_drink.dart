import 'package:dio/dio.dart';
import 'package:menu_resto/model/drinkModel.dart';


class ApiServiceDrink {
  final Dio _dio = Dio();

  Future<List<DrinkItem>> fetchDrinkItems() async {
    try {
      Response response =
          await _dio.get('https://653b4f0c2e42fd0d54d4e623.mockapi.io/admin2');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data
            .map((item) => DrinkItem.fromJson(item))
            .toList();
      } else {
        throw Exception('Failed to load drink items');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
