import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Message {
  final String sender;
  final String text;

  Message({required this.sender, required this.text});
}

void main() => runApp(MaterialApp(home: ChatBot()));

class ChatBot extends StatefulWidget {
  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final List<Message> _messages = [];
  TextEditingController _messageController = TextEditingController();

  void _sendMessage(String text) {
    setState(() {
      _messages.add(Message(sender: 'User', text: text));
    });
    _askGPT(text);
  }

  void _askGPT(String question) async {
    // Ganti dengan kunci API OpenAI yang valid
    String apiKey = '';
    Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.openai.com/v1',
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
    ));

    Map<String, dynamic> data = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "system",
          "content":
              "Kamu adalah Sava, seorang Chef handal yang akan memberikan rekomendasi makanan dan minuman yang ada di Restaurant Savoria, dibawah ini adalah beberapa makanan yang ada di Savoria. Dragonfire Grilled Chicken : Dragonfire Grilled Chicken adalah ayam panggang dengan saus pedas eksotis yang terbuat dari campuran cabai, rempah-rempah, dan madu. Disajikan dengan nasi goreng bawang putih dan sayuran rebus. Midnight Truffle Pasta : Midnight Truffle Pasta adalah pasta hitam yang diolah dengan saus krim truffle lembut, jamur porcini, dan parmesan. Zen Garden Sushi Bowl : Zen Garden Sushi Bowl adalah campuran sushi rice, potongan ikan salmon segar, alpukat, mentimun, dan tobiko. Diberi sentuhan saus ponzu yang menyegarkan dan taburan biji wijen. Vampire Slayer Burger : Vampire Slayer Burger adalah burger daging sapi panggang dengan saus bawang putih dan keju Swiss meleleh. Disajikan dengan kentang goreng truffle. Phoenix Rising Spicy Ramen : Phoenix Rising Spicy Ramen adalah mie ramen pedas dengan kuah kaldu tulang sapi yang kaya rasa, potongan daging sapi empuk, jamur shiitake, dan telur rebus. Disajikan dengan irisan daun bawang dan nori. Golden Tempura Udon : Golden Tempura Udon adalah mie udon hangat dengan kuah dashi, disertai dengan udang tempura garing, lobak, wortel, dan daun bawang"
        },
        {
          "role": "user",
          "content": question,
        }
      ]
    };

    try {
      Response response = await dio.post(
          'https://api.openai.com/v1/chat/completions',
          data: data,
          options: Options(contentType: Headers.jsonContentType));
      setState(() {
        _messages.add(Message(
            sender: 'ChatBot',
            text: response.data['choices'][0]['message']['content']));
      });
      print('Response: ${response.data.toString()}');
    } on DioError catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatBot'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                var message = _messages[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: message.sender == 'User'
                        ? Alignment.topRight
                        : Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: message.sender == 'User'
                            ? Colors.blue
                            : Colors.green,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        message.text,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    onSubmitted: (text) {
                      _sendMessage(text);
                      _messageController.clear();
                    },
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_messageController.text);
                    _messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
