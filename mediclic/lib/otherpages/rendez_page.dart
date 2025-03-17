// otherpages/rendez_page.dart
import 'package:flutter/material.dart';

class RendezPage extends StatefulWidget {
  const RendezPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RendezPageState();
  }
}

class _RendezPageState extends State<RendezPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mes rendez-vous')),
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
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
                          title: Text("25 Mars 2025"),
                          titleAlignment: ListTileTitleAlignment.titleHeight,
                          titleTextStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black,
                          ),

                          subtitle: Text('14h30'),
                          subtitleTextStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          trailing: Column(
                          
                            children: [
                              Text('Clinique Saint Jean'),
                              Text('Cardiologie')
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
          ),
        ),
      ),
    );
  }
}
