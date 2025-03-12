// otherpages/clniquedetails.dart
import 'package:flutter/material.dart';

class DetailsClinique extends StatefulWidget {
  const DetailsClinique({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DetailsClinique();
  }
}

class _DetailsClinique extends State<DetailsClinique> {
  @override
  Widget build(BuildContext context) {
    double hauteurEcran = MediaQuery.of(context).size.height;
    double largeurEcran = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Text('Clinique', style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Padding(padding: 
      EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(
          height: largeurEcran*0.45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10,
            children: [
              Container(
                height: largeurEcran*0.42,
                width: largeurEcran*0.4,
                decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
              SizedBox(
                width: largeurEcran*0.5,
                height: largeurEcran*0.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Divine Miséricorde', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Row(spacing: 10,children: [
                      Icon(Icons.home), 
                      Text('Visits')
                    ],),
                    Row(spacing: 10,children: [
                      Icon(Icons.badge), 
                      Text('''Année d'expérience''')
                    ]),
                  ],
                ),
              )
            ],
          ),
        )
        ],
      ),),
    );
  }
}
