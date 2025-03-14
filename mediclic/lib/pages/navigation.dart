// pages/navigation.dart
import 'package:flutter/material.dart';
import 'package:mediclic/otherpages/chatbot.dart';
import 'package:mediclic/pages/connexionpages/login_screen.dart';
import 'package:mediclic/pages/dossier_medical.dart';
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
  final List<Widget> pages = [Home(), DossierMedical(),LoginScreen(), Profil()];
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
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Dossier médical'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        unselectedItemColor: const Color.fromARGB(221, 60, 57, 57),

        selectedItemColor: Colors.green,
      ),
       floatingActionButton: selectedIndex == 0
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatBot()));
                },
                backgroundColor: Color(0xFF2E7D32),
                child: Icon(
                  Icons.smart_toy,
                  color: Colors.white,
                  size: 26,
                ),
              )
            : null);
    
  }
}
