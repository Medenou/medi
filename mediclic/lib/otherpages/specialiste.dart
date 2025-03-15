// otherpages/specialiste.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Specialiste extends StatefulWidget {
  const Specialiste({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SpecialisteState();
  }
}

class _SpecialisteState extends State {
  final Stream<QuerySnapshot> _specialisteStream =
      FirebaseFirestore.instance.collection('medecins').snapshots();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    return StreamBuilder(
      stream: _specialisteStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        return SizedBox(
          height: hauteur * 0.3,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
               DocumentSnapshot document = snapshot.data!.docs[index];
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
              return GestureDetector(
                child: Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  width: largeur * 0.4,
                  height: hauteur * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: hauteur * 0.2,

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
                      SizedBox(height: 2),
                      Text(
                        'Docteur ${data['nom']}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '${data['specialiste']}',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
