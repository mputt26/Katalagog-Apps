import 'package:flutter/material.dart';
import 'package:menu_resto/data/api_service_regis.dart';
import 'package:menu_resto/pages/login_page.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late RegisterService _registerService;

  @override
  void initState() {
    super.initState();
    _registerService = RegisterService();
  }

  void _registerUser(RegisterService registerService) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      String nama = _namaController.text;
      String username = _usernameController.text;
      String password = _passwordController.text;
      String email = _emailController.text;
      print(nama);

      try {
        await registerService.registerUser(nama, username, password, email);
        // Pendaftaran berhasil, navigasi ke halaman login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } catch (error) {
        // Pesan eror gagal register
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal mendaftar: $error')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 242, 152, 73),
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
                  emailForm(),
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
        key: _formKey,
        child: TextFormField(
          controller: _namaController,
          style: TextStyle(color: const Color.fromARGB(255, 74, 74, 74)),
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Data wajib diisi';
            }
            return null;
          },
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

  Widget emailForm() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 232, 232, 232),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Form(
        child: TextFormField(
          controller: _emailController,
          style: TextStyle(color: const Color.fromARGB(255, 74, 74, 74)),
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Data wajib diisi';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(color: Colors.grey.shade500),
            prefixIcon: Icon(Icons.email_outlined, color: Colors.grey.shade500),
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
          controller: _usernameController,
          style: TextStyle(color: const Color.fromARGB(255, 74, 74, 74)),
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Data wajib diisi';
            }
            return null;
          },
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
      child: Form(
        child: TextFormField(
          controller: _passwordController,
          style: TextStyle(color: const Color.fromARGB(255, 74, 74, 74)),
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Data wajib diisi';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(color: Colors.grey.shade500),
            prefixIcon: Icon(Icons.key, color: Colors.grey.shade500),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget submitRegister() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          _registerUser(_registerService);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
          textStyle: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        child: Text('Register'),
      ),
    );
  }
}
