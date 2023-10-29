import 'package:flutter/material.dart';
import 'package:menu_resto/data/api_service.dart';

class FoodDetailPage extends StatefulWidget {
  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  late List<FoodItem> foodItems = [];

  @override
  void initState() {
    super.initState();
    _fetchFoodItems();
  }

  Future<void> _fetchFoodItems() async {
    ApiServiceFood apiService = ApiServiceFood();
    try {
      List<FoodItem> items = await apiService.fetchFoodItems();
      setState(() {
        foodItems = items;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text('Food Detail'),
      ),
      body: foodItems.isNotEmpty
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                return FoodCard(foodItem: foodItems[index]);
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class FoodCard extends StatelessWidget {
  final FoodItem foodItem;

  FoodCard({required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Image.network(
              foodItem.image,
              height: 110,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    foodItem.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      Text('\$${foodItem.price}',
                          style: TextStyle(fontSize: 14.0, color: Colors.grey))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
