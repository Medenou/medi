// otherpages/heure_date.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';

// ...

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");

  BasicDateField({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Choississez le jour (${format.pattern})'),
        DateTimeField(
          decoration: InputDecoration(border: OutlineInputBorder()),
          format: format,
          onShowPicker: (context, currentValue) {
            return showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2026),
            );
          },
        ),
      ],
    );
  }
}

class BasicTimeField extends StatelessWidget {
  final format = DateFormat("HH:mm");

  BasicTimeField({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Choissisez votre heure de rendez-vous (${format.pattern})'),
        DateTimeField(
          /* validator: (value) {
            if(value==null||value.isAfter())
          },*/
          decoration: InputDecoration(border: OutlineInputBorder()),
          format: format,
          onShowPicker: (context, currentValue) async {
            final time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(
                currentValue ?? DateTime.now(),
              ),
            );
            return DateTimeField.convert(time);
          },
        ),
      ],
    );
  }
}

Future<void> priseRendezVous(
  String cliniqueNom,
  String date,
  String heure,
) async {
  await FirebaseFirestore.instance.collection('rendezvous').add({
    "patient": FirebaseAuth.instance.currentUser?.uid,
    "doctor": cliniqueNom,
    "date": date,
    "time": heure,
    "statut": "pending",
  });
}
List<String> cliniqueNoms()  {
  final QuerySnapshot snapshot =  FirebaseFirestore.instance
      .collection('users')
      .where("profile", isEqualTo: "clinique")
      .get() as QuerySnapshot<Object?>;

  List<String> cliniques = snapshot.docs.map((doc) => doc['nom'].toString()).toList();
  return cliniques;
}

