import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

// Modèle pour un rendez-vous
class RendezVous {
  final String? id;
  final String patient;
  final String doctor;
  final String time;
  final String date;
  final String statut; // en attente, confirmé, annulé, reporté

  RendezVous({
    this.id,
    required this.patient,
    required this.doctor,
    required this.time,
    required this.date,
    required this.statut,
  });

  Map<String, dynamic> toMap() {
    return {
      'patient': patient,
      'doctor': doctor,
      'time': time,
      'date': date,
      'statut': statut,
    };
  }

  factory RendezVous.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return RendezVous(
      id: doc.id,
      patient: data['patient'] ?? '',
      doctor: data['doctor'] ?? '',
      time: data['time'] ?? '',
      date: data['date'] ?? '',
      statut: data['statut'] ?? 'en attente',
    );
  }
}

class RendezVousPage extends StatefulWidget {
  const RendezVousPage({Key? key}) : super(key: key);

  @override
  _RendezVousPageState createState() => _RendezVousPageState();
}

class _RendezVousPageState extends State<RendezVousPage> {
  final CollectionReference rendezVousCollection = 
      FirebaseFirestore.instance.collection('rendezvous');
  
  @override
  void initState() {
    super.initState();
    _checkAndCreateInitialData();
  }

  Future<void> _checkAndCreateInitialData() async {
    final snapshot = await rendezVousCollection.limit(1).get();
    if (snapshot.docs.isEmpty) {
      // Créer des données initiales si la collection est vide
      await rendezVousCollection.add({
        'patient': 'Martin Dupont',
        'doctor': 'Dr. Lefèvre',
        'time': '15:00',
        'date': '18/03/2025',
        'statut': 'confirmé'
      });
      
      await rendezVousCollection.add({
        'patient': 'Sophie Lambert',
        'doctor': 'Dr. Moreau',
        'time': '16:00',
        'date': '19/03/2025',
        'statut': 'en attente'
      });
      
      await rendezVousCollection.add({
        'patient': 'Jean Petit',
        'doctor': 'Dr. Dubois',
        'time': '17:00',
        'date': '20/03/2025',
        'statut': 'reporté'
      });
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmé':
        return Colors.green;
      case 'en attente':
        return Colors.orange;
      case 'annulé':
        return Colors.red;
      case 'reporté':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'confirmé':
        return Icons.check_circle;
      case 'en attente':
        return Icons.hourglass_empty;
      case 'annulé':
        return Icons.cancel;
      case 'reporté':
        return Icons.update;
      default:
        return Icons.help;
    }
  }

