import 'package:flutter/material.dart';
import 'package:menu_resto/pages/home_page.dart';
import 'package:menu_resto/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> isValid = GlobalKey<FormState>();

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
                  Text('LOGIN', style: defaultB.copyWith(fontSize: 40)),
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
          const Spacer(),
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
        controller: username,
        style: defaultW,
        keyboardType: TextInputType.name,
        decoration: formLoginTheme.copyWith(
          labelText: 'Username',
          prefixIcon: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget passwordForm() {
    return Form(
      child: TextFormField(
        controller: password,
        obscureText: showPassword,
        style: defaultW,
        keyboardType: TextInputType.name,
        decoration: formLoginTheme.copyWith(
            labelText: 'Password',
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            suffixIcon: IconButton(
                icon: Icon(
                  showPassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                })),
      ),
    );
  }

  Widget submitLogin() {
    return ElevatedButton(
      onPressed: () {
        print('terserah');
        inputCheck();
      },
      style: submitStyle,
      child: Text('Submit', style: defaultB.copyWith(fontSize: 20)),
    );
  }

  inputCheck() {
    bool isAllowed = false;
    if (username.text.isNotEmpty && password.text.isNotEmpty) {
      isAllowed = true;
      print('terserah1');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (builder) => HomePage(name: username.text)));
    } else {
      print('terserah2');
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: Text('Error'),
                content: Text('Pastikan username tidak kosong.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'OK',
                    ),
                  )
                ],
              )));
    }
  }
}
