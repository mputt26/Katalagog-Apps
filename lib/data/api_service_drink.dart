import 'package:dio/dio.dart';

class ApiServiceDrink {
  final Dio _dio = Dio();

  Future<List<DrinkItem>> fetchDrinkItems() async {
    try {
      Response response =
          await _dio.get('https://653b4f0c2e42fd0d54d4e623.mockapi.io/admin2');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        // print('CHECK API');
        return data
            .map((item) => DrinkItem(item['name'], item['image'],
                item['price'].toDouble(), item['description']))
            .toList();
      } else {
        throw Exception('Failed to load drink items');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

class DrinkItem {
  final String name;
  final String image;
  final double price;
  final String description;

  DrinkItem(this.name, this.image, this.price, this.description);
}
