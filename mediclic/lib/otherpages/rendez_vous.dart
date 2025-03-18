// otherpages/rendez_vous.dart
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mediclic/otherpages/heure_date.dart';

class RendezVous extends StatefulWidget {
  const RendezVous({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RendezVousState();
  }
}

class _RendezVousState extends State<RendezVous> {
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController hopitalNom = TextEditingController();
  final formatTime = DateFormat("HH:mm");
  final formatDate = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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

          TextFormField(
            controller: hopitalNom,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              hintText: 'Choississez votre  clinique',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            validator: (value) {
              value = value?.trim();
              if (value == null || value.isEmpty) {
                return "Entrez une clinique valide";
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          Text('Choississez le jour (${formatDate.pattern})'),
          DateTimeField(
            controller: date,
            validator: (value) {
              if (value == null) {
                return "Entrez un jour valide";
              }
              return null;
            },
            decoration: InputDecoration(border: OutlineInputBorder()),
            format: formatDate,
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2026),
              );
            },
          ),
          SizedBox(height: 10),
          Text('Choissisez votre heure de rendez-vous (${formatTime.pattern})'),
          DateTimeField(
            validator: (value) {
              if (value == null) {
                return "Entrez une heure valide";
              }
              return null;
            },
            controller: time,
            decoration: InputDecoration(border: OutlineInputBorder()),
            format: formatTime,
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

          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              priseRendezVous(hopitalNom.text, date.text, time.text);
              Navigator.pop(context);
            },
            child: Center(
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 60,
                decoration: BoxDecoration(
                  color: Color(0xFF2E7D32),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Center(
                  child: Text(
                    'Prendre rendez-vous',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
