// otherpages/rendez_vous2.dart
import 'package:flutter/material.dart';

class RendezVousClinique extends StatelessWidget {
  final String nomClinique;
  const RendezVousClinique({super.key, required this.nomClinique});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 2,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            enabled: false,
            decoration: InputDecoration(
             // suffixIcon: Icon(Icons.search),
              label:Text( nomClinique),
              labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
