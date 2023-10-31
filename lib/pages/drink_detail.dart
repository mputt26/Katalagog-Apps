import 'package:flutter/material.dart';
import 'package:menu_resto/data/api_service_drink.dart';

class DrinkDetailPage extends StatefulWidget {
  @override
  _DrinkDetailPageState createState() => _DrinkDetailPageState();
}

class _DrinkDetailPageState extends State<DrinkDetailPage> {
  late List<DrinkItem> drinkItems = [];

  @override
  void initState() {
    super.initState();
    // print('Ini inisial state');
    _fetchDrinkItems();
  }

  Future<void> _fetchDrinkItems() async {
    ApiServiceDrink apiService = ApiServiceDrink();
    try {
      // print('Check API');
      List<DrinkItem> items = await apiService.fetchDrinkItems();
      setState(() {
        drinkItems = items;
        // print(drinkItems);
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade700,
        title: Text('Drink Detail'),
      ),
      body: drinkItems.isNotEmpty
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: drinkItems.length,
              itemBuilder: (context, index) {
                return DrinkCard(drinkItem: drinkItems[index]);
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class DrinkCard extends StatelessWidget {
  final DrinkItem drinkItem;

  DrinkCard({required this.drinkItem});

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
          Image.network(
            drinkItem.image,
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              drinkItem.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            '\$${drinkItem.price}',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
