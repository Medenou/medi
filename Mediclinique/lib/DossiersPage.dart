import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DossiersPage extends StatelessWidget {
  const DossiersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dossiers Médicaux'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dossiers Médicaux',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Accédez aux dossiers médicaux de vos patients.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            _buildMedicalRecordsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicalRecordsList() {
    final records = [
      {
        'patient': 'Martin Dupont',
        'doctor': 'Dr. Lefèvre',
        'lastVisit': '10/03/2025',
      },
      {
        'patient': 'Sophie Lambert',
        'doctor': 'Dr. Moreau',
        'lastVisit': '09/03/2025',
      },
      {
        'patient': 'Jean Petit',
        'doctor': 'Dr. Dubois',
        'lastVisit': '08/03/2025',
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: records.length,
      itemBuilder: (context, index) {
        final record = records[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.folder)),
            title: Text(record['patient'] as String),
            subtitle: Text(
              '${record['doctor']} - Dernière visite: ${record['lastVisit']}',
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Détails du dossier de ${record['patient']} - Fonctionnalité à venir',
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