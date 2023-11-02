import 'package:flutter/material.dart';
import 'package:menu_resto/pages/login_page.dart';
import 'package:menu_resto/pages/opening_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resto Menu',
      initialRoute: '/',
      routes: {
        '/': (context) => const OpeningPage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
