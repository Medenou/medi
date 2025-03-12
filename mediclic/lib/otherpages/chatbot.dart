// otherpages/chatbot.dart
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Essayez de décrire votre mal',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      //bottomNavigationApp
      bottomNavigationBar: SingleChildScrollView(child: 
       BottomAppBar(
        height: 120,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            spacing: 10,
            children: [
              TextField(
                
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: '''Qu'avez vous aujourd'hui ?''',
                 suffix: Icon(Icons.check),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 8,
                      children: [
                        Icon(
                          Icons.add_a_photo,
                          
                        ),
                        Text('Prendre une photo'),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ],
          ),
        ),
      ),),
    );
  }
}
