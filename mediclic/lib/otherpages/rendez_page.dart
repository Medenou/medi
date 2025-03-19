// otherpages/rendez_page.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RendezPage extends StatefulWidget {
  const RendezPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RendezPageState();
  }
}

class _RendezPageState extends State<RendezPage> {
  late final Stream<QuerySnapshot> _infoStream =
      FirebaseFirestore.instance
          .collection('rendezvous')
          .where("patient", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mes rendez-vous')),
      body: SingleChildScrollView(
        child: SafeArea(
          child: StreamBuilder(
            stream: _infoStream,
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot,
            ) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }

              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = snapshot.data!.docs[index];
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Column(
                          spacing: 10,
                          children: [
                            ListTile(
                              title: Text("${data['date']}"),
                              titleAlignment:
                                  ListTileTitleAlignment.titleHeight,
                              titleTextStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black,
                              ),

                              subtitle: Text('${data['time']}'),
                              subtitleTextStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                              trailing: Column(
                                children: [
                                  Text('Clinique'),
                                  Text('${data['doctor']}'),
                                ],
                              ),

                              isThreeLine: true,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
