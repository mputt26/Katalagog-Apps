// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: true),
//       home: const HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   dynamic tes;

//   Future<void> fetchData() async {
//     final dio = Dio();

//     final appResponse =
//         await dio.get('https://653b4f0c2e42fd0d54d4e623.mockapi.io/users');
//     if (appResponse.statusCode == 200) {
//       setState(() {
//         tes = appResponse.data;
//         print(tes);
//       });
//     } else {
//       print('Gagal mengambil data dari API');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User List'),
//       ),
//       body: Image.network('${tes[0]}')
//       //     ListView.builder(
//       //   // itemCount: 2,
//       //   itemCount: tes.length,
//       //   itemBuilder: (context, index) {
//       //     final user = tes;
//       //     // final user = data[index]['id'];
//       //     // final user = data[index]['data']['alamat'];
//       //     // final user = data[index];
//       //     // final user = data[index]['tags'];
//       //     // final namaApp = data[index]['nama'];
//       //     // return Text(user.toString());
//       //     // return Text(data.toString());
//       //     // return Image.network(
//       //     //     'https://firebasestorage.googleapis.com/v0/b/myits-mobile.appspot.com/o/appIcons%2Fapp-icon.png?alt=media&token=f2d05144-0134-4514-8660-af407770b1a6&_gl=1*1qiz1sx*_ga*MjA4MzMxNDUwOS4xNjk3MTkwMTk5*_ga_CW55HF8NVT*MTY5ODAyMzE0MC4xMy4xLjE2OTgwMjY1OTAuMjIuMC4w');
//       //     // return Image.network(data[2]['gambar']);
//       //     return Text(tes[index].toString());
//       //     // return Text(data[index]['gambar'].toString());
//       //   },
//       );
//   }
// }
