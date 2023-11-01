import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:menu_resto/pages/opening_page.dart';
import 'package:menu_resto/viewModel/register.dart';
import 'package:menu_resto/data/api_service_regis.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<MockApi>(create: (_) => MockApi()),
        ChangeNotifierProvider<RegisterViewModel>(
          create: (context) =>
              RegisterViewModel(Provider.of<MockApi>(context, listen: false)),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resto Menu',
      home: const OpeningPage(),
    );
  }
}
