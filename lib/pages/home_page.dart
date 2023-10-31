import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:menu_resto/data/api_service_user.dart';
import 'package:menu_resto/pages/drink_detail.dart';
import 'package:menu_resto/pages/food_detail_pages.dart';
import 'package:menu_resto/pages/open_chat.dart';
import 'package:menu_resto/pages/profile_page.dart';
import 'package:menu_resto/style.dart';

class HomePage extends StatefulWidget {
  final String name;

  HomePage({Key? key, required this.name}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> bannerNow = [
    'assets/images/rendang.jpeg',
    'assets/images/snack.jpeg',
    'assets/images/drink.jpeg',
    'assets/images/food.jpg',
    'assets/images/kacangmerah.jpg',
    'assets/images/daging.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: appBarHandler(context),
        body: mainPage()
        // floatingActionButton: msgButton(context),
        );
  }

  AppBar appBarHandler(BuildContext context) {
    String firstLetter =
        widget.name.isNotEmpty ? widget.name[0].toUpperCase() : '';
    return AppBar(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(95.0),
          bottomRight: Radius.circular(95.0),
        ),
      ),
      backgroundColor: Colors.white,
      shadowColor: Colors.black12,
      toolbarHeight: 135,
      automaticallyImplyLeading: false,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(name: widget.name),
                  ),
                );
              },
              child: CircleAvatar(
                // backgroundColor: const Color.fromARGB(204, 0, 0, 0),
                backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWh98LAB7aS7ChXk0g3XiP_klmG9x7NOOw24Y4FskQIkU63eilJNV2JdQgOkeg_AIf3O4&usqp=CAU',
                ),
                radius: 35,
              ),
            ),
            SizedBox(width: 15), // Jarak antara avatar dan teks
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(
                  'Hallo',
                  style: TextStyle(
                    fontSize: 25,
                    color: black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Mau makan apa hari ini?',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget mainPage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Row(children: [
              Text(
                'Promo Special',
                style: boldBlack.copyWith(fontSize: 21),
              ),
            ]),
          ),
          Container(
            child: CarouselSlider.builder(
              itemCount: bannerNow.length,
              options: CarouselOptions(
                height: 250,
                aspectRatio: 16 / 9,
                viewportFraction: 0.6,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                var items = bannerNow[index];
                return carouselBanner(items);
              },
            ),
          ),
          cardCategory(),
          SizedBox(height: 40),
          ChatRekomendasi(),
          SizedBox(height: 15)
        ],
      ),
    );
  }

// ------------------- WIDGET CAROUSEL --------------
  Widget carouselBanner(items) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(height: 15),
          Center(
            child: SizedBox(
              width: 220,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Image.asset(
                  items,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

// ------------------- WIDGET CARD KATEGORI --------------
  Widget cardCategory() {
    return Center(
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: 2,
        itemBuilder: (ctx, i) {
          String categoryTitle = (i == 0) ? 'Food' : 'Drink';
          return InkWell(
            onTap: () {
              Navigator.push(
                ctx,
                MaterialPageRoute(
                  builder: (context) {
                    if (i == 0) {
                      return FoodDetailPage();
                    } else {
                      return DrinkDetailPage();
                    }
                  },
                ),
              );
            },
            child: AppStyles.customCard(categoryTitle),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 5,
          mainAxisExtent: 200,
        ),
      ),
    );
  }

// ------------------- WIDGET CHAT AI --------------
  Widget ChatRekomendasi() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatBot(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 255, 217, 102),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 130)),
      child: Text('FOOD CHAT',
          style: defaultB.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}
