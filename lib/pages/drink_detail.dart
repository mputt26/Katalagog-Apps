import 'package:flutter/material.dart';
import 'package:menu_resto/data/api_service_drink.dart';
import 'package:menu_resto/pages/drink_detail_card.dart';
import 'package:menu_resto/style.dart';

class DrinkDetailPage extends StatefulWidget {
  @override
  _DrinkDetailPageState createState() => _DrinkDetailPageState();
}

class _DrinkDetailPageState extends State<DrinkDetailPage> {
  late List<DrinkItem> drinkItems = [];

  @override
  void initState() {
    super.initState();
    _fetchDrinkItems();
  }

  Future<void> _fetchDrinkItems() async {
    ApiServiceDrink apiService = ApiServiceDrink();
    try {
      List<DrinkItem> items = await apiService.fetchDrinkItems();
      setState(() {
        drinkItems = items;
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
                return GestureDetector(
                  onTap: () {
                    _showBottomSheet(context, drinkItems[index]);
                  },
                  child: DrinkCard(drinkItem: drinkItems[index]),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  void _showBottomSheet(BuildContext context, DrinkItem drinkItem) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 253, 150, 32),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.network(drinkItem.image),
                SizedBox(height: 10.0),
                Text(
                  drinkItem.name,
                  textAlign: TextAlign.center,
                  style: defaultB2.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10.0),
                Text(
                  drinkItem.description,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15.0),
              ],
            ),
          ),
        );
      },
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

class DetailImagePage extends StatelessWidget {
  final String imageUrl;

  DetailImagePage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Image'),
      ),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
