import 'package:flutter/material.dart';
import 'package:menu_resto/data/api_service.dart';
import 'package:provider/provider.dart';

class FoodDetailPage extends StatefulWidget {
  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  @override
  Widget build(BuildContext context) {
    final foodProvider = Provider.of<FoodProvider>(context);

    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade700,
        title: Text('Food Detail'),
      ),
      body: FutureBuilder<void>(
        // Menggunakan future dari fetchFoodItems di FoodProvider
        future: foodProvider.fetchFoodItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: foodProvider.foodItems.length,
              itemBuilder: (context, index) {
                return FoodCard(foodItem: foodProvider.foodItems[index]);
              },
            );
          }
        },
      ),
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
          bottomRight: Radius.circular(40),
        ),
      ),
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 15),
                      Text(
                        '\$${foodItem.price}',
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
