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
  ];

  String userName = '';

  @override
  void initState() {
    super.initState();
    _fetchUserName('');
  }

  Future<void> _fetchUserName(String nama) async {
    try {
      ApiUser apiUser = ApiUser();
      String name = await apiUser.getUserName(nama);
      setState(() {
        userName = name;
      });
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 178, 158),

      appBar: appBarHandler(context),
      body: Container(
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [
          //       Colors.white,
          //       Color.fromARGB(255, 250, 196, 58),
          //       Color.fromARGB(255, 226, 88, 34),
          //       Color.fromARGB(255, 124, 10, 2),
          //     ],
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //   ),
          // ),
          child: mainPage()),
      // floatingActionButton: msgButton(context),
    );
  }

  AppBar appBarHandler(BuildContext context) {
    String firstLetter =
        widget.name.isNotEmpty ? widget.name[0].toUpperCase() : '';
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.black,
      toolbarHeight: 150,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 66, 58, 50),
              Color.fromARGB(255, 154, 139, 122),
              Color.fromARGB(255, 191, 178, 158),
              Color.fromARGB(255, 214, 199, 174),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang!',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 33,
                    height: 2.5),
                textAlign: TextAlign.left,
              ),
              Text(
                widget.name,
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      actions: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              borderRadius: BorderRadius.circular(22),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(name: widget.name),
                  ),
                );
              },
              child: Ink(
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(204, 0, 0, 0),
                  radius: 40,
                  child: Text(firstLetter,
                      style:
                          defaultB.copyWith(fontSize: 35, color: Colors.white)),
                ),
              ),
            ),
          ),
        )
      ],
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
                'Info dan Promo Special',
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
                viewportFraction: 0.8,
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
          SizedBox(height: 47),
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
              width: 310,
              height: 170,
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
            builder: (context) => const OpenChat(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 154, 139, 122),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 130)),
      child: Text('FOOD CHAT',
          style: defaultB.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}
