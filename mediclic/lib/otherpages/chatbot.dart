import 'package:flutter/material.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChatBotState();
  }
}

class _ChatBotState extends State<ChatBot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Chatbot',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Icon(Icons.more_vert),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Stack(
            children: [
              Positioned(
                bottom: 20,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Décrivez votre mal svp',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: '''Qu'avez vous aujourd'hui ?''',
                          suffix: Icon(Icons.send),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
