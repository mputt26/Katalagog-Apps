import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Register',
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 15),
                  namaForm(),
                  SizedBox(height: 15),
                  usernameForm(),
                  SizedBox(height: 15),
                  passwordForm(),
                  SizedBox(height: 15),
                  submitRegister()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget namaForm() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 232, 232, 232),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Form(
        child: TextFormField(
          style: TextStyle(color: const Color.fromARGB(255, 74, 74, 74)),
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: 'Nama',
            labelStyle: TextStyle(color: Colors.grey.shade500),
            prefixIcon: Icon(Icons.account_circle_outlined,
                color: Colors.grey.shade500),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget usernameForm() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 232, 232, 232),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Form(
        child: TextFormField(
          style: TextStyle(color: const Color.fromARGB(255, 74, 74, 74)),
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: 'Username',
            labelStyle: TextStyle(color: Colors.grey.shade500),
            prefixIcon: Icon(Icons.account_circle_outlined,
                color: Colors.grey.shade500),
            border: InputBorder.none,
          ),
        ),
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
        obscureText: true,
        style: TextStyle(color: Colors.white),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(color: Colors.grey.shade500),
          prefixIcon: Icon(Icons.lock_outline, color: Colors.grey.shade500),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget submitRegister() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
          textStyle: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text('Register'),
      ),
    );
  }
}
