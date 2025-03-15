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
  int selectedIndex = 0;
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
          selectedIndex = index;
          return GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              width: largeur * 0.4,
              height: hauteur * 0.3,
              child: Column(
                children: [
                  Container(
                    height: hauteur * 0.22,

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            index % 3 == 0
                                ? AssetImage('assets/image1.png')
                                : index % 3 == 1
                                ? AssetImage('assets/image2.png')
                                : AssetImage('assets/image3.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  ListTile(
                    leading: Text('AZOVE'),
                    subtitle: Text('Abomey Calavi'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
