import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:menu_resto/data/banner_data.dart';
import 'package:menu_resto/style.dart';

class HomePage extends StatefulWidget {
  final String name;
  const HomePage({super.key, required this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHandler(context, widget.name),
      body: mainPage(),
    );
  }
}

// APPBAR
appBarHandler(context, name) {
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
    actions: [
      Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: InkWell(
              borderRadius: BorderRadius.circular(22),
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             ProfilePage(name: widget.name)));
                // debugPrint('profile ditekan');
              },
              child: Ink(
                child: CircleAvatar(
                  child: Text('1'),
                  // child: Text(widget.name[0].toUpperCase(),
                  //     style: defaultB.copyWith(fontSize: 24)),
                ),
              )),
        ),
      )
    ],
  );
}

//Katalgo Menu Kategori

mainPage() {
  return SingleChildScrollView(
    child: Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: Row(children: [
                Text('Info dan Promo Special', style: boldBlack),
                Expanded(
                    child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('Lihat Semua',
                      style: boldRed, textAlign: TextAlign.right),
                ))
              ]),
            ),
            Container(
              child: CarouselSlider.builder(
                itemCount: bannerNow.length,
                options: CarouselOptions(
                  height: 400,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  // onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  var items = bannerNow[index + 1];
                  return carouselBanner(items);
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget carouselBanner(items) {
  return Column(
    children: [
      SizedBox(height: 15),
      Center(
        child: SizedBox(
          width: 360,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              child: Image.network(
                items['img'],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
