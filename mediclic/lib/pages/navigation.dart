import 'package:flutter/material.dart';
import 'package:mediclic/pages/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAppHome extends StatefulWidget {
  const MyAppHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppHomeState();
  }
}

class _MyAppHomeState extends State<MyAppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.green,
        title: HomeBar(),
      ),
      body: Home(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.calendarCheck, color: Colors.grey),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            label: 'Accueil',
          ),
        ],

        // fixedColor: const Color.fromARGB(221, 100, 100, 100),
        selectedItemColor: Colors.green,
      ),
    );
  }
}
