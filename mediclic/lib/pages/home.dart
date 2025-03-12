import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<String> specialites = [
    "Médecine Générale",
    "Cardiologie",
    "Dermatologie",
    "Neurologie",
    "Ophtalmologie",
    "Pédiatrie",
    "Gynécologie",
    "Orthopédie",
    "Psychiatrie",
    "Dentisterie",
    "Radiologie",

    "Endocrinologie",
    "Urologie",
    "Chirurgie Générale",
    "Médecine du Sport",
  ];
  List<IconData> specialitesIcons = [
    Icons.local_hospital, // Médecine Générale
    FontAwesomeIcons.heartPulse, // Cardiologie
    Icons.spa, // Dermatologie
    FontAwesomeIcons.brain, // Neurologie
    Icons.visibility, // Ophtalmologie
    Icons.child_care, // Pédiatrie
    Icons.pregnant_woman, // Gynécologie
    FontAwesomeIcons.bone, // Orthopédie
    FontAwesomeIcons.headSideVirus, // Psychiatrie
    FontAwesomeIcons.tooth, // Dentisterie
    FontAwesomeIcons.xRay, // Radiologie

    FontAwesomeIcons.dna, // Endocrinologie
    FontAwesomeIcons.prescriptionBottle, // Urologie
    Icons.content_cut, // Chirurgie Générale
    FontAwesomeIcons.personRunning, // Médecine du Sport
  ];
  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: 'Rechercher une clinique ou un spécialiste ',
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
                Container(
                  height: 50,
                  width: largeur * 0.22,
                  decoration: BoxDecoration(
                    color: Color(0xFF0095FF),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    'Consulter un spécialiste',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  height: 50,
                  width: largeur * 0.22,
                  decoration: BoxDecoration(
                    color: Color(0xFF0095FF),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    'Appeler une ambulance',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  height: 50,
                  width: largeur * 0.22,
                  decoration: BoxDecoration(
                    color: Color(0xFF0095FF),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    'chatbot',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  height: 50,
                  width: largeur * 0.22,
                  decoration: BoxDecoration(
                    color: Color(0xFF0095FF),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    'Prendre un rendez-vous',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
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
              height: largeur * 0.27,
              child: ListView.builder(
                itemCount: specialites.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: largeur * 0.27,
                    //  width: largeur * 0.25,
                    child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      height: largeur * 0.27,
                      width: largeur * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 5,
                        children: [
                          Icon(specialitesIcons[index]),

                          Text(
                            specialites[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Cliniques à proximité',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

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
