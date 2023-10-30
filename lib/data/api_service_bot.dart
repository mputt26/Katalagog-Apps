import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiBot {
  final String baseUrl = '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';

  Future<Map<String, dynamic>> getUserData(String apiKey) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user'),
      headers: {'Authorization': 'Bearer $apiKey'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user data');
    }
  }
}

class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final String apiKey = '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';
  ApiBot apiBot = ApiBot();
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      Map<String, dynamic> data = await apiBot.getUserData(apiKey);
      setState(() {
        userData = data;
      });
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Gunakan userData untuk menampilkan data pengguna
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot Page'),
      ),
      body: Center(
        child: userData.isNotEmpty
            ? Text('Hello, ${userData['name']}!')
            : CircularProgressIndicator(),
      ),
    );
  }
}

