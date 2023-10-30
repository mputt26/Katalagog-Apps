import 'package:flutter/material.dart';
import 'package:menu_resto/style.dart';
import 'login_page.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key});

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 150, left: 50),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 50),
              Text('Menu Katalog', style: defaultW.copyWith(fontSize: 30)),
              Text('Savoria Resto', style: defaultW.copyWith(fontSize: 45)),
              const SizedBox(height: 10),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: Text('Get Started',
                          style:
                              TextStyle(color: Colors.white, fontSize: 14)))),
            ]),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/design.gif',
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}
