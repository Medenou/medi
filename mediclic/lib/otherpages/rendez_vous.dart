// otherpages/rendez_vous.dart
import 'package:flutter/material.dart';

class RendezVous extends StatefulWidget {
  const RendezVous({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RendezVousState();
  }
}

class _RendezVousState extends State<RendezVous> {
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
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: 'Choississez votre  clinique',
                border: OutlineInputBorder(
                    
                    borderRadius: BorderRadius.all(Radius.circular(10))
                )
            ),
          ),
        ],
      ),
    );
  }
}
