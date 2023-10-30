import 'package:flutter/material.dart';

class OpenChat extends StatefulWidget {
  const OpenChat({Key? key}) : super(key: key);

  @override
  _OpenChatState createState() => _OpenChatState();
}

class _OpenChatState extends State<OpenChat> {
  List<ChatMessage> messages = [];

  void _handleSubmitted(String text) {
    setState(() {
      messages.add(ChatMessage(
        text: text,
        isUserMessage: true,
      ));
      // Di sini Anda dapat menambahkan logika untuk mengirim pesan ke chatbot AI
      // Dan mendapatkan balasan dari chatbot AI
      // Misalnya: messages.add(ChatMessage(text: 'Balasan dari chatbot', isUserMessage: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Savoria Bot'),
        backgroundColor: Color.fromARGB(255, 66, 58, 50),
        toolbarHeight: 65,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (_, int index) => messages[index],
            ),
          ),
          _buildTextComposer(),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextField(
                  onSubmitted: _handleSubmitted,
                  decoration:
                      InputDecoration.collapsed(hintText: 'Send a message'),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _handleSubmitted('User message'),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment:
            isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: isUserMessage ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.all(10.0),
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
