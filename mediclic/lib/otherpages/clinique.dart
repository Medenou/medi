// otherpages/clinique.dart
import 'package:flutter/material.dart';

class Clinique extends StatefulWidget {
  const Clinique({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CliniqueState();
  }
}

class _CliniqueState extends State {
  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    return SizedBox(
      height: hauteur * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return SizedBox(
            width: largeur * 0.4,
            height: hauteur * 0.3,
            child: Column(
              children: [
                Container(height: hauteur * 0.22, color: Colors.black),
                ListTile(
                  leading: Text('AZOVE'),
                  subtitle: Text('Abomey Calavi'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
