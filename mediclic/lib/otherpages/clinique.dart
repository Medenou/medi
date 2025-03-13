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
      height: hauteur * 0.4,
      child: ListView.builder(itemBuilder: (context, index) {return
      SizedBox(
        height: hauteur*0.1,
        child: Container(

        ),
      );}),
    );
  }
}
