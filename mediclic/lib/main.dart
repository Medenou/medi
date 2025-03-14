// main.dart
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'pages/navigation.dart';
import 'package:flutter/material.dart';

// ../mediclinique/lib/main.dart

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyAppHome());
  }
}
