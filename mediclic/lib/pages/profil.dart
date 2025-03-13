// pages/profil.dart

import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Profil();
  }
}

class _Profil extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    double largeurEcran = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: ProfilBar(),
      ),
      body :Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
             
              child: Column(
              
                spacing: 10,
                children: [
                  CircleAvatar(
                    radius: 50,
                    
                  
                  //  child: Image.asset('assets/Group 32.png'),
                  ),
                  Text('Moses kdk')
                ],
              ),
            ),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: largeurEcran * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.person,
                        size: 26,
                      ),
                      Text(
                        'Mes informations personnelles',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_right_outlined,
                  size: 26,
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
                width: largeurEcran * 0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Icon(
                      Icons.share,
                      size: 26,
                    ),
                    Text(
                      'Partager mon dossier médicale',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Icon(
                Icons.arrow_right_outlined,
                size: 26,
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 5,
                    children: [
                      Icon(
                        Icons.settings,
                        size: 26,
                      ),
                      Text(
                        'Paramètres',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_right_outlined,
                  size: 26,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: largeurEcran * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 5,
                    children: [
                      Icon(
                        Icons.info,
                        size: 26,
                      ),
                      Text(
                        'A propos de nous',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_right_outlined,
                  size: 26,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
              
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Icon(
                          Icons.logout_outlined,
                          size: 26,
                          color: Colors.red,
                        ),
                        Text(
                          'Se deconnecter',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}

class ProfilBar extends StatelessWidget {
  const ProfilBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text(
        'Moses kdk',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      Icon(
        Icons.arrow_drop_down,
        color: Colors.black,
      ),
    ]);
  }
}
