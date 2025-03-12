// pages/navigation.dart
import 'package:flutter/material.dart';
import 'package:mediclic/pages/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mediclic/pages/profil.dart';

class MyAppHome extends StatefulWidget {
  const MyAppHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppHomeState();
  }
}

class _MyAppHomeState extends State<MyAppHome> {
  final List<Widget> pages = [Home(), Scaffold(),Scaffold(), Profil()];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.calendarCheck),
            label: 'Consultations',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        unselectedItemColor: const Color.fromARGB(221, 60, 57, 57),

        selectedItemColor: Colors.green,
      ),
    );
  }
}