  Future<void> _showAddEditRendezVousDialog([RendezVous? rdv]) async {
    final TextEditingController patientController = 
        TextEditingController(text: rdv?.patient ?? '');
    final TextEditingController doctorController = 
        TextEditingController(text: rdv?.doctor ?? '');
    final TextEditingController timeController = 
        TextEditingController(text: rdv?.time ?? '');
    final TextEditingController dateController = 
        TextEditingController(text: rdv?.date ?? '');
    
    String selectedStatus = rdv?.statut ?? 'en attente';
    final List<String> statusOptions = [
      'en attente', 'confirmé', 'annulé', 'reporté'
    ];

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(rdv == null ? 'Ajouter un rendez-vous' : 'Modifier le rendez-vous'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: patientController,
                decoration: const InputDecoration(
                  labelText: 'Patient',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: doctorController,
                decoration: const InputDecoration(
                  labelText: 'Docteur',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: timeController,
                decoration: const InputDecoration(
                  labelText: 'Heure (HH:MM)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
                onTap: () async {
                  final TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null) {
                    timeController.text = '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
                  }
                },
              ),
              const SizedBox(height: 12),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(
                  labelText: 'Date (JJ/MM/AAAA)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (picked != null) {
                    dateController.text = DateFormat('dd/MM/yyyy').format(picked);
                  }
                },
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: selectedStatus,
                decoration: const InputDecoration(
                  labelText: 'Statut',
                  border: OutlineInputBorder(),
                ),
                items: statusOptions.map((String status) {
                  return DropdownMenuItem<String>(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    selectedStatus = newValue;
                  }
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (patientController.text.isEmpty || 
                  doctorController.text.isEmpty ||
                  timeController.text.isEmpty ||
                  dateController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Tous les champs sont requis')),
                );
                return;
              }

              final newRdv = RendezVous(
                id: rdv?.id,
                patient: patientController.text,
                doctor: doctorController.text,
                time: timeController.text,
                date: dateController.text,
                statut: selectedStatus,
              );

              if (rdv == null) {
                // Ajouter un nouveau rendez-vous
                await rendezVousCollection.add(newRdv.toMap());
              } else {
                // Mettre à jour un rendez-vous existant
                await rendezVousCollection.doc(rdv.id).update(newRdv.toMap());
              }

              Navigator.pop(context);
              setState(() {}); // Rafraîchir l'UI
            },
            child: Text(rdv == null ? 'Ajouter' : 'Mettre à jour'),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDeleteRendezVous(String id) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmer la suppression'),
        content: const Text('Êtes-vous sûr de vouloir supprimer ce rendez-vous ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () async {
              await rendezVousCollection.doc(id).delete();
              Navigator.pop(context);
              setState(() {}); // Rafraîchir l'UI
            },
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }

  Future<void> _showRendezVousDetails(RendezVous rdv) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Rendez-vous avec ${rdv.patient}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailItem('Patient', rdv.patient),
            _buildDetailItem('Docteur', rdv.doctor),
            _buildDetailItem('Date', rdv.date),
            _buildDetailItem('Heure', rdv.time),
            _buildDetailItem('Statut', rdv.statut, _getStatusColor(rdv.statut)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showAddEditRendezVousDialog(rdv);
            },
            child: const Text('Modifier'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value, [Color? valueColor]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    final List<String> statusOptions = [
      'Tous', 'en attente', 'confirmé', 'annulé', 'reporté'
    ];
    String selectedFilter = 'Tous';

    return StatefulBuilder(
      builder: (context, setState) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: statusOptions.map((String status) {
              bool isSelected = selectedFilter == status;
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: FilterChip(
                  label: Text(status),
                  selected: isSelected,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedFilter = selected ? status : 'Tous';
                    });
                    // Rafraîchir la liste principale
                    this.setState(() {});
                  },
                  backgroundColor: Colors.grey[200],
                  selectedColor: status == 'Tous' 
                      ? Colors.blue[100] 
                      : _getStatusColor(status).withOpacity(0.2),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rendez-vous'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implémenter la recherche
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Recherche - Fonctionnalité à venir')),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Gestion des Rendez-vous',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Planifiez et gérez les rendez-vous de vos patients.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                _buildFilterChips(),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: rendezVousCollection.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Erreur: ${snapshot.error}'));
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('Aucun rendez-vous trouvé'),
                  );
                }

                List<RendezVous> rendezVousList = snapshot.data!.docs
                    .map((doc) => RendezVous.fromFirestore(doc))
                    .toList();

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: rendezVousList.length,
                  itemBuilder: (context, index) {
                    final rdv = rendezVousList[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: InkWell(
                        onTap: () => _showRendezVousDetails(rdv),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      rdv.patient,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _getStatusColor(rdv.statut).withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          _getStatusIcon(rdv.statut),
                                          size: 16,
                                          color: _getStatusColor(rdv.statut),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          rdv.statut,
                                          style: TextStyle(
                                            color: _getStatusColor(rdv.statut),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.person, size: 16, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text(
                                    rdv.doctor,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text(
                                    rdv.date,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(width: 16),
                                  const Icon(Icons.access_time, size: 16, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text(
                                    rdv.time,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit, color: Colors.blue),
                                    onPressed: () => _showAddEditRendezVousDialog(rdv),
                                    tooltip: 'Modifier',
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.red),
                                    onPressed: () => _confirmDeleteRendezVous(rdv.id!),
                                    tooltip: 'Supprimer',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEditRendezVousDialog(),
        tooltip: 'Ajouter un rendez-vous',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Widget principal pour intégrer la page de rendez-vous dans l'application
class AppointmentApp extends StatelessWidget {
  const AppointmentApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion de Rendez-vous',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          elevation: 1,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const RendezVousPage(),
    );
  }
}