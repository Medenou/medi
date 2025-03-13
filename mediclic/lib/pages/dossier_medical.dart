// pages/dossier_medical.dart
import 'package:flutter/material.dart';

class DossierMedical extends StatefulWidget {
  const DossierMedical({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DossierMedical();
  }
}

class _DossierMedical extends State<DossierMedical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Mon dossier Médical',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            IconButton(onPressed: null, icon: Icon(Icons.share)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mes informations Personnelles',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    ListTile(title: Text('Nom'), leading: Text('Moses kdk')),
                  ],
                ),
              ),
              Text(
                'Mes opérations antérieurs',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    ListTile(title: Text('Nom'), leading: Text('Moses kdk')),
                  ],
                ),
              ),
               Text(
                'Mes antécédents médicaux',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    ListTile(title: Text('Nom'), leading: Text('Moses kdk')),
                  ],
                ),
              ),
               Text(
                'Enquêtes sociales',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    ListTile(title: Text('Nom'), leading: Text('Moses kdk')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
