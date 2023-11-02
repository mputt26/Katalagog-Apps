import 'package:flutter/material.dart';
import 'package:menu_resto/data/api_service_user.dart';
import 'package:menu_resto/pages/home_page.dart';
import 'package:menu_resto/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ApiUser apiUser = ApiUser();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _errorText;

  void _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    bool isValidCredentials = await apiUser.inputCheck(username, password);

    if (isValidCredentials) {
      String nama = _namaController.text;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage(nama: nama)),
      );
    } else {
      setState(() {
        _errorText = 'Invalid username or password. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Log In',
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 40),
                    usernameForm(),
                    SizedBox(height: 20),
                    passwordForm(),
                    SizedBox(height: 20),
                    if (_errorText != null)
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          _errorText!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    submitLogin(),
                    SizedBox(height: 20),
                    registerAccount()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget usernameForm() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 232, 232, 232),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        controller: _usernameController,
        style: TextStyle(color: const Color.fromARGB(255, 74, 74, 74)),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: 'Username',
          labelStyle: TextStyle(color: Colors.grey.shade500),
          prefixIcon:
              Icon(Icons.account_circle_outlined, color: Colors.grey.shade500),
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your username';
          }
          return null;
        },
      ),
    );
  }

  Widget passwordForm() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 232, 232, 232),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        controller: _passwordController,
        obscureText: true,
        style: TextStyle(color: const Color.fromARGB(255, 74, 74, 74)),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(color: Colors.grey.shade500),
          prefixIcon: Icon(Icons.lock_outline, color: Colors.grey.shade500),
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
      ),
    );
  }

  Widget submitLogin() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            _login();
          }
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
          textStyle: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text('Log In'),
      ),
    );
  }

  Widget registerAccount() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Register()),
              );
            },
            child: Text(
              "Do you haven't account? ",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Register()),
              );
            },
            child: Text(
              "Register Now!",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
