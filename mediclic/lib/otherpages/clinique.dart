// otherpages/clinique.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediclic/otherpages/clniquedetails.dart';

class Clinique extends StatefulWidget {
  const Clinique({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CliniqueState();
  }
}

class _CliniqueState extends State {
  final List<String> _photo = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
  ];
  int selectedIndex = 0;
  final Stream<QuerySnapshot> _cliniqueStream =
      FirebaseFirestore.instance
          .collection('users')
          .where("profile", isEqualTo: "clinique")
          .snapshots();

  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    return StreamBuilder(
      stream: _cliniqueStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        return SizedBox(
          height: hauteur * 0.27,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = snapshot.data!.docs[index];
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              selectedIndex = index;
              return GestureDetector(
               onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailsClinique(
                          cliniqueName: data['name'],
                          cliniquePhone: data['phone'],
                          cliniquephoto: _photo[index % 3],
                        );
                      },
                    ),
                  );
                },
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
                                    ? AssetImage(_photo[0])
                                    : index % 3 == 1
                                    ? AssetImage(_photo[1])
                                    : AssetImage(_photo[2]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Clinique ${data['name']}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Row(
                        spacing: 5,
                        children: [
                          Icon(Icons.call, size: 20),
                          Text(
                            '${data['phone']}',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
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
