import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:menu_resto/data/banner_data.dart';
import 'package:menu_resto/pages/drink_detail.dart';
import 'package:menu_resto/pages/food_detail_pages.dart';
import 'package:menu_resto/pages/open_chat.dart';
import 'package:menu_resto/style.dart';

class HomePage extends StatelessWidget {
  final String name;
  const HomePage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHandler(context),
      body: mainPage(),
      floatingActionButton: msgButton(context),
    );
  }

  AppBar appBarHandler(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      automaticallyImplyLeading: false,
      backgroundColor: black,
      scrolledUnderElevation: 0.0,
      title: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Datang',
              style: defaultW,
            ),
            Text(name),
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
            padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
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
                var items = bannerNow[index + 1];
                return carouselBanner(items);
              },
            ),
          ),
          cardCategory(),
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
                  'assets/images/rendang.jpeg',
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
  Widget msgButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blueGrey,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OpenChat(),
          ),
        );
      },
      child: const Icon(
        Icons.chat,
        color: Colors.white,
      ),
    );
  }
}
