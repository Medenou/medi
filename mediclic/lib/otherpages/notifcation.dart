// otherpages/notifcation.dart
import 'package:flutter/material.dart';

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NotificationState();
  }
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('mes notifications')),
    body: SafeArea(child: Column(
      children: [
        
      ],
    )
    ),);
  }
}
