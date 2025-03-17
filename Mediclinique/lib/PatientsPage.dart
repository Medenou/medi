import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PatientsPage extends StatelessWidget {
  const PatientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patients'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Gestion des Patients',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Gérez les informations de vos patients.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            _buildPatientsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientsList() {
    final patients = [
      {
        'name': 'Martin Dupont',
        'age': '35 ans',
        'lastVisit': '10/03/2025',
      },
      {
        'name': 'Sophie Lambert',
        'age': '28 ans',
        'lastVisit': '09/03/2025',
      },
      {
        'name': 'Jean Petit',
        'age': '42 ans',
        'lastVisit': '08/03/2025',
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: patients.length,
      itemBuilder: (context, index) {
        final patient = patients[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(patient['name'] as String),
            subtitle: Text(
              '${patient['age']} - Dernière visite: ${patient['lastVisit']}',
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Détails du patient ${patient['name']} - Fonctionnalité à venir',
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