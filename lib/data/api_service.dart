import 'package:dio/dio.dart';

class ApiServiceFood {
  final Dio _dio = Dio();

  Future<List<FoodItem>> fetchFoodItems() async {
    try {
      Response response =
          await _dio.get('https://653b4f0c2e42fd0d54d4e623.mockapi.io/admin');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data
            .map((item) => FoodItem(item['name'], item['image'], item['price']))
            .toList();
      } else {
        throw Exception('Failed to load food items');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

class FoodItem {
  final String name;
  final String image;
  final double price;

  FoodItem(this.name, this.image, this.price);
}
