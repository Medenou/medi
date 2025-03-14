// pages/home.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mediclic/otherpages/chatbot.dart';
import 'package:mediclic/otherpages/clinique.dart';
import 'package:mediclic/otherpages/rendez_vous.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List<String> specialites = [
    "Médecin Généraliste",
    "Cardiologue",
    "Dermatologue",
    "Neurologue",
    "Ophtalmologue",
    "Pédiatrue",
    "Gynécologue",
    "Orthopéde",
    "Psychiatre",
    "Dentiste",
    "Radiologue",

    "Endocrinologue",
    "Urologue",
    "Chirurgien ",
    "Médecine du Sport",
  ];
  List<IconData> specialitesIcons = [
    Icons.local_hospital,
    FontAwesomeIcons.heartPulse,
    Icons.spa,
    FontAwesomeIcons.brain,
    Icons.visibility,
    Icons.child_care,
    Icons.pregnant_woman,
    FontAwesomeIcons.bone,
    FontAwesomeIcons.headSideVirus,
    FontAwesomeIcons.tooth,
    FontAwesomeIcons.xRay,

    FontAwesomeIcons.dna,
    FontAwesomeIcons.prescriptionBottle,
    Icons.content_cut,
    FontAwesomeIcons.personRunning,
  ];
  @override
  Widget build(BuildContext context) {
    double largeur = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: HomeBar()),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: 'Rechercher une clinique/un spécialiste',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),

            SizedBox(height: 15),
            Text(
              'Actions rapides',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    height: 50,
                    width: largeur * 0.22,
                    decoration: BoxDecoration(
                      color: Color(0xFF2E7D32),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.medical_services, color: Colors.white),
                        Text(
                          'Consult',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.redAccent,
                          content: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.call, color: Colors.white),
                              SizedBox(width: 2),
                              Text(
                                'Appeler une ambulance ?',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text(
                                'Non',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text(
                                'Oui',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 50,
                    width: largeur * 0.22,
                    decoration: BoxDecoration(
                      color: Color(0xFF2E7D32),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.local_hospital, color: Colors.white),
                        Text(
                          'Urgence',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ChatBot();
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: largeur * 0.22,
                    decoration: BoxDecoration(
                      color: Color(0xFF2E7D32),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.smart_toy, color: Colors.white),
                        Text(
                          'Chatbot',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      elevation: 20,
                      context: context,
                      builder: (context) {
                        return RendezVous();
                      },
                    );
                  },
                  child: Container(
                    height: 50,
                    width: largeur * 0.22,
                    decoration: BoxDecoration(
                      color: Color(0xFF2E7D32),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.calendar_today, color: Colors.white),
                        Text(
                          'Rendez-vous',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              'Specialistes de la santé',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: largeur * 0.23,
              child: ListView.builder(
                itemCount: specialites.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },

                    child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                      height: largeur * 0.2,
                      width: largeur * 0.28,
                      child: Container(
                        padding: EdgeInsets.only(left: 5, right: 5),

                        decoration: BoxDecoration(
                          color:
                              selectedIndex == index
                                  ? Color(0xFF2E7D32)
                                  : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 5,
                          children: [
                            Icon(
                              specialitesIcons[index],
                              color:
                                  selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                            ),

                            Text(
                              specialites[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Cliniques à proximité',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Clinique(),
             SizedBox(height: 10),
            Text(
              'Spécialistes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

//HomeBar
class HomeBar extends StatelessWidget {
  const HomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 10,
          children: [
            Icon(Icons.location_on, size: 28),
            Text(
              'SOS Abomey-Calavi',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        Icon(Icons.notifications, size: 26),
      ],
    );
  }
}
