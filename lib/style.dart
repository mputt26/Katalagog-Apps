import 'package:flutter/material.dart';

TextStyle defaultW =
    const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 16);
TextStyle defaultB =
    const TextStyle(fontFamily: 'Nunito', color: Colors.black, fontSize: 25);
TextStyle defaultB2 = const TextStyle(color: Colors.black, fontSize: 25);

TextStyle boldBlack = const TextStyle(
    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17);
TextStyle boldRed = const TextStyle(
    color: Color.fromARGB(255, 48, 3, 3),
    fontWeight: FontWeight.bold,
    fontSize: 14);

Color red = Color.fromARGB(255, 53, 1, 1);
Color black = Colors.black;
Color orange = Color.fromARGB(255, 255, 207, 150);
Color tosca = Color.fromARGB(255, 36, 99, 107);

InputDecoration formLoginTheme = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        width: 2,
        color: Colors.white,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        width: 2,
        color: Colors.white,
      ),
    ),
    labelStyle: defaultW);

ButtonStyle submitStyle = ElevatedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 165, 165, 165),
    minimumSize: Size(double.infinity, 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ));

class AppStyles {
  static Card customCard(String categoryTitle) {
    return Card(
      color: Color.fromARGB(255, 249, 181, 114),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        height: 200,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: categoryTitle == 'Food'
                  ? Image.asset('assets/images/fd.png')
                  : Image.asset('assets/images/dr.png'),
            ),
            Text(
              categoryTitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
