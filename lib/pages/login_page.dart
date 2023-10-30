import 'package:flutter/material.dart';
import 'package:menu_resto/data/api_service_user.dart';
import 'package:menu_resto/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ApiUser apiUser = ApiUser();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _login() async {
    String username = usernameController.text;
    String password = passwordController.text;
    bool isValidCredentials = await apiUser.inputCheck(username, password);

    if (isValidCredentials) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage(name: username)),
      );
    } else {
      _showErrorDialog();
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invalid Credentials'),
          content: Text('Please enter valid username and password.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 50, right: 50, top: 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('LOGIN',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  usernameForm(),
                  SizedBox(height: 20),
                  passwordForm(),
                  SizedBox(height: 20),
                  submitLogin(),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
              width: double.infinity,
              height: 300,
              child: Image.asset(
                'assets/images/design2.png',
                fit: BoxFit.fill,
              ))
        ],
      ),
    );
  }

  Widget usernameForm() {
    return Form(
      child: TextFormField(
        controller: usernameController,
        style: TextStyle(color: Colors.white),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: 'Username',
          labelStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(Icons.account_circle, color: Colors.white),
        ),
      ),
    );
  }

  Widget passwordForm() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      style: TextStyle(color: Colors.white),
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(Icons.lock, color: Colors.white)),
    );
  }

  Widget submitLogin() {
    return ElevatedButton(
      onPressed: _login,
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 20),
      ),
      child: Text('Submit'),
    );
  }
}
