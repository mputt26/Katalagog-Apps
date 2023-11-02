import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class FoodProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  List<FoodItem> _foodItems = [];

  List<FoodItem> get foodItems => _foodItems;

  Future<void> fetchFoodItems() async {
    const maxRetries = 3;
    int retries = 0;

    while (retries < maxRetries) {
      try {
        Response response =
            await _dio.get('https://653b4f0c2e42fd0d54d4e623.mockapi.io/admin');

        if (response.statusCode == 200) {
          List<dynamic> data = response.data;
          _foodItems = data
              .map((item) => FoodItem(
                    name: item['name'],
                    image: item['image'],
                    price: item['price'].toDouble(),
                  ))
              .toList();
          notifyListeners();
          break;
        } else if (response.statusCode == 429) {
          // Implement exponential backoff
          await Future.delayed(Duration(seconds: (1 << retries) * 2));
          retries++;
        } else {
          throw Exception('Failed to load food items');
        }
      } catch (e) {
        // Implement exponential backoff
        await Future.delayed(Duration(seconds: (1 << retries) * 2));
        retries++;
      }
    }
  }
}

class FoodItem {
  final String name;
  final String image;
  final double price;

  FoodItem({required this.name, required this.image, required this.price});
}
